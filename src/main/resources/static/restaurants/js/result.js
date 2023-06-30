//    메인페이지 음식점 클릭 시 상세페이지 이동
restaurant_link.addEventListener("click", (e) => {
  e.preventDefault();

  const tag = e.target;
  let restaurantName = "";

  if (tag.dataset.title) {
    //img 태그에서 들어오는 경우
    restaurantName = tag.dataset.title;
  } else {
    //span 태그에서 들어오는 경우
    restaurantName = tag.innerHTML;
  }

  console.log(restaurantName);

  location.href = "/restaurants/profile?restaurantName=" + restaurantName;
});
