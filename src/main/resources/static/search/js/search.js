//---------------------------------------------------------------//
//    한번에 보여지는 검색결과 수 제한
//---------------------------------------------------------------//
$(function () {
  $("div").slice(0, 1).show(); // 초기갯수
  $("#load").click(function (e) {
    // 클릭시 more
    e.preventDefault();
    $("div:hidden").slice(0, 1).show(); // 클릭시 more 갯수 지저정
    if ($("div:hidden").length == 0) {
      // 컨텐츠 남아있는지 확인
      alert("게시물의 끝입니다."); // 컨텐츠 없을시 alert 창 띄우기
    }
  });
});

//---------------------------------------------------------------//
//    검색버튼 클릭 시 사용자 입력값 가져와서 리스트로 보여주기
//    -필요)위시에 저장된 데이터인지 표시
//    -필요)평점, 리뷰 개수 정보 가져오기
//---------------------------------------------------------------//
document.querySelector(".search_icon").addEventListener("click", () => {
  const query = document.querySelector(".search_input").innerHTML;
  console.log(query);

  // //기존 값 제거
  // document.querySelector("#search_image").removeAttribute("src");
  // document.querySelector("#search_title").innerHTML = "";
  // document.querySelector("#search_category").innerHTML = "";
  // document.querySelector("#search_road_address").innerHTML = "";
  // document.querySelector("#search_homePageLink").removeAttribute("href");

  // fetch("/api/search?query=" + query)
  //   .then((response) => {
  //     if (!response.ok) {
  //       throw new Error("잘못된 쿼리 요청");
  //     }
  //     return response.json();
  //   })
  //   .then((data) => {
  //     console.log(data);
  //     //search result 에 정보 보여주기
  //     // img src 변경 - data 안에 imageLink
  //     if (data.imageLink) {
  //       document.querySelector("#search_image").src = data.imageLink;
  //     }
  //     // 다른 정보들도 보여주기
  //     document.querySelector("#search_title").innerHTML = data.title;
  //     document.querySelector("#search_category").innerHTML = data.category;
  //     document.querySelector("#search_road_address").innerHTML = data.roadAddress;
  //     if (data.homePageLink) {
  //       document.querySelector("#search_link").href = data.homePageLink;
  //     }
  //     //style 속성 변경
  //     document.querySelector("#search_result").style.visibility = "visible";
  //   })
  //   .catch((error) => console.log(error));
});

//---------------------------------------------------------------//
//    정렬 기준 선택에 따라 리스트 정렬 순서 변경
//---------------------------------------------------------------//

// // 검색 결과 데이터 예시 (가정)
// const searchData = [
//   { name: "아이템 1", distance: 10, rating: 4.5, review: 50, recommendation: 100 },
//   { name: "아이템 2", distance: 5, rating: 3.2, review: 20, recommendation: 80 },
//   // 추가 검색 결과 데이터...
// ];

// // 결과 목록 업데이트 함수
// function updateResultsList(data) {
//   const resultsList = document.getElementById("results-list");
//   resultsList.innerHTML = ""; // 기존 목록 초기화

//   data.forEach((item) => {
//     const listItem = document.createElement("li");
//     listItem.textContent = item.name;
//     resultsList.appendChild(listItem);
//   });
// }

// // 정렬 기준 변경 이벤트 핸들러
// function handleSortChange() {
//   const sortSelect = document.getElementById("sort-select");
//   const selectedOption = sortSelect.value;

//   let sortedData = [];

//   if (selectedOption === "distance") {
//     sortedData = searchData.sort((a, b) => a.distance - b.distance);
//   } else if (selectedOption === "rating") {
//     sortedData = searchData.sort((a, b) => b.rating - a.rating);
//   } else if (selectedOption === "review") {
//     sortedData = searchData.sort((a, b) => b.review - a.review);
//   } else if (selectedOption === "recommendation") {
//     sortedData = searchData.sort((a, b) => b.recommendation - a.recommendation);
//   }

//   updateResultsList(sortedData);
// }

// // 정렬 기준 변경 이벤트 리스너 등록
// const sortSelect = document.getElementById("sort-select");
// sortSelect.addEventListener("change", handleSortChange);

// // 초기 결과 목록 표시
// updateResultsList(searchData);

// //---------------------------------------------------------------//
// //    하트 버튼 클릭 시 위시리스트에 저장 / 이미 저장된 곳은 채워진 하트로 표시(main기능과 일치)
// //---------------------------------------------------------------//

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
//    검색결과 더보기 버튼 관련
//---------------------------------------------------------------//

const requestRegBtn = document.getElementById("rq_reg_btn");
// 결과 더보기 버튼 클릭 이벤트 핸들러
function handleLoadMore() {
  // 결과를 더 가져오는 로직을 구현

  const hasMoreResults = false; // 가져올 결과가 있는지 여부 (가정)

  if (!hasMoreResults) {
    requestRegBtn.style.display = "inline-block"; // 결과가 없으면 맛집 등록 요청 버튼 표시
  }
}

// 결과 더보기 버튼 클릭 이벤트 리스너 등록
const loadMoreBtn = document.getElementById("list_more_btn");
loadMoreBtn.addEventListener("click", handleLoadMore);

//---------------------------------------------------------------//
//    맛집 등록 요청 버튼 관련
//---------------------------------------------------------------//
// 맛집 등록 요청 버튼 클릭 이벤트 핸들러
requestRegBtn.addEventListener("click", (e) => {
  console.log("모달 창 띄움");
});
const modal = document.getElementById("requestModal");
requestRegBtn.addEventListener("click", (e) => {
  modal.style.display = "flex";
});

const closeBtn = modal.querySelector(".close");
closeBtn.addEventListener("click", (e) => {
  modal.style.display = "none";
});

window.addEventListener("keyup", (e) => {
  if (modal.style.display === "flex" && e.key === "Escape") {
    modal.style.display = "none";
  }
});

// **시간될 때 추가하면 좋을 기능**
// document.getElementById("register_btn").addEventListener("click", () => {
//     //모달 창 안에 있는 내용 가져와서 객체 생성
//     //내용 전달하는 함수 만들거나 불러와서 호출....
//     //모달창 닫으면 alert로 요청이 처리되었다고 알리기

// })
//---------------------------------------------------------------//
