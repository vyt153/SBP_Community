<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/ind/topTmp.jsp" %>
<script>
$(function () {
	$("title").text("회원탈퇴");
	
	$("#memQuitBtn").click(function () {
		if($("#id").val()==""){
			alert("아이디를 입력해주세요.")
		}else if($("#pw").val()==""){
			alert("비밀번호를 입력해주세요.")
		} else{
			$("#memQuitFrm").attr("action","memberQuit");
			$("#memQuitFrm").submit();
		}
	});
	
	if($("#memberQuit").val()=='false'){
		alert("일치하는 계정이 없습니다.");
		$("#memberQuit").val('');
	}else if($("#memberQuit").val()=='true'){
		alert("회원이 탈퇴되었습니다. 그동안 이용해주셔서 감사합니다.");
		$("#memberQuit").val('');
		$("#memQuitFrm").attr("action","logout");
		$("#memQuitFrm").submit();
	}
})
</script>
<style>
input{padding: 10px; margin: 10px; font-size: 20px;}
p{font-size: 13px;}
h1{margin-bottom: 20px;}
#contents{text-align: center;}
#memQuitBtn{padding: 8px; font-size: 14px;}
</style>
<script src="/script/script_MemMod.js"></script>
	<!-- 헤더템플릿 시작 -->
	<%@ include file="/WEB-INF/views/ind/headerTmp.jsp" %>
	<!-- 헤더템플릿 끝 -->
	
	<main id="main" class="dFlex">
		<div id="innerWrap" class="dFlex">
    		<div id="lnb">
	    		<!--  메인 LNB 템플릿 시작 -->
				<%@ include file="/WEB-INF/views/ind/mainLnbTmp.jsp" %>
	    		<!--  메인 LNB 템플릿 끝 -->    	
    		</div>
		<!-- 실제 작업 영역 시작 -->
		<div id="contents" class="memQuitDiv">
			<form name="memQuitFrm" id="memQuitFrm" method="post">
				<h2>회원탈퇴</h2>
				<div>
					<input type="text" name="uid" id="id" placeholder="아이디 입력" size="25"/>
				</div>
				<div>
					<input type="text" name="upw" id="pw" placeholder="비밀번호 입력" size="25"/>
				</div>
				<button id="memQuitBtn" type="button">회원 탈퇴하기</button>
			</form>
		</div>
		</div>
		<!-- 실제 작업 영역 끝 -->
	</main>
	<form action="logout" id="memberQuitChkForm"></form>
	<input type="hidden" value="${memberQuit }" id="memberQuit">
	<!--  푸터템플릿 시작 -->
	<%@ include file="/WEB-INF/views/ind/footerTmp.jsp" %>
   	<!--  푸터템플릿 끝 -->  