/**
 * Haversine 공식을 사용하여 거리 계산하기
 */

function toRadians(degrees) {
  return degrees * (Math.PI / 180);
}

function getDistance(lat1, lon1, lat2, lon2) {
  const R = 6371e3; // 지구의 평균 반지름 (m)
  const phi1 = toRadians(lat1);
  const phi2 = toRadians(lat2);
  const deltaPhi = toRadians(lat2 - lat1);
  const deltaLambda = toRadians(lon2 - lon1);

  const a =
    Math.sin(deltaPhi / 2) * Math.sin(deltaPhi / 2) +
    Math.cos(phi1) * Math.cos(phi2) * Math.sin(deltaLambda / 2) * Math.sin(deltaLambda / 2);
  const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));

  return R * c;
}

function displayDistance(currentLat, currentLng, targetLat, targetLng) {
  const lat1 = currentLat;
  const lon1 = currentLng;
  const lat2 = targetLat;
  const lon2 = targetLng;

  const distance = getDistance(lat1, lon1, lat2, lon2);

  // 거리가 1000m미만이면 m터로 단위표시, 1000m 이상이면 km로 거리표시 하기
  let distanceText = "";
  if (distance < 1000) {
    distanceText = `${Math.round(distance)}m`;
  } else {
    distanceText = `${(distance / 1000).toFixed(1)}km`;
  }

  // HTML 요소를 가져오고 거리 텍스트 설정하기
  const distanceElement = document.querySelector(".fs-5.mb-5 span[style='color: deepskyblue;']");
  distanceElement.innerHTML = distanceText;
}

var options = {
  enableHighAccuracy: true,
  timeout: 5000,
  maximumAge: 0,
};

let currentLat = "";
let currentLng = "";

function success(position) {
  // 지도의 현재 중심좌표를 얻어옵니다
  var center = map.getCenter();

  //console.log("center", center);

  // 목표 위치 좌표 설정
  var targetLat = parseFloat(center.getLat().toFixed(5));
  var targetLng = parseFloat(center.getLng().toFixed(5));

  // 현재위치 좌표를 변수에 담기
  currentLat = parseFloat(position.coords.latitude.toFixed(6));
  currentLng = parseFloat(position.coords.longitude.toFixed(6));

  //console.log("현재 위치 좌표, 목표위치 좌표");
  //console.log(currentLat, currentLng, targetLat, targetLng);

  displayDistance(currentLat, currentLng, targetLat, targetLng);
}

function error(err) {
  console.warn("ERROR(" + err.code + "): " + err.message);
}
