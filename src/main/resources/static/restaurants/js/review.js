//상세페이지 리뷰 전체 리스트(listAll)
function getReviewList() {
  var reviewGetList = document.querySelector(".write_review .section-title");
  if (!reviewGetList) {
    console.log("리뷰 리스트를 가져올 수 없습니다.");
    return;
  }

  fetch("/restaurants/list/" + restaurantId)
    .then((response) => {
      if (!response.ok) {
        throw new Error("리스트 없음");
      }
      return response.json();
    })
    .then((data) => {
      //console.log(data);
      var reviewList = "";
      data.forEach((list) => {
        //var isCurrentUser = list.userId === userId; // 현재 사용자와 댓글 작성자를 비교
        var isCurrentUser = true;

        var buttons = "";
        if (isCurrentUser) {
          buttons = `
            <button class="delete_button" type="button">삭제</button>                        
            <button class="modify_button" type="button">수정</button>
          `;
        }
        var ratingStars = getRatingStars(list.grade);

        var review = `
        <div class="review_textBox">
          <div class="review_item">
            <div class="review__item__pic">
              <img src="/img/anime/review-1.jpg" alt="">
            </div>
            <div class="test">
              <div class="review__item__text" data-reviewId="${list.reviewId}">
                <div class="row">
                  <div class="col">
                    <h6>${list.userId}</h6>
                  </div>
                  <div class="col">
                    <h6>
                      <span>${displayTime(list.reviewDate)}</span>
                    </h6>
                  </div>
                  <div class="rating">${ratingStars}</div>
                </div>
                <p>${list.reviewContent}</p>
                <h6 style="text-align: right;">${buttons}</h6>
              </div>
            </div>
          </div>
        </div>
        `;
        reviewList += review;
      });
      reviewGetList.innerHTML = reviewList;
    })
    .catch((error) => console.log("데이터를 가져올 수 없습니다.", error));
}
getReviewList();

/////////////////////////////////////////////////////////////////////////////////////////////
// 상세페이지 댓글 작성 기능넣기(insert)

// 리뷰 별점 기능 넣기(grade)
let grade = 0;
const rating = document.querySelector("#insertForm .rating");
const stars = rating.querySelectorAll(".fa-star-o");

rating.addEventListener("click", (e) => {
  // 클릭된 별 요소 가져오기
  const starRating = e.target;

  // 클릭된 별의 인덱스를 가져오기
  const starIndex = Array.from(stars).indexOf(starRating);

  starRating.classList.remove("star-o");
  starRating.classList.add("fa-star");

  // 클릭한 별까지 별을 채우기
  for (let i = 0; i < stars.length; i++) {
    if (i <= starIndex) {
      stars[i].classList.remove("fa-star-o");
      stars[i].classList.add("fa-star");
    } else {
      stars[i].classList.remove("fa-star");
      stars[i].classList.add("fa-star-o");
    }
  }

  //console.log(starRating.dataset.value);
  grade = starRating.dataset.value;
});

document.querySelector("#insertForm").addEventListener("submit", (e) => {
  e.preventDefault();

  const reviewContent = document.querySelector("#insertForm #reviewContent").value;
  const userId = document.querySelector("#insertForm #userId").innerHTML;

  const data = {
    reviewContent: reviewContent,
    userId: userId,
    restaurantId: restaurantId,
    grade: grade,
  };

  if (userId == "") {
    alert("로그인 한 후 댓글 작성이 가능합니다.");
    document.querySelector("#insertForm #reviewContent").value = "";
  } else if (userId != "") {
    fetch("/restaurants/new", {
      method: "POST",
      headers: {
        "X-CSRF-TOKEN": csrfToken,
        "content-type": "application/json",
      },
      body: JSON.stringify(data),
    })
      .then((response) => {
        if (!response.ok) {
          throw new Error("입력 오류");
        }
        return response.text();
      })
      .then((data) => {
        getReviewList();
        document.querySelector("#insertForm #reviewContent").value = "";
      })
      .catch((error) => console.log(error));
  }
});

