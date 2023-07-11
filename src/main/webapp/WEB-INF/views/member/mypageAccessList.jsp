<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/ind/topTmp.jsp" %>
<script>
$(function () {
	$("title").text("접속정보조회");
})
</script>
<style>
	#contents{text-align: center;}
	table{border-collapse: collapse; width: 80%; margin: auto;}
	#loginInfo{ background-color: rgba(0,127,255,0.12); font-weight: bold; text-align: center;}
	tr{ text-align: center; height: 30px;}
	tr>td:first-child{width: 10%;}
	tr>td:nth-child(2){width: 40%;}
	tr>td:nth-child(3){width: 35%;}
	tr>td:last-child{width: 15%;}
	td{border: 1px solid #000; width: 80%; }
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
	    			<p><b>${uidSession }</b> 님의 접속 내역</p><br />
    			<table>
    				<tbody>
    					<tr id="loginInfo">
    						<td>번호</td>
    						<td>일시</td>
    						<td>로그인 IP</td>
    						<td>접속 수단</td>
    					</tr>
    					<tr>
    						<td></td>
    						<td></td>
    						<td></td>
    						<td></td>
    					</tr>
    				</tbody>
    			</table>
    		
    		</div>
    		<!-- 실제 작업 영역 끝 -->
    		</div>	
    	</main>
    	<!--  main#main  -->
    
<!--  푸터템플릿 시작 -->
<%@ include file="/WEB-INF/views/ind/footerTmp.jsp" %>
<!--  푸터템플릿 끝 -->  