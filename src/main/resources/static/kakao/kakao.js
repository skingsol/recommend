// 클릭 이벤트 추가
document.querySelector(".container").addEventListener("click", (e) => {
  if ((e.target.name = "kakao-icon")) {
    console.log("카카오톡 공유하기 버튼 클릭!");
    kakaoShare();
  }
});

//카카오톡 공유하기 함수
function kakaoShare() {
  // Kakao SDK 초기화
  if (!Kakao.isInitialized()) {
    Kakao.init("6656444d6c987929be4c5c9e294903c5");
  }

  // 피드에 공유할 정보 가져오기
  const title = document.getElementById("search_title").getAttribute("data-title");
  const imageLink = document.getElementById("search_image").getAttribute("src");
  const roadAddress = document.getElementById("search_road_address").textContent;
  const homePageLink = document.getElementById("search_homePageLink").href;

  // 피드 구성하기
  Kakao.Link.sendDefault({
    objectType: "feed",
    content: {
      title: title,
      imageUrl: imageLink,
      link: {
        webUrl: window.location.href,
        mobileWebUrl: window.location.href,
      },
      description: roadAddress,
    },
    buttons: [
      {
        title: "홈페이지 바로가기",
        link: {
          webUrl: homePageLink,
          mobileWebUrl: homePageLink,
        },
      },
    ],
  });
  // });
}
