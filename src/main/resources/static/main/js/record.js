/**
 * 검색창 클릭 시 검색기록 제공
 */

const searchForm = document.getElementById("searchForm");
const searchInput = document.querySelector(".search_input");
const searchList = document.querySelector("#todo-list");
const delAllBtn = document.querySelector(".allDelete");
const txt = document.querySelector(".txt");
const TODOS_KEY = "todos";

let record = new Array();

//헤더 부분 검색창 클릭 시 최근 검색어 보여주기
searchInput.addEventListener("click", function () {
  document.querySelector(".todo-inner").style.display = "block";
  document.querySelector(".search_input_bar").style.borderRadius = "21px 21px 0 0";
});

//바디 부분 클릭 시 최근 검색어 숨기기
document.querySelector("body").addEventListener("click", function (event) {
  if (event.target.matches(".search_input, .todo-inner *")) {
    return;
  }

  document.querySelector(".todo-inner").style.display = "none";
  document.querySelector(".search_input_bar").style.borderRadius = "21px";
});

function saveToDos() {
  //item을 localStorage에 저장합니다.
  typeof Storage !== "undefined" && localStorage.setItem(TODOS_KEY, JSON.stringify(toDos));
}

function allDeleteToDo() {
  //전체 item을 삭제
  localStorage.clear(record);
  searchList.innerText = "최근 검색 내역이 없습니다.";
}

function deleteToDo(e) {
  //각각의 item을 삭제
  const li = e.target.parentElement;
  li.remove();
  record = record.filter((toDo) => toDo.id !== parseInt(li.id));
  record.length === 0 && (txt.innerText = "최근검색어 내역이 없습니다.");
  saveToDos();
}

function paintToDo(newTodo) {
  //화면에 뿌림
  const { id, text } = newTodo;
  const item = document.createElement("li");
  const span = document.createElement("span");
  const button = document.createElement("button");
  item.id = id;
  span.innerText = text;
  button.innerText = "❌";
  button.addEventListener("click", deleteToDo);
  delAllBtn.addEventListener("click", allDeleteToDo);
  item.appendChild(span);
  item.appendChild(button);
  searchList.appendChild(item);
  newTodo !== null && delAllBtn.classList.remove("off");
}

function handleToDoSubmit(event) {
  //form 전송
  event.preventDefault();
  const newTodoItem = searchInput.value;
  searchInput.value = "";
  const newTodoObj = {
    id: Date.now(),
    text: newTodoItem,
  };
  record.push(newTodoObj);
  paintToDo(newTodoObj);
  saveToDos();
}

searchForm.addEventListener("submit", handleToDoSubmit);

const savedToDos = JSON.parse(localStorage.getItem(TODOS_KEY));
if (savedToDos !== null) {
  record = savedToDos; //전에 있던 items들을 계속 가지도 있다록 합니다.
  savedToDos.forEach(paintToDo);
}
