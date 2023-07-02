// 목록 버튼 클릭 시 목록으로 이동
document.querySelector("#backToList").addEventListener("click", () => {
  location.href = "/api/master";
});

const form = document.querySelector("#readForm");

// 삭제 버튼 클릭 시 글 삭제
document.querySelector("#deleteBtn").addEventListener("click", (e) => {
  e.preventDefault();
  const reqId = document.querySelector("#reqId").value;
  alert(reqId + "번 요청이 삭제 되었습니다.");
  location.href = "/delete?reqId=" + reqId;
});
