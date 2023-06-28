<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>

<form action="" class="searchForm">
  <div class="search_bar">
    <div class="search_input_bar">
      <input type="search" class="search_input" placeholder="지역, 음식 또는 식당명 입력" value="" />
      <button class="search_icon" type="submit" aria-label="검색하기 버튼"></button>
    </div>
    <div class="recent-search-menu">
      <h3>최근 검색어</h3>
      <button class="clear-btn">전체삭제</button>
      <ul class="recent-search-list">
        <!-- 최근 검색어 항목들 -->
      </ul>
    </div>
  </div>
</form>

<!-- 테스트 끝 -->

<script type="module" src="/search/js/test.js"></script>
<script type="module" src="/search/js/search.js"></script>
<%@ include file="include/footer.jsp"%>