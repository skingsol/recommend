// 제목 클릭 시 a 태그 기능 중지
// operForm 의 action 은  /board/read 변경
// operForm 의 bno 태그를 추가해서 actionForm 전송
const moves = document.querySelectorAll(".move");

moves.forEach((move) => {
  move.addEventListener("click", (e) => {
    e.preventDefault();

    const href = e.target.getAttribute("href");
    console.log(href);
    location.href = "/api/del/" + href;
  });
});

//뒤로 가기 이벤트 감지? ==> 새로고침 하기
window.onpageshow = function (event) {
  //  persisted == true : webpage 가 로딩될 때 캐시에서 읽어왔음
  if (event.persisted) {
    location.reload();
  }
};
