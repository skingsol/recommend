btn_addr.addEventListener("click", () => {
    console.log("addr_code : ", addr_code.value);
    console.log("type_code : ", type_code.value);
    console.log("search_code : ", search_code.value);
    let url = "";
    if (addr_code.value) {
      url =
        "https://apis.data.go.kr/B551011/KorService1/searchStay1?numOfRows=100&MobileOS=ETC&MobileApp=APPtest&_type=json&areaCode=" +
        addr_code.value +
        "&serviceKey=KPX00nbUJjy6lFKETU%2FymNP%2BKbcHYN13m5Scu%2Fm6zQ1w2Fh1aiA6Xp9w8Qghnx7nyiOolBhGricu%2BT5es2t8%2FQ%3D%3D";
    }
    fetch(url)
      .then((response) => {
        if (!response.ok) {
          throw new Error("데이터 확인");
        }
        return response.json();
      })
      .then((data) => {
        item = data.response.body.items.item;
  
        //----------------------------------------------positions=지도 x,y좌표 배열
        var positions = [];
        item.forEach((element) => {
          //지도 마커 생성 포이치
          let new_marker = new kakao.maps.LatLng(element.mapy, element.mapx);
  
          positions.push(new_marker);
        });
        var MARKER_WIDTH = 29, // 기본, 클릭 마커의 너비
          MARKER_HEIGHT = 42, // 기본, 클릭 마커의 높이
          SPRITE_MARKER_URL = "https://t1.daumcdn.net/mapjsapi/images/marker.png", // 스프라이트 마커 이미지 URL
          SPRITE_WIDTH = 29, // 스프라이트 이미지 너비
          SPRITE_HEIGHT = 42, // 스프라이트 이미지 높이
          SPRITE_GAP = 30; // 스프라이트 이미지에서 마커간 간격
  
        var markerSize = new kakao.maps.Size(MARKER_WIDTH, MARKER_HEIGHT), // 기본, 클릭 마커의 크기
          markerOffset = new kakao.maps.Point(OFFSET_X, OFFSET_Y), // 기본, 클릭 마커의 기준좌표
          overMarkerSize = new kakao.maps.Size(OVER_MARKER_WIDTH, OVER_MARKER_HEIGHT), // 오버 마커의 크기
          overMarkerOffset = new kakao.maps.Point(OVER_OFFSET_X, OVER_OFFSET_Y), // 오버 마커의 기준 좌표
          spriteImageSize = new kakao.maps.Size(SPRITE_WIDTH, SPRITE_HEIGHT); // 스프라이트 이미지의 크기
        var selectedMarker = null; // 클릭한 마커를 담을 변수
  
        var mapContainer = document.getElementById("map"), // 지도를 표시할 div
          mapOption = {
            center: new kakao.maps.LatLng(positions[0].Ma, positions[0].La), // 지도의 중심좌표
            level: 10, // 지도의 확대 레벨
          };
  
        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
  
        // 지도 위에 마커를 표시합니다
        for (var i = 0, len = positions.length; i < len; i++) {
          var gapX = MARKER_WIDTH + SPRITE_GAP, // 스프라이트 이미지에서 마커로 사용할 이미지 X좌표 간격 값
            originY = (MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 기본, 클릭 마커로 사용할 Y좌표 값
            overOriginY = (OVER_MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 오버 마커로 사용할 Y좌표 값
            normalOrigin = new kakao.maps.Point(0), // 스프라이트 이미지에서 기본 마커로 사용할 영역의 좌상단 좌표
            clickOrigin = new kakao.maps.Point(0), // 스프라이트 이미지에서 마우스오버 마커로 사용할 영역의 좌상단 좌표
            overOrigin = new kakao.maps.Point(0); // 스프라이트 이미지에서 클릭 마커로 사용할 영역의 좌상단 좌표
  
          // 마커를 생성하고 지도위에 표시합니다
          addMarker(positions[i], normalOrigin, overOrigin, clickOrigin);
  
          // 마커를 생성하고 지도위에 표시합니다
          addMarker(positions[i], normalOrigin, overOrigin, clickOrigin);
        }
  
        // 마커를 생성하고 지도 위에 표시하고, 마커에 mouseover, mouseout, click 이벤트를 등록하는 함수입니다
        function addMarker(position, normalOrigin, overOrigin, clickOrigin) {
          // 기본 마커이미지, 오버 마커이미지, 클릭 마커이미지를 생성합니다
          var normalImage = createMarkerImage(markerSize, markerOffset, normalOrigin),
            overImage = createMarkerImage(overMarkerSize, overMarkerOffset, overOrigin),
            clickImage = createMarkerImage(markerSize, markerOffset, clickOrigin);
  
          // 마커를 생성하고 이미지는 기본 마커 이미지를 사용합니다
          var marker = new kakao.maps.Marker({
            map: map,
            position: position,
            image: normalImage,
          });
  
          // 마커 객체에 마커아이디와 마커의 기본 이미지를 추가합니다
          marker.normalImage = normalImage;
  
          //------------------------시작-------------------------------------------숙박=========마커와 숙박api객체 연동하기==============
          // 마커에 mouseover 이벤트를 등록합니다
          var roundedNumber1 = marker.getPosition().Ma.toFixed(10);
          var apiMarker = {};
          item.forEach((element) => {
            if (roundedNumber1 == element.mapy) {
              apiMarker = element;
            }
          });
          //-------------------------종료-------------------------------------------숙박=========마커와 숙박api객체 연동하기==============
          var iwContent = '<div style="padding:5px;">' + apiMarker.title + "</div>";
          var infowindow = new kakao.maps.InfoWindow({
            content: iwContent,
          });
          //-------------------------------------------숙박-------------마커 마우스포커스 이벤트-----------------시작------------------------
          kakao.maps.event.addListener(marker, "mouseover", function () {
            // 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면
            // 마커의 이미지를 오버 이미지로 변경합니다
            infowindow.open(map, marker);
            if (!selectedMarker || selectedMarker !== marker) {
              marker.setImage(overImage);
            }
          });
          // 마커에 mouseout 이벤트를 등록합니다
          kakao.maps.event.addListener(marker, "mouseout", function () {
            // 클릭된 마커가 없고, mouseout된 마커가 클릭된 마커가 아니면
            // 마커의 이미지를 기본 이미지로 변경합니다
            infowindow.close();
            if (!selectedMarker || selectedMarker !== marker) {
              marker.setImage(normalImage);
            }
          });
          //-------------------------------------------숙박-------------마커 마우스포커스 이벤트-=-------------종료------------------------
          // 마커에 click 이벤트를 등록합니다
          kakao.maps.event.addListener(marker, "click", function () {
            //---------------------------------------------------------------------숙박-------------마커로 숙박정보가져오기------
            var modalTitle = document.querySelector("#exampleModalLabel");
            var modalContent = document.querySelector("#modal-content");
            var modalLike = document.querySelector("#modal-like");
            modalTitle.innerHTML = apiMarker.title;
            if (apiMarker.firstimage != "")
              modalContent.innerHTML = "<img src='" + apiMarker.firstimage + "'>";
            else modalContent.innerHTML = "이미지가 없습니다";
            modalLike.innerHTML = "찜하기";
            document.querySelector("#modal-test").click();
            //---------------------------------------------------------------------숙박-------------마커로 숙박정보가져오기------
            // 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
            // 마커의 이미지를 클릭 이미지로 변경합니다
            if (!selectedMarker || selectedMarker !== marker) {
              // 클릭된 마커 객체가 null이 아니면
              // 클릭된 마커의 이미지를 기본 이미지로 변경하고
              !!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);
  
              // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
              marker.setImage(clickImage);
            }
  
            // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
            selectedMarker = marker;
          });
        }
  
        // MakrerImage 객체를 생성하여 반환하는 함수입니다
        function createMarkerImage(markerSize, offset, spriteOrigin) {
          var markerImage = new kakao.maps.MarkerImage(
            SPRITE_MARKER_URL, // 스프라이트 마커 이미지 URL
            markerSize, // 마커의 크기
            {
              offset: offset, // 마커 이미지에서의 기준 좌표
              spriteOrigin: spriteOrigin, // 스트라이프 이미지 중 사용할 영역의 좌상단 좌표
              spriteSize: spriteImageSize, // 스프라이트 이미지의 크기
            }
          );
  
          return markerImage;
        }
      })
      .catch((error) => console.log(error));
  });