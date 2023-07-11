<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header id="header" class="dFlex">
	<!-- 로고, GNB -->
	<div id="innerWrap" class="dFlex">
		<div id="headerLogo">
			<a href="/index.jsp"> <img src="/images/logo.png" alt="헤더로고이미지">
			</a>
		</div>

		<nav id="gnb">

			<ul id="mainMenu" class="dFlex">

				<li class="mainLi"><a href="/">HOME</a></li>
				
				<c:if test="${uidSession!=null }">
				<li class="mainLi"><a href="/mypage?uid=${uidSession }">마이페이지</a></li>
				<li class="mainLi"><a href="/logout">로그아웃</a></li>
				</c:if>
				
				<c:if test="${uidSession==null }">
				<li class="mainLi"><a href="/joinAgreement">회원가입</a></li>
				<li class="mainLi"><a href="/loginPage">로그인</a></li>
				</c:if>
				
				<li class="mainLi"><a href="/csc/cscMain.jsp?gnbParam=csc">고객센터</a></li>

			</ul>

		</nav>

		<c:if test="${uidSession!=null }">
		<p id="userData">
			<span><b>${uidSession }</b>님 로그인 중</span>
		</p>
		</c:if>
		<!-- <script src="/script/header.js"></script> -->
	</div>
</header>
<!--  header#header  -->
