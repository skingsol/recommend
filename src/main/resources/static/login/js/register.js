/**
 * 폼 모든 요소가 비어있는지 확인
 *
 */

//window.addEventListener("DOMContentLoaded", function () {
var useridInput = document.getElementById("userid");
var lblNameCheck = document.getElementById("lbl_name_check");

useridInput.addEventListener("input", function () {
  var userid = this.value;

  if (/^(?=[A-Za-z])(?=.*\d)[A-Za-z\d]{5,12}$/.test(userid)) {
    lblNameCheck.textContent = "유효한 아이디입니다.";
    lblNameCheck.classList.remove("error");
  } else {
    lblNameCheck.textContent = "5~12자의 영문, 숫자로 구성되어야 합니다.";
    lblNameCheck.classList.add("error");
  }
});
//});

// 비밀번호 필드의 HTML 요소를 가져옵니다.
const passwordField = document.getElementById("password");

// 비밀번호 필드에 입력이 발생할 때마다 유효성을 검사하는 함수를 정의합니다.
passwordField.addEventListener("input", function () {
  // 비밀번호 필드의 값과 정규식을 비교합니다.
  const isValid =
    /^(?=[A-Za-z])(?=.*\d)(?=.*[!@#$%])[A-Za-z\d!@#$%]{5,12}$/.test(
      passwordField.value
    );

  // 유효성 검사 결과에 따라 메시지를 업데이트합니다.
  const messageElement = document.getElementById("lbl_pass_check");
  if (isValid) {
    messageElement.textContent = "유효한 비밀번호입니다.";
    messageElement.style.color = "green";
  } else {
    messageElement.textContent =
      "특수문자(예: !@#$ 등) 1자 이상을 포함한 5~12 글자의 비밀번호로 설정해주세요.";
    messageElement.style.color = "red";
  }
});

//중복 아이디
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
    emailError.innerHTML = "이메일을 입력해주세요.";
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

//let Email = document.querySelector("#email").value;

// 이메일확인
//if (Email.includes("@")) {
//const EmailId = Email.split("@")[0];
// if (EmailId === "") {
//   document.getElementById("emailError").innerHTML = "이메일을 입력해주세요.";
//   emailError.style.display = "block";
// } else {
//   document.getElementById("emailError").innerHTML = "";
// }
//} else {
// document.getElementById("emailError").innerHTML =
//   "이메일이 올바르지 않습니다.";
// emailError.style.display = "block";
//}

const Password = document.querySelector("#password").value;
const Password2 = document.querySelector("#password2").value;
// 비밀번호 확인
if (Password !== Password2) {
  document.getElementById("passwordError").innerHTML = "";
  document.getElementById("password2Error").innerHTML =
    "비밀번호가 동일하지 않습니다.";
} else {
  document.getElementById("passwordError").innerHTML = "";
  document.getElementById("password2Error").innerHTML = "";
}

const form = document.querySelector("#form");

form.addEventListener("submit", (e) => {
  if (!form.checkValidity()) {
    e.preventDefault();
    e.stopPropagation();
  }

  form.classList.add("was-validated");
});
