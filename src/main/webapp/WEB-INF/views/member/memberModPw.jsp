<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/ind/topTmp.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(function(){
	$("title").text("비밀번호 변경");
	$("button").click(function () {
		if($("input").val()==""){
			alert("기존 비밀번호를 입력해주세요");
		} else if($("#newPw").val()==""){
			alert("변경하실 비밀번호를 입력해주세요");
		}else if($("#newPw").val().trim()!=$("#newPwChk").val().trim()){
			alert("새 비밀번호가 일치하지 않습니다.");
		} else{
			$("#modPwForm").attr("action","memberModPw");
			$("#modPwForm").submit();
		}
	});
	if($("#modPwChk").val()=='false'){
		alert("비밀번호를 확인해주세요.");
		$("#modPwChk").val('');
	} else if($("#modPwChk").val()=='true'){
		alert("비밀번호가 변경되었습니다. 다시 로그인해주세요.");
		$("#modPwChk").val('');
		$("#modPwForm").attr("action","logout");
		$("#modPwForm").submit();
	}
});
</script>
<style>
table{border-collapse: collapse; margin: 10px auto;}
td{padding: 10px; border: 1px solid #aaa;}
input{padding: 10px;}
button{padding: 10px; color: #fff;background-color: #50b639; width: 200px; border: none; cursor: pointer;}
#contents{text-align: center;}
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
			<form id="modPwForm">
				<ul>
					<li>${uidSession} 님 비밀번호 수정</li>
				</ul>
				<table>
					<tr>
						<td>현재 비밀번호</td>
						<td>
						<input type="hidden" name="uid" value="${uidSession }"/>
						<input type="text" name="upw"/>
						</td>
					</tr>
					<tr>
						<td>새 비밀번호</td>
						<td>
						<input type="text" id="newPw" name="newPw"/>		
						</td>
					</tr>
					<tr>
						<td>새 비밀번호 확인</td>
						<td>
						<input type="text" id="newPwChk" name="newPwChk"/>
						</td>
					</tr>
				</table>
				</form>
			<div>
				<button type="button">변경</button>
			</div>
			</div>
 		</div>	
    	</main>
    	<!--  main#main  -->
    	<input type="hidden" value="${memberModPw }" id="modPwChk">
<!--  푸터템플릿 시작 -->
<%@ include file="/WEB-INF/views/ind/footerTmp.jsp" %>
<!--  푸터템플릿 끝 -->  