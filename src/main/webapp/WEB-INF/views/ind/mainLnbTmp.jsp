<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<nav id="mainLNB">
		<ul id="lnbMainMenu">
			<li class="lnbMainH1">
				<p class="tit"></p>
			</li>
			<c:if test="${mypage }">
			<li class="lnbMainLi "><a href="memberModPage?uid=${uidSession }">회원정보수정</a></li>
			<li class="lnbMainLi "><a href="memberModPwPage?uid=${uidSession }">비밀번호변경</a></li>
			<li class="lnbMainLi "><a href="mypageAccessList?uid=${uidSession }">접속내역</a></li>
			<li class="lnbMainLi "><a href="memberQuitPage?uid=${uidSession }">회원탈퇴</a></li>
			</c:if>
			<!-- customer service center : 고객센터 -->
			<c:if test="${!mypage }">
			<li class="lnbMainLi"><a href="boardList?gnbParam=bbs">자유게시판</a></li>
			<li class="lnbMainLi"><a href="galleryList?gnbParam=gallery">갤러리게시판</a></li>
			<li class="lnbMainLi"><a href="noticeList?gnbParam=notice">공지사항</a></li>
			</c:if>
		</ul>
	</nav>