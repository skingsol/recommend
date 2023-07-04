// 위시리스트 페이지 음식점 클릭 시 상세페이지 이동
const restaurant_link = document.querySelector(".forTable");
restaurant_link.addEventListener("click", (e) => {
  e.preventDefault();

  const tag = e.target;
  let restaurantName = "";

  if (tag.dataset.title) {
    //data-title 속성이 있는 태그인 경우 맛집상세페이지로 이동
    restaurantName = tag.dataset.title;
    location.href = "/restaurants/profile?restaurantName=" + restaurantName;
  } else if (tag.href) {
    //태그에 href 속성이 있으면 해당 링크로 이동
    location.href = tag.href;
  }

  console.log(restaurantName);
});
