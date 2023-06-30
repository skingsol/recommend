/**
 * 폼 모든 요소가 비어있는지 확인
 *
 */

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
    headers: {
      "X-CSRF-TOKEN": csrfToken,
    },
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

const phone = document.querySelector("#phone");
console.log(phone);

document.querySelector("#phone").addEventListener("blur", () => {
  let phone = document.querySelector("#phone").value;

  let phoneError = document.querySelector("#phoneError");
  //번호 확인
  if (phone === "") {
    phoneError.innerHTML = "번호를 입력해주세요.";
    phoneError.style.display = "block";
  } else {
    phoneError.innerHTML = "";
    phoneError.style.display = "none";
  }
});

document.querySelector("#email").addEventListener("blur", () => {
  let email = document.querySelector("#email").value;

  let emailError = document.querySelector("#emailError");
  //이메일 확인
  if (email === "") {
    emailError.innerHTML = "이메일 입력해주세요.";
    emailError.style.display = "block";
  } else {
    emailError.innerHTML = "";
    emailError.style.display = "none";
  }
});

document.querySelector("#userid").addEventListener("blur", () => {
  let userid = document.querySelector("#userid").value;

  let idError = document.querySelector("#idError");
  //아이디 확인
  if (userid === "") {
    idError.innerHTML = "아이디를 입력해주세요.";
    idError.style.display = "block";
  } else {
    idError.innerHTML = "";
    idError.style.display = "none";
  }
});

document.querySelector("#password").addEventListener("blur", () => {
  let password = document.querySelector("#password").value;

  let passwordError = document.querySelector("#passwordError");
  //패스워드 확인
  if (password === "") {
    passwordError.innerHTML = "비밀번호를 입력해주세요.";
    passwordError.style.display = "block";
  } else {
    passwordError.innerHTML = "";
    passwordError.style.display = "none";
  }
});
document.querySelector("#introduce").addEventListener("blur", () => {
  let introduce = document.querySelector("#introduce").value;

  let txt_introError = document.querySelector("#txt_introError");
  //자기소개 확인
  if (introduce === "") {
    txt_introError.innerHTML = "자기소개를 입력해주세요.";
    txt_introError.style.display = "block";
  } else {
    txt_introError.innerHTML = "";
    txt_introError.style.display = "none";
  }
});

let password = document.querySelector("#password").value;
let password2 = document.querySelector("#password2").value;
let email = document.querySelector("#email").value;

// 이메일확인
if (email.includes("@")) {
  let emailId = email.split("@")[0];
  if (emailId === "") {
    document.getElementById("emailError").innerHTML = "이메일을 입력해주세요.";
    emailError.style.display = "block";
  } else {
    document.getElementById("emailError").innerHTML = "";
  }
} else {
  document.getElementById("emailError").innerHTML =
    "이메일이 올바르지 않습니다.";
  emailError.style.display = "block";
}

// 비밀번호 확인
if (password !== password2) {
  passwordError.style.display = "block";
  password2Error.style.display = "block";
  document.getElementById("passwordError").innerHTML = "";
  document.getElementById("password2Error").innerHTML =
    "비밀번호가 동일하지 않습니다.";
  passwordError.style.display = "block";
} else {
  document.getElementById("passwordError").innerHTML = "";
  document.getElementById("password2Error").innerHTML = "";
}

document.querySelector(".btn-mint").addEventListener("click", () => {
  if (check) {
    document.getElementById("emailError").innerHTML = "";
    document.getElementById("passwordError").innerHTML = "";
    document.getElementById("password2Error").innerHTML = "";
    document.getElementById("txt_introError").innerHTML = "";

    //비동기 처리
    setTimeout(function () {
      alert("가입이 완료되었습니다.");
    }, 0);
  }
});

const form = document.querySelector("form");

form.addEventListener("submit", (e) => {
  if (!form.checkValidity()) {
    e.preventDefault();
    e.stopPropagation();
  }

  form.classList.add("was-validated");
});
