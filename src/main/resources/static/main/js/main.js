// 카테고리 버튼 선택 시 스크롤 이동
$(document).ready(function ($) {
  $("#scroll_move").click(function (event) {
    event.preventDefault();

    $("html,body").animate({ scrollTop: $(this.hash).offset().top }, 500);
  });
});

// // 대문 이미지 슬라이드
// // 슬라이드 하단 버튼 클릭 시 active 속성 변경 주기
// $(".slideshow-container .slide_btn > div").click(function () {
//   var $this = $(this);
//   var $pagenav = $this.parent();
//   var $current = $pagenav.find(".active");

//   $current.removeClass("active");
//   $this.addClass("active");

//   var index = $this.index();
//   var $슬라이더 = $this.closest(".slideshow-container");

//   $슬라이더.find(".slides > div.active").removeClass("active");
//   $슬라이더.find(".slides > div").eq(index).addClass("active");
// });

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
