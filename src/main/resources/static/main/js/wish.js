document.querySelectorAll("#heart-icon").forEach((element) => {
  element.addEventListener("click", () => {
    let restaurantId = element.getAttribute("data-restaurantId");
    console.log(restaurantId);

    if (e.target.name === "heart") {
      fetch("/wish/add?restaurantId=" + restaurantId + "&userId=" + userid)
        .then((response) => {
          if (!response.ok) {
            throw new Error("추가 실패");
          }
          return response.text();
        })
        .then((data) => {
          console.log(data);
          if (data === "fail") {
            alert("이미 찜목록에 있습니다.");
          }
          fetch("/wish/count?restaurantId=" + restaurantId)
            .then((response) => response.text())
            .then((data) => {
              console.log(data);
              document.querySelector("#wish-count").innerHTML = data;
            });
        })
        .catch((error) => console.log("데이터를 가져올 수 없습니다.", error));
    }
  });
});
