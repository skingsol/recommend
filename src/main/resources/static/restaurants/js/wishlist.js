// const userid = document.querySelector("#userId").value;
fetch("/wish/count?restaurantId=" + restaurantId)
  .then((response) => response.text())
  .then((data) => {
    console.log(data);
    document.querySelector("#wish-count").innerHTML = data;
  })
  .catch((error) => console.log("데이터를 가져올 수 없습니다.", error));

document.querySelector("#btn-wish-add").addEventListener("click", () => {
  console.log("클릭");
  if (userid) {
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
          alert("이미 위시리스트에 있습니다.");
        } else {
          alert("위시리스트에 추가 되었습니다.");
        }
        fetch("/wish/count?restaurantId=" + restaurantId)
          .then((response) => response.text())
          .then((data) => {
            console.log(data);
            document.querySelector("#wish-count").innerHTML = data;
          });
      })
      .catch((error) => console.log("데이터를 가져올 수 없습니다.", error));
  } else {
    alert("로그인이 필요한 서비스입니다.");
  }
});
