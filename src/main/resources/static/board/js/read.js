// 글번호에 대해서 첨부파일 가져오기
function showAttachFile(uploadResultArr) {
  //첨부파일 목록 보여주기
  let str = "";
  uploadResultArr.forEach((item) => {
    //fileType 이 true 라면 image 파일이라면 썸네일 이미지 보여주기
    if (item.fileType) {
      //썸네일 이미지 경로 생성
      let fileCallPath = encodeURIComponent(
        item.uploadPath + "\\s_" + item.uuid + "_" + item.fileName
      );
      //썸네일 이미지 클릭 ==> 원본 이미지 보여주기
      let oriFileCallPath = encodeURIComponent(
        item.uploadPath + "\\" + item.uuid + "_" + item.fileName
      );

      str +=
        "<li data-path='" +
        item.uploadPath +
        "' data-uuid='" +
        item.uuid +
        "' ";
      str +=
        " data-filename='" +
        item.fileName +
        "' data-type='" +
        item.fileType +
        "' >";
      str +=
        "<a href='/display?fileName=" +
        oriFileCallPath +
        "' data-lightbox='image'>";
      str +=
        "<div class='text-center'><img src='/display?fileName=" +
        fileCallPath +
        "'></a></div>";
      str += "<small>" + item.fileName + "</small> ";
      str += "</li>";
    } else {
      //txt 파일 경로 생성
      let fileCallPath = encodeURIComponent(
        item.uploadPath + "\\" + item.uuid + "_" + item.fileName
      );

      str +=
        "<li data-path='" +
        item.uploadPath +
        "' data-uuid='" +
        item.uuid +
        "' ";
      str +=
        " data-filename='" +
        item.fileName +
        "' data-type='" +
        item.fileType +
        "' >";
      str += "<a href='/download?fileName=" + fileCallPath + "'>";
      str +=
        "<div class='text-center'><img src='/resources/img/txt-file.png'></div>";
      str += "<small>" + item.fileName + "</small></a> ";
      str += "</li>";
    }
  });
  document
    .querySelector(".uploadResult ul")
    .insertAdjacentHTML("beforeend", str);
}

fetch("/board/getAttachList?postId=" + postId)
  .then((response) => {
    if (!response.ok) {
      throw new Error("첨부물 없음");
    }
    return response.json();
  })
  .then((data) => {
    console.log(data);
    showAttachFile(data);
  })
  .catch((error) => console.log(error));

const form = document.querySelector("#operForm");

// 수정 버튼 클릭 시 operForm 보내기
// /board/modify 전송
const btnInfo = document.querySelector(".btn-info");
if (btnInfo) {
  btnInfo.addEventListener("click", () => {
    form.action = "/board/modify";
    form.submit();
  });
}

// 목록 버튼 클릭 시 operForm 보내기
// /board/list 전송
// bno 제거
document.querySelector(".btn-secondary").addEventListener("click", () => {
  form.firstElementChild.remove();
  form.action = "/board/list";
  form.submit();
});

// 댓글 보여줄 영역 가져오기
let chat = document.querySelector(".chat");
let page = 1;
showList(page);
function showReplyPage(total) {
  let endPage = Math.ceil(page / 10.0) * 10;
  let startPage = endPage - 9;
  let prev = startPage != 1;
  let next = false;

  if (endPage * 10 >= total) {
    endPage = Math.ceil(total / 10.0);
  }
  if (endPage * 10 < total) {
    next = true;
  }

  let str = "<ul class='pagination justify-content-end'>";
  if (prev) {
    str +=
      "<li class='page-item'><a class='page-link' href='" +
      (startPage - 1) +
      "'>Previous</a></li>";
  }

  for (let i = startPage; i <= endPage; i++) {
    let active = page == i ? "active" : "";
    str +=
      "<li class='page-item " +
      active +
      " '><a class='page-link' href='" +
      i +
      "'>" +
      i +
      "</a></li>";
  }

  if (next) {
    str +=
      "<li class='page-item'><a class='page-link' href='" +
      (endPage + 1) +
      "'>Next</a></li>";
  }

  str += "</ul>";
  document.querySelector(".card-footer").innerHTML = str;
}

// 댓글 페이지 나누기 숫자 클릭 시 a 태그 동작 중지
// href 에 있는 값 가져오기
// showList(가져온 값)
document.querySelector(".card-footer").addEventListener("click", (e) => {
  e.preventDefault();
  page = e.target.getAttribute("href");
  //console.log(href);
  showList(page);
});

