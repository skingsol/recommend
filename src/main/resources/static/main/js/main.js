//---------------------------------------------------------------//
//    대문 이미지 슬라이드
//---------------------------------------------------------------//

var slideIndex = 0;
showSlides();

function showSlides() {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  slideIndex++;
  if (slideIndex > slides.length) {
    slideIndex = 1;
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex - 1].style.display = "block";
  dots[slideIndex - 1].className += " active";
  setTimeout(showSlides, 3000); // 3초마다 슬라이드 변경
}

//---------------------------------------------------------------//
//    업체명 글자수 제한
//---------------------------------------------------------------//
subName();
function subName() {
  const innerText = document.querySelectorAll(".restaurant_name");
  innerText.forEach((element) => {
    const shortName = element.innerHTML.substring(0, 10);
    element.innerHTML = shortName;
  });
}

//----------------------------------------------------
//  카테고리 아이콘 클릭 시 해당 카테고리 api 가져와서 보여주기
//----------------------------------------------------

const special = document.querySelector(".special");
const restaurant_link = document.querySelector(".loop_section");
special.addEventListener("click", (e) => {
  //어느 카테고리가 클릭이 되었는가?
  const category = e.target.dataset.genre;
  console.log("내가 선택한 카테고리:", category);
  //카테고리 이름 변경하기
  const foodCategory = document.querySelector(".food_category_name");
  foodCategory.innerHTML = "#" + category;

  //기존 정보(메인)를 가져온 후에 새로운 api 정보를 jsp에 담기
  fetch("/api/main?query=" + category)
    .then((response) => {
      if (!response.ok) {
        throw new Error("잘못된 요청");
      }
      return response.json();
    })
    .then((data) => {
      console.log(data);
      let str = "";
      data.forEach((element) => {
        //console.log(element);
        //str += "<c:forEach var='food' items='${list }'>";
        str +=
          "<div class='w-full md:w-1/3 xl:w-1/4 p-6 flex flex-col hover:grow hover:shadow-lg restaurant_link'>";
        str += "<a href='' class='image_link'>";
        str +=
          "<img id='image_link' src='" +
          element.imageLink +
          "' style='width: 205px; height: 235px;' data-title='" +
          element.title +
          "'></a>";
        str += "<div id='shortcuts' class='pt-3 flex items-center'>";
        str += "<div class='line_diveider'>";
        str += "<a href='...' id='store_name'>";
        str += "<span class='restaurant_name'>" + element.title + "</span>";
        str += "<strong class='point search_point'>";
        str += "</strong></a></p>";
        str += "</div>";
        str += "<div class='save_restaurant'>";
        str += "<span class='icon is-small'></span> &nbsp;<span class='like-num'></span>";
        str += "</div></div></div>";

        //str = "</c:forEach>";
      });
      //console.log(str);
      restaurant_link.innerHTML = "";
      restaurant_link.innerHTML = str;
      subName();
    })
    .catch((error) => console.log(error));
});

//----------------------------------------------------//
//  검색 아이콘 클릭 시 검색결과 페이지로 이동
//----------------------------------------------------//
// const searchForm = document.querySelector("#searchForm");
// searchForm.addEventListener("submit", (e) => {
//   e.preventDefault();
//   const keyword = document.querySelector(".search_input");
//   if (keyword.value === "") {
//     alert("검색어를 입력하세요");
//     keyword.focus();
//     return;
//   }
//   console.log("키워드 내용", keyword.value);
//   //searchForm.setAttribute("action", "/api/search?query=" + keyword.value);
//   // console.log("서치폼 링크", searchForm.getAttribute("action"));
//   // searchForm.submit();
// });

//---------------------------------------------------------------//
//    맛집 위시리스트 저장 / 이미 저장된 맛집은 채워진 하트로 표시
//---------------------------------------------------------------//

// // 가상의 저장된 식당 데이터 (가정)
// let savedRestaurants = [];

// // 클릭 이벤트 핸들러 함수
// function handleSaveRestaurant(event) {
//   const icon = event.target;
//   const restaurantElement = icon.closest(".save_restaurant");

//   // 식당 데이터 가져오기
//   const restaurantData = {
//     // 식당에 대한 데이터를 가져오는 방법에 따라 필요한 정보를 여기에 추가해주세요
//   };

//   // 이미 저장된 식당인지 확인
//   const isSaved = savedRestaurants.some((savedRestaurant) => {
//     // 이미 저장된 식당을 식별하는 기준에 따라 비교해주세요
//     // 예시: savedRestaurant.id === restaurantData.id
//   });

//   if (isSaved) {
//     // 이미 저장된 식당이라면 저장 취소 처리
//     savedRestaurants = savedRestaurants.filter((savedRestaurant) => {
//       // 삭제 조건을 설정해주세요
//       // 예시: savedRestaurant.id !== restaurantData.id
//     });

//     // 아이콘 변경
//     icon.classList.remove("fa-heart");
//     icon.classList.add("fa-heart-o");
//   } else {
//     // 식당을 저장할 경우
//     savedRestaurants.push(restaurantData);

//     // 아이콘 변경
//     icon.classList.remove("fa-heart-o");
//     icon.classList.add("fa-heart");
//   }

//   // 저장된 식당 수 업데이트
//   const likeNumElement = restaurantElement.querySelector(".like-num");
//   likeNumElement.textContent = savedRestaurants.length;
// }

// // fa-heart-o 아이콘 클릭 이벤트 리스너 등록
// const heartIcon = document.querySelector(".fa-heart-o");
// heartIcon.addEventListener("click", handleSaveRestaurant);

//---------------------------------------------------------------//
