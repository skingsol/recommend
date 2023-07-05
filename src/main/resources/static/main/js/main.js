//---------------------------------------------------------------//
//    대문 이미지 슬라이드
//---------------------------------------------------------------//

var slideIndex = 0;
showSlides();

function showSlides() {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  slideIndex++;
  if (slideIndex > slides.length) {
    slideIndex = 1;
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex - 1].style.display = "block";
  dots[slideIndex - 1].className += " active";
  setTimeout(showSlides, 3000); // 3초마다 슬라이드 변경
}

//---------------------------------------------------------------//
//    업체명 글자수 제한
//---------------------------------------------------------------//
subName();
function subName() {
  const innerText = document.querySelectorAll(".restaurant_name");
  innerText.forEach((element) => {
    const shortName = element.innerHTML.substring(0, 10);
    element.innerHTML = shortName;
  });
}

//----------------------------------------------------
//  카테고리 아이콘 클릭 시 해당 카테고리 api 가져와서 보여주기
//----------------------------------------------------

const special = document.querySelector(".special");
const restaurant_link = document.querySelector(".loop_section");
special.addEventListener("click", (e) => {
  //어느 카테고리가 클릭이 되었는가?
  const category = e.target.dataset.genre;
  console.log("내가 선택한 카테고리:", category);
  //카테고리 이름 변경하기
  const foodCategory = document.querySelector(".food_category_name");
  foodCategory.innerHTML = "#" + category;

  //기존 정보(메인)를 가져온 후에 새로운 api 정보를 jsp에 담기
  fetch("/api/main?query=" + category)
    .then((response) => {
      if (!response.ok) {
        throw new Error("잘못된 요청");
      }
      return response.json();
    })
    .then((data) => {
      console.log(data);
      let str = "";
      data.forEach((element) => {
        //console.log(element);
        //str += "<c:forEach var='food' items='${list }'>";
        str +=
          "<div class='w-full md:w-1/3 xl:w-1/4 p-6 flex flex-col hover:grow hover:shadow-lg restaurant_link'>";
        str += "<a href='' class='image_link'>";
        str +=
          "<img id='image_link' src='" +
          element.imageLink +
          "' style='width: 205px; height: 235px;' data-title='" +
          element.title +
          "'></a>";
        str += "<div id='shortcuts' class='pt-3 flex items-center'>";
        str += "<div class='line_diveider'>";
        str += "<a href='...' id='store_name'>";
        str += "<span class='restaurant_name'>" + element.title + "</span>";
        str += "<strong class='point search_point'>";
        str += "</strong></a></p>";
        str += "</div>";
        str += "</div></div>";

        //str = "</c:forEach>";
      });
      //console.log(str);
      restaurant_link.innerHTML = "";
      restaurant_link.innerHTML = str;
      subName();
    })
    .catch((error) => console.log(error));
});