function showList(pageNum) {
  // 현재 게시물에 대한 댓글 가져오기
  // page: page||1 => page 변수값이 존재하면 page 값 사용하고 없으면 1
  replyService.getList({ postId: postId, page: page || 1 }, (total, result) => {
    console.log("read.js에서 확인");
    console.log(total);
    console.log(result);

    if (pageNum == -1) {
      //마지막 페이지 알아내기
      page = Math.ceil(total / 10.0);
      showList(page);
      return;
    }

    // 도착한 데이터를 화면에 보여주기
    if (result == null || result.length == 0) {
      chat.innerHTML = "";
      return;
    }

    let str = "";
    for (let idx = 0; idx < result.length; idx++) {
      str +=
        "<li class='list-group-item border-bottom' data-replyId='" +
        result[idx].replyId +
        "'>";
      str += "<div class='d-flex justify-content-between'>";
      str +=
        "<strong class='primary-font'>" + result[idx].replyer + "</strong>";
      str +=
        "<small class='text-muted text-right'>" +
        replyService.displayTime(result[idx].replyRegdate) +
        "</small>";
      str += "</div>";
      str += "<p>" + result[idx].replyContent + "</p>";
      str += "<div class='btn-group btn-group-sm'>";
      str += "<button class='btn btn-warning' type='button'>수정</button>";
      str += "<button class='btn btn-danger' type='button'>삭제</button>";
      str += "</div>";
      str += "</li>";
    }
    chat.innerHTML = str;
    showReplyPage(total); //현 게시물에 달린 댓글 총 숫자를 이용한 페이지 나누기 함수 호출
  });
}

// 댓글 작업 호출 => 댓글 작성 버튼 클릭 시
// submit 중지, reply, userid 가져오기
const replyForm = document.querySelector("#replyForm");
if (replyForm) {
  replyForm.addEventListener("submit", (e) => {
    e.preventDefault();
    const replyContent = document.querySelector("#replyContent");
    const replyer = document.querySelector("#replyer");

    replyService.add(
      {
        postId: postId,
        replyContent: replyContent.value,
        replyer: replyer.value
      },
      (result) => {
        //alert(result);
        //댓글 작성 부분 지우기
        replyContent.value = "";

        showList(-1);
      }
    );
  });
}

// replyService.add(
//   { bno: 1181, reply: "댓글 작성", userid: "test2" },
//   function (result) {
//     alert(result);
//   }
// );

//수정 버튼 클릭 시 모달 창 띄우기
// document.querySelectorAll(".btn-warning").forEach((updateBtn) => {
//   updateBtn.addEventListener("click", () => {});
// });

// 이벤트 전파 : 자식의 이벤트는 부모에게 전달 됨 ==> ul 에 이벤트 작성
chat.addEventListener("click", (e) => {
  //어느 li에서 이벤트가 발생했느냐?
  // e.target : 이벤트 발생 대상
  // 이벤트 발생 대상을 감싸고 있는 부모 li 찾기
  let li = e.target.closest("li");
  console.log("이벤트 발생 ", li);

  //rno 가져오기 ( data-* 속성값 가져오기 : dataset)
  let replyId = li.getAttribute("data-replyId");
  console.log("replyId ", replyId);

  //댓글 작성자 정보 가져오기
  let replyer = li.firstElementChild.firstElementChild.innerHTML;
  console.log("댓글 작성자 ", replyer);

  //로그인 사용자 정보 가져오기
  let form_replyer = document.querySelector("#replyForm #replyer");
  let login_user = "";
  if (form_replyer) {
    login_user = form_replyer.value;
  }

  if (!login_user) {
    alert("로그인 한 후 수정 및 삭제가 가능합니다.");
    return;
  }

  // 이벤트를 부모가 감지를 하기 때문에
  if (e.target.classList.contains("btn-warning")) {
    //로그인 사용자와 댓글 작성자가 같은지 확인
    if (replyer != login_user) {
      alert("자신의 댓글만 수정이 가능합니다.");
      return;
    }

    //댓글 하나 가져오기
    replyService.get(replyId, (result) => {
      console.log(result);

      //모달 창 안에 가져온 내용 보여주기
      document.querySelector(".modal-body #replyId").value = result.replyId;
      document.querySelector(".modal-body #replyContent").value =
        result.replyContent;
      document.querySelector(".modal-body #replyer").value = result.replyer;

      $("#replyModal").modal("show");
    });
  } else if (e.target.classList.contains("btn-danger")) {
    //로그인 사용자와 댓글 작성자가 같은지 확인
    if (replyer != login_user) {
      alert("자신의 댓글만 삭제가 가능합니다.");
      return;
    }

    //삭제버튼 클릭 시
    replyService.remove(replyId, replyer, (result) => {
      if (result === "success") {
        alert("삭제 성공");
        showList(page);
      }
    });
  }
});

// 모달 창 수정 버튼이 클릭되면 댓글 수정
document
  .querySelector(".modal-footer .btn-primary")
  .addEventListener("click", () => {
    //모달 창안에 있는 rno, reply 가져온 후 자바스크립트 객체 생성
    const updateReply = {
      replyId: document.querySelector(".modal-body #replyId").value,
      replyContent: document.querySelector(".modal-body #replyContent").value,
      replyer: document.querySelector(".modal-body #replyer").value
    };

    // replyService.update 호출
    replyService.update(updateReply, (result) => {
      //alert(result);
      //모달 창 닫기
      if (result === "success") {
        $("#replyModal").modal("hide");
        showList(page);
      }
    });
  });
