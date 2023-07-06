// 클릭 이벤트 추가
const container = document.querySelector(".container");
container.addEventListener("click", (e) => {
  console.log(e.target.name);
  if (e.target.name === "kakao-icon") {
    console.log("카카오톡 공유하기 버튼 클릭!");

    // 클릭된 아이콘이 속한 부모 요소 선택
    const parent = e.target.closest(".post-entry");

    // 부모 요소에서 input 태그의 값을 가져오기

    const title = parent.querySelector(".title").value;
    const imageLink = parent.querySelector(".imageLink").value;
    const roadAddress = parent.querySelector(".roadAddress").value;
    const ourPageLink = "http://localhost:8080/restaurants/profile?restaurantName=" + title;

    console.log("이동 경로: " + ourPageLink);

    kakaoShare();

    //카카오톡 공유하기 함수
    function kakaoShare() {
      // Kakao SDK 초기화
      if (!Kakao.isInitialized()) {
        Kakao.init("6656444d6c987929be4c5c9e294903c5");
      }

      // 피드 구성하기
      // 중요한 점: 이동경로는 카카오에 등록한 web 도메인/ + 입력받은 주소가 실제로 접속 가능해야 한다.
      // 실제 접속이 불가한 링크를 걸어두면 피드를 클릭해도 localhost 8080/으로만 이동한다.
      Kakao.Link.sendDefault({
        objectType: "feed",
        content: {
          title: title,
          imageUrl: imageLink,
          link: {
            webUrl: ourPageLink,
            mobileWebUrl: ourPageLink,
          },
          description: roadAddress,
        },
        buttons: [
          {
            title: "홈페이지 바로가기",
            link: {
              webUrl: ourPageLink,
              mobileWebUrl: ourPageLink,
            },
          },
        ],
      });
    }
  }
});
