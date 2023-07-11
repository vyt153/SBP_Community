<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/ind/topTmp.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
$(function () {
	$("title").text("마이페이지");
})
</script>
<link rel="stylesheet" href="/style/style_MemMod.css">
<style>
caption#cap{background-color: #50b639;}
</style>
			<!--  헤더템플릿 시작, iframe으로 변경 -->
			<%@ include file="/WEB-INF/views/ind/headerTmp.jsp" %>
	    	<!--  헤더템플릿 끝 -->    	
    	
    	<main id="main" class="dFlex">
    		<div id="innerWrap" class="dFlex">
    		<div id="lnb">
	    		<!--  메인 LNB 템플릿 시작 -->
	    		
				<%@ include file="/WEB-INF/views/ind/mainLnbTmp.jsp" %>
				
	    		<!--  메인 LNB 템플릿 끝 -->    	
    		</div>
    		
	    	<!-- 실제 작업 영역 시작 -->
    		<div id="contents">
	    		<form name="modFrm" id="modFrm">
					
						<table id="modFrmTbl">
							<caption id="cap">회원 정보</caption>
							<tbody>
								<tr>
									<td class="req">아이디</td>
									<td>${memberInfo.uid }
										<input type="hidden" name="uid" value="" >
									</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td class="req">이름</td>
									<td>${memberInfo.uname }
									</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td class="req">Email</td>
									<td>${memberInfo.uemail }
									</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>성별</td>
									<td>
									<c:if test="${memberInfo.gender==null }">
										입력안함
									</c:if>
									<c:if test="${memberInfo.gender==1 }">
										남자
									</c:if>
									<c:if test="${memberInfo.gender==2 }">
										여자
									</c:if>
									</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>생년월일</td>
									<td>
									<c:if test="${memberInfo.ubirthday==null||memberInfo.ubirthday=='' }">
										입력안함
									</c:if>
									<c:if test="${memberInfo.ubirthday!=null }">
										${memberInfo.ubirthday }
									</c:if>
									 </td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>우편번호</td>
									<td>
									<c:if test="${memberInfo.uzipCode=='' }">
										입력안함
									</c:if>
									<c:if test="${memberInfo.uzipCode!=null }">
										${memberInfo.uzipCode }
									</c:if>
									</td>
								</tr>
								<tr>
									<td>주소</td>
									<td>
									<c:if test="${memberInfo.uaddr==null||memberInfo.uaddr=='' }">
										입력안함
									</c:if>
									<c:if test="${memberInfo.uaddr!=null }">
										${memberInfo.uaddr }
									</c:if>
									</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>취미</td>
									<td>
									<c:if test="${fn:substring(memberInfo.uhobby,1, 2)==1 }">
									<c:set var="internet" value="checked" /></c:if>
									<c:if test="${fn:substring(memberInfo.uhobby,4, 5)==1 }">
									<c:set var="trip" value="checked" /></c:if>
									<c:if test="${fn:substring(memberInfo.uhobby,7, 8)==1 }">
									<c:set var="game" value="checked" /></c:if>
									<c:if test="${fn:substring(memberInfo.uhobby,10, 11)==1 }">
									<c:set var="movie" value="checked" /></c:if>
									<c:if test="${fn:substring(memberInfo.uhobby,13, 14)==1 }">
									<c:set var="exercise" value="checked" /></c:if>
										<label><input type="checkbox" name="uhobby" value="인터넷" ${internet }/>인터넷</label>
										<label><input type="checkbox" name="uhobby" value="여행" ${trip }/>여행</label>
										<label><input type="checkbox" name="uhobby" value="게임" ${game }/>게임</label>
										<label><input type="checkbox" name="uhobby" value="영화" ${movie }/>영화</label>
										<label><input type="checkbox" name="uhobby" value="운동" ${exercise }/>운동</label>
									</td>
								</tr>
								<tr>
									<td>직업</td>
									<td>
									<c:if test="${memberInfo.ujob==null||memberInfo.ujob=='' }">
										입력안함
									</c:if>
									<c:if test="${memberInfo.ujob!=null }">
										${memberInfo.ujob }
									</c:if>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
    		</div>
    		<!-- 실제 작업 영역 끝 -->
    		</div>	
    	</main>
    	<!--  main#main  -->
    
    	<!--  푸터템플릿 시작 -->
		<%@ include file="/WEB-INF/views/ind/footerTmp.jsp" %>
    	<!--  푸터템플릿 끝 -->  
    