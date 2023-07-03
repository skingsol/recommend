//---------------------------------------------------------------//
//    맛집 등록 요청 버튼 클릭 시 모달창 띄움(로그인 유저만)
//---------------------------------------------------------------//
const registerBtn = document.querySelector("#rq_reg_btn");
const modal = document.getElementById("requestModal");

registerBtn.addEventListener("click", (e) => {
  const loginUser = document.getElementById("loginUser").value;
  console.log(loginUser);
  if (loginUser == "") {
    alert("로그인 후 이용 가능합니다.");
  } else if (loginUser != "") {
    modal.style.display = "flex";
  }
});

const closeBtn = document.querySelector(".close");
closeBtn.addEventListener("click", (e) => {
  modal.style.display = "none";
});

window.addEventListener("keyup", (e) => {
  if (modal.style.display === "flex" && e.key === "Escape") {
    modal.style.display = "none";
  }
});

//---------------------------------------------------------------//
//    모달창에서 등록요청 버튼 클릭 시 등록완료 알림창 띄우기
//---------------------------------------------------------------//

document.querySelector("#modalForm").addEventListener("submit", (e) => {
  const name = document.querySelector(".reqName").value;
  const content = document.querySelector(".reqContent").value;
  const address = document.querySelector(".reqAddress").value;
  const user = document.querySelector("#loginUser").value;

  e.preventDefault();

  const requestForm = {
    reqName: name,
    reqAddress: address,
    reqContent: content,
    reqUser: user,
  };

  console.log(requestForm);

  fetch("/api/search", {
    method: "post",
    headers: {
      "content-type": "application/json",
      "X-CSRF-TOKEN": csrfToken,
    },
    body: JSON.stringify(requestForm),
  })
    .then((response) => {
      //결과가 도착하게 되면 자동 호출(비동기호출)
      if (!response.ok) {
        throw new Error("입력값 오류");
      }
      return response.text(); //success
    })
    .then((data) => {
      alert("요청이 등록되었습니다.");
      modal.style.display = "none";
    })
    .catch((error) => console.log(error));
});

//---------------------------------------------------------------//
//    한번에 보여지는 검색결과 수 제한(naver local search api display 제한으로 구현 불가)
//---------------------------------------------------------------//
// $(function () {
//   $("div").slice(0, 1).show(); // 초기갯수
//   $("#load").click(function (e) {
//     // 클릭시 more
//     e.preventDefault();
//     $("div:hidden").slice(0, 1).show(); // 클릭시 more 갯수 지저정
//     if ($("div:hidden").length == 0) {
//       // 컨텐츠 남아있는지 확인
//       alert("게시물의 끝입니다."); // 컨텐츠 없을시 alert 창 띄우기
//     }
//   });
// });

//---------------------------------------------------------------//
//    검색결과 더보기 버튼 클릭 시 리스트 5개씩 더 가져오기
//---------------------------------------------------------------//

// const moreBtn = document.querySelector(".more_btn_icon");
// // 결과 더보기 버튼 클릭 이벤트 핸들러
// function loadMore() {
//   // 결과를 더 가져오는 로직을 구현(근데 스타트 어떻게 정정...?ㅠㅠ)
//   fetch("/api/search?query=")
//     .then((response) => {
//       if (!response.ok) {
//         throw new Error("잘못된 요청입니다.");
//       }
//       return response.json();
//     })
//     .then((data) => {
//       console.log(data);
//       const exist = false; // 가져올 결과가 있는지 여부
//       // 마지막에 불러온 리스트의 주소가 더보기 버튼 동작 후 불러온 첫번째 리스트와 같으면 검색결과 없음으로 판단.
//       // if (!exist) {
//       //가져올 결과가 없으면 메시지 띄우거나 뭐 디자인 추가해서 알리기
//       // }
//     })
//     .catch((error) => console.log(error));
// }
