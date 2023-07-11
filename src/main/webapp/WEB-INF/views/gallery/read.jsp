<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/ind/topTmp.jsp" %>
<script>
$(function () {
	$("title").text("갤러리게시판 글 보기");
	$("#modBtn").click(function () {
		let num = $("#num").val();
		let url = "galleryModPage?gnbParam=gallery";
		url += "&num="+num;
		location.href = url;
	});
	$("#delBtn").click(function () {
		if(confirm("삭제하시겠습니까?")){
			$("#delFrm").submit();		
		}
	});
})
</script>
<style>
#contents div{margin: 5px;}
#container{display: flex;}
#imgBox{width: 300px; height: 100%; overflow: hidden;}
img{width: 100%;height: 100%;object-fit:cover;}
#textBox{flex: 1}
</style>
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
			<div id="contents">
				<header>
					<div>
						<h3>${gallery.subject }</h3>
					</div>
					<div>
						<div>${gallery.uname }</div>
						<div>
							<span>${gallery.regTM }</span><span> 조회수 : ${gallery.readCnt }</span>
						</div>
					</div>
				</header>
				<div id="container">
					<div id="imgBox">
						<img src="/galleryDir/${gallery.fileName }" alt="#" />
					</div>
					<div id="textBox">${gallery.content }</div>
				</div>
					<button type="button" onclick="location.href='galleryList?gnbParam=gallery'">목록</button>
						<c:if test="${gallery.uid==uidSession }">
							<button type="button" id="modBtn">수 정</button>
							<button type="button" id="delBtn">삭 제</button>
						</c:if>
			</div>
			<form action="galleryDelete" id="delFrm">
				<input type="hidden" name="num" value="${gallery.num }" id="num"/>
			</form>
		</div>
	</main>
<!-- 푸터템플릿 시작 -->
<%@ include file="/WEB-INF/views/ind/footerTmp.jsp" %>
<!-- 푸터템플릿 끝 -->