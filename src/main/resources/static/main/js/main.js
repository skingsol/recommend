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

//----------------------------------------------------
//  카테고리 아이콘 클릭 시 해당 카테고리 api 가져와서 보여주기
//----------------------------------------------------

const special = document.querySelector(".special");

special.addEventListener("click", (e) => {
  //어느 카테고리가 클릭이 되었는가?
  const category = e.target.dataset.genre;
  console.log("내가 선택한 카테고리:", category);
  //카테고리 이름 변경하기
  const foodCategory = document.querySelector(".food_category_name");
  foodCategory.innerHTML = "#" + category;

  //기존 정보(메인)를 가져온 후에 새로운 api 정보를 jsp에 담기
  fetch("/api/server/search?query=" + category)
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
        "<c:forEach var='food' items='${list }'>";
        str += "<div class='w-full md:w-1/3 xl:w-1/4 p-6 flex flex-col hover:grow hover:shadow-lg restaurant_link'>";
        str += "<a href='' class='image_link'>";
        str +=
          "<img id='image_link' src='" +
          element.imageLink +
          "' style='width: 205px; height: 235px;' data-title=''></a>";
        str += "<div id='shortcuts' class='pt-3 flex items-center'>";
        str += "<div class='line_diveider'>";
        str += "<a href='...' id='store_name'>";
        str += "<span class='restaurant_name'>" + element.title + "</span>";
        str += "<strong class='point search_point'>";
        str += "</strong></a></p>";
        str += "<div id='star_image' style='display: inline-block; vertical-align: top;'>";
        str +=
          "<img class='score_image' src='https://dcicons.s3.ap-northeast-1.amazonaws.com/new/images/mobile/common_react/review__newstar__img.png' alt='img' />";
        str += "</div>";
        str += "<div id='review_score' style='display: inline-block;'>";
        str += "<span class='review'>3.8점(77)</span>";
        str += "</div> </div>";
        str += "<div class='save_restaurant'>";
        str +=
          "<span class='icon is-small'><i class='fa fa-heart-o' aria-hidden='true'></i></span> &nbsp;<span class='like-num'></span>";
        str += "</div></div></div>";
        //str = "</c:forEach>";
      });
      console.log(str);
      document.querySelector(".loop_section").innerHTML = "";
      document.querySelector(".loop_section").innerHTML = str;
      subName();
    })
    .catch((error) => console.log(error));
});

// const categoryIcons = document.querySelectorAll(".category_icon");

// categoryIcons.forEach((icon) => {
//   icon.addEventListener("click", () => {
//     //기존 값 제거(imageLink, title 정보)
//     document.querySelector(".loop_section").innerHTML = "";
//     document.querySelectorAll("#image_link").forEach((img) => {
//       img.removeAttribute("src");
//     });
//     document.querySelectorAll(".restaurant_name").forEach((brand) => {
//       brand.innerHTML = "";
//     });

//     //클릭한 카테고리 정보 음식점 리스트 요소에 담기
//     const genre = icon.querySelector(".genre").innerHTML;
//     //console.log("내가 선택한 장르:", genre);

//     const foodCategory = document.querySelector(".food_category_name");
//     foodCategory.innerHTML = "#" + genre;
//     //console.log("루프 이름", loopName.innerHTML);
//     foodCategory.setAttribute("data-name", genre);
//     const query = foodCategory.dataset.name;
//     console.log("내가 불러올 쿼리:", query);

//     fetch("/api/server/search?query=" + query)
//       .then((response) => {
//         if (!response.ok) {
//           throw new Error("잘못된 요청");
//         }
//         return response.json();
//       })
//       .then((data) => {
//         //console.log(data);

//         data.forEach((element) => {
//           console.log("매장 이미지", element.imageLink);
//           console.log("매장 이름", element.title);
//         });
//       })
//       .catch((error) => console.log(error));
//   });
// });
//----------------------------------------------------
//document.querySelector("#image_link").src = element.imageLink;
//document.querySelector(".restaurant_name").innerHTML = element.title;

//----------------------------------------------------

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