// 댓글 수정하기전 댓글 정보 가져오는 작업(read)
document.querySelector(".section-title").addEventListener("click", (e) => {
  // e.target : 이벤트 발생 대상
  // 이벤트 발생 대상을 감싸고 있는 부모 div 찾기
  let div = e.target.closest("div");
  //console.log("이벤트 발생 ", div);

  // reviewId 가져오기 (data-* 속성값 가져오기 : dataset)
  let reviewId = div.dataset.reviewid;
  //console.log("reviewId ", reviewId);

  // 댓글 작성자 정보 가져오기
  let form_reviewer = div.querySelector("div.col > h6").innerHTML;
  //console.log("댓글 작성자 ", userId);

  // 로그인 사용자 정보 가져오기
  let userId = document.querySelector("#insertForm #userId").innerHTML;
  let login_user = "";
  if (form_reviewer == userId) {
    login_user = userId;
  //} else if (form_reviewer != userId) {
  } else if (userId == "") {
    alert("로그인 한 후 수정 및 삭제가 가능합니다.");
    return;
  }

  // 이벤트를 부모가 감지를 하기 때문에
  if (e.target.classList.contains("modify_button")) {
    // 댓글 하나 가져오기
    // 로그인 사용자와 댓글 작성자가 같은지 확인
    if (userId != login_user) {
      alert("자신의 댓글만 수정이 가능합니다.");
      return;
    }

    fetch("/restaurants/" + reviewId)
      .then((response) => {
        if (!response.ok) {
          throw new Error("가져올 댓글 없음");
        }
        return response.json();
      })
      .then((data) => {
        //console.log(data);
        document.querySelector(".modal-body #reviewId").value = data.reviewId;
        document.querySelector(".modal-body #reviewContent").value = data.reviewContent;
        document.querySelector(".modal-body #userid").value = data.userId;
        //document.getElementById("reviewModal").style.display = 'block';
        $("#reviewModal").modal("show");
      })
      .catch((error) => console.log(error));
    // 댓글 하나 불러오기 종료

    // 모달 창 안에 가져온 내용 보여주기
  } else if (e.target.classList.contains("delete_button")) {
    // 로그인 사용자와 댓글 작성자가 같은지 확인
    if (userId != login_user) {
      alert("자신의 댓글만 삭제 가능합니다.");
      return;
    }

    // 삭제버튼 클릭 시(delete)
    fetch("/restaurants/delete/" + reviewId, {
      method: "get",
      headers: {
        "content-type": "application/json",
      },
    })
      .then((response) => {
        if (!response.ok) {
          throw new Error("삭제 불가");
        }
        return response.text();
      })
      .then((data) => {
        if (data === "success") {
          alert("삭제 성공");
          getReviewList();
        }
      })
      .catch((error) => console.log(error));
  }
});

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 댓글 수정 작업 (update)
document.querySelector(".modal-footer .btn-primary").addEventListener("click", () => {
  // 모달 창안에 있는 reviewId, review 가져온 후 자바스크립트 객체 생성
  reviewId = document.querySelector(".modal-body #reviewId").value;
  const updateReview = {
    reviewId: reviewId,
    reviewContent: document.querySelector(".form-group #reviewContent").value,
    userId: document.querySelector(".form-group #userid").value,
  };

  const queryString = new URLSearchParams(updateReview).toString();

  // fetch update 호출
  fetch("/restaurants/update?" + queryString, {
    method: "get",
    headers: {
      "content-type": "application/json",
    },
  })
    .then((response) => {
      if (!response.ok) {
        throw new Error("수정 실패");
      }
      return response.text();
    })
    .then((data) => {
      //console.log("수정내용", data);
      if (data === "success") {
        $("#reviewModal").modal("hide");
        getReviewList();
      }
    })
    .catch((error) => console.log(error));
});

document.querySelector(".modal-footer .btn-secondary").addEventListener("click", () => {
  $("#reviewModal").modal("hide");
});

document.querySelector(".modal-header .close").addEventListener("click", () => {
  $("#reviewModal").modal("hide");
});

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 리뷰에 몇시간전에 달았는지 보는 기능을 가진 함수 작성
function displayTime(timeVal) {
  const today = new Date(); // 오늘날짜

  // 오늘 날짜 - 댓글작성날짜
  let gap = today.getTime() - timeVal; // 오늘날짜 - 작성날짜 => 밀리세컨 단위로 나옴

  // 댓글작성날짜 Date 객체 생성
  let dateObj = new Date(timeVal);

  let str = "";
  // 작성날짜를 보여줄 때 24시간 안에 작성했느냐? 넘었느냐?
  // 24시간 안이라면 시분초, 넘었다면 년/월/일 형태로 보여주기
  // 1000 * 60 * 60 * 24 : 하루 24시간을 밀리세컨 단위로 만들기
  if (gap < 1000 * 60 * 60 * 24) {
    let hh = dateObj.getHours(); // 1~9시 10~12시
    let mi = dateObj.getMinutes();
    let ss = dateObj.getSeconds();

    return [
      (hh > 9 ? "" : "0") + hh, // 시간이 두자리면 그냥 넘어가고 한자리면 앞자리에 "0" 붙이기
      ":",
      (mi > 9 ? "" : "0") + mi,
      ":",
      (ss > 9 ? "" : "0") + ss,
    ].join("");
  } else {
    const yy = dateObj.getFullYear();
    const mm = dateObj.getMonth() + 1; //월은 0부터 시작이기때문에 +1
    const dd = dateObj.getDate();
    return [
      yy,
      "/",
      (mm > 9 ? "" : "0") + mm, // 월이 두자리면 그냥 넘어가고 한자리면 앞자리에 "0" 붙이기
      "/",
      (dd > 9 ? "" : "0") + dd,
    ].join("");
  }
} // 댓글 시간넣기 종료

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 별점 넣기 함수
// 별점에 따라 별 아이콘 생성 및 색깔 채우기
function getRatingStars(grade) {
  var filledStars = Math.floor(grade); // 채워진 별의 개수 (정수 부분)
  var halfStar = grade - filledStars === 0.5; // 반 별이 채워져야 하는지 여부

  var starIcons = "";
  for (var i = 0; i < filledStars; i++) {
    starIcons += `<i class="fa fa-star"></i>`;
  }
  if (halfStar) {
    starIcons += `<i class="fa fa-star-half-o"></i>`;
  }
  for (var j = filledStars + (halfStar ? 1 : 0); j < 5; j++) {
    starIcons += `<i class="fa fa-star-o"></i>`;
  }

  return starIcons;
}
