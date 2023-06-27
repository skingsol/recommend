/**
 * 폼 모든 요소가 비어있는지 확인
 *
 */
const form = document.querySelector("form");

form.addEventListener("submit", (e) => {
  if (!form.checkValidity()) {
    e.preventDefault();
    e.stopPropagation();
  }

  form.classList.add("was-validated");
});

$("#send").click(function () {
  const to = $("#phone").val();

  $.ajax({
    url: "/ExampleController",
    type: "POST",
    data: {
      to: to,
    },
    dataType: "json",
    success: function (data) {
      const checkNum = data;
      alert("checkNum:" + checkNum);

      $("#enterBtn").click(function () {
        const userNum = $("#userNum").val();

        if (checkNum === userNum) {
          alert("인증 성공하였습니다.");
        } else {
          alert("인증 실패하였습니다. 다시 입력해주세요.");
        }
      });
    },
  });
});

//중복 닉네임
document.querySelector(".btn-danger").addEventListener("click", () => {
  //사용자가 입력한 userid 가져오기
  const userid = document.querySelector("#userid").value;

  fetch("/member/dupId", {
    method: "post",
    body: new URLSearchParams({ userid: userid }),
  })
    .then((response) => response.text())
    .then((result) => {
      console.log(result);
      if (result.trim() === "true") {
        alert("아이디를 사용할 수 있습니다");
      } else {
        alert("아이디를 사용할 수 없습니다");
      }
    });
});

//
// document.querySelector("#phone").addEventListener("input",()=>{
//   let phone = document.querySelector("#phone").value;

//    //번호 확인
//    if (phone === "") {
//     document.querySelector("phoneError").innerHTML =
//       "번호가 올바르지 않습니다.";
//   } else {
//     document.getElementById("phoneError").innerHTML = "";
//   }

// })

function signUpCheck() {
  let phone = document.querySelector("#phone").value;
  let userid = document.querySelector("#userid").value;
  let password = document.querySelector("#password").value;
  let password2 = document.querySelector("#password2").value;
  let email = document.querySelector("#email").value;
  let txt_intro = document.querySelector("#txt_intro").value;

  //번호 확인
  if (phone === "") {
    document.querySelector("phoneError").innerHTML =
      "번호가 올바르지 않습니다.";
  } else {
    document.getElementById("phoneError").innerHTML = "";
  }
  // 이메일확인
  if (email.includes("@")) {
    let emailId = email.split("@")[0];
    if (emailId === "") {
      document.getElementById("emailError").innerHTML =
        "이메일이 올바르지 않습니다.";
    } else {
      document.getElementById("emailError").innerHTML = "";
    }
  } else {
    document.getElementById("emailError").innerHTML =
      "이메일이 올바르지 않습니다.";
  }

  // 닉네임확인
  if (userid === "") {
    document.getElementById("idError").innerHTML =
      "아이디가 올바르지 않습니다.";
  } else {
    document.getElementById("idError").innerHTML = "";
  }

  // 비밀번호 확인
  if (password !== password2) {
    document.getElementById("passwordError").innerHTML = "";
    document.getElementById("password2Error").innerHTML =
      "비밀번호가 동일하지 않습니다.";
  } else {
    document.getElementById("passwordError").innerHTML = "";
    document.getElementById("password2Error").innerHTML = "";
  }

  if (password === "") {
    document.getElementById("passwordError").innerHTML =
      "비밀번호를 입력해주세요.";
  } else {
    document.getElementById("passwordError").innerHTML = "";
  }
  if (password2 === "") {
    document.getElementById("password2Error").innerHTML =
      "비밀번호를 다시 입력해주세요.";
  } else {
    document.getElementById("password2Error").innerHTML = "";
  }

  if (txt_intro === "") {
    document.getElementById("txt_introError").innerHTML =
      "자기소개를 입력해주세요";
  } else {
    document.getElementById("txt_introError").innerHTML = "";
  }

  document.querySelector(".btn-mint").addEventListener("click", () => {
    if (check) {
      document.getElementById("emailError").innerHTML = "";
      document.getElementById("phoneError").innerHTML = "";
      document.getElementById("idError").innerHTML = "";
      document.getElementById("passwordError").innerHTML = "";
      document.getElementById("password2Error").innerHTML = "";
      document.getElementById("txt_introError").innerHTML = "";

      //비동기 처리
      setTimeout(function () {
        alert("가입이 완료되었습니다.");
      }, 0);
    }
  });
}
