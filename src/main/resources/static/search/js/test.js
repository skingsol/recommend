/**
 *
 */
// 최근 검색어 저장
function saveRecentSearch(keyword) {
  const recentSearchList = document.querySelector(".recent-search-list");
  const listItem = document.createElement("li");
  const deleteButton = document.createElement("button");
  deleteButton.textContent = "삭제";
  deleteButton.addEventListener("click", function () {
    deleteRecentSearch(this.parentNode);
  });
  listItem.textContent = keyword;
  listItem.appendChild(deleteButton);
  recentSearchList.prepend(listItem);
}

// 최근 검색어 삭제
function deleteRecentSearch(listItem) {
  listItem.remove();
}

// input 요소 클릭 시 이벤트 처리
document.querySelector(".search_input").addEventListener("click", function () {
  // recent-search-menu 요소 표시
  document.querySelector(".recent-search-menu").style.display = "block";
});

// 검색어 입력 후 검색 버튼 클릭 시 이벤트 처리
document.querySelector(".search_icon").addEventListener("click", function (event) {
  const input = document.querySelector(".search_input");
  const keyword = input.value.trim();

  if (keyword !== "") {
    saveRecentSearch(keyword);
  }

  input.value = "";
  event.preventDefault();
});

// 전체삭제 버튼 클릭 시 이벤트 처리
document.querySelector(".clear-btn").addEventListener("click", function () {
  const recentSearchList = document.querySelector(".recent-search-list");
  while (recentSearchList.firstChild) {
    recentSearchList.firstChild.remove();
  }
});

// body 클릭 시 이벤트 처리
document.querySelector("body").addEventListener("click", function (event) {
  // 클릭된 요소가 input 요소 또는 recent-search-menu 요소의 자식 요소인 경우에는 아무 동작하지 않음
  if (event.target.matches(".search_input, .recent-search-menu *")) {
    return;
  }

  // 클릭된 요소가 input 요소나 recent-search-menu 요소의 자식 요소가 아니면 recent-search-menu 요소 숨김
  document.querySelector(".recent-search-menu").style.display = "none";
});
