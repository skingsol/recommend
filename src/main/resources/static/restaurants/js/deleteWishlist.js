document.querySelectorAll(".delete_button").forEach((element) => {
  element.addEventListener("click", () => {
    let restaurantId = element.getAttribute("data-restaurantId");
    fetch("/wish/delete?restaurantId=" + restaurantId + "&userId=" + userid)
      .then((response) => {
        if (!response.ok) {
          throw new Error("추가 실패");
        }
        return response.text();
      })
      .then((data) => {
        console.log(data);
        alert("삭제되었습니다.");
        setTimeout(() => {
          location.reload();
        }, 0.2);
      })
      .catch((error) => console.log("데이터를 가져올 수 없습니다.", error));
  });
});
