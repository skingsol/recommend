//---------------------------------------------------------------//
//    카테고리 버튼 선택 시 해당 바디로 스크롤 이동
//---------------------------------------------------------------//
$(document).ready(function ($) {
  $("#scroll_move").click(function (event) {
    event.preventDefault();

    $("html,body").animate({ scrollTop: $(this.hash).offset().top }, 500);
  });
});

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
//    카테고리별 랭킹순 음식점 액자식 진열 정보 가져오기
//---------------------------------------------------------------//

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
