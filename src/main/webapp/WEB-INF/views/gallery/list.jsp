<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/ind/topTmp.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(function () {
	$("title").text("갤러리게시판");
	$("#galleryBtn").click(function () {
		$("form").attr("action","/galleryWritePage");
		$("form").submit();
	});
})
function Read(p1) {
	let p3 = $("#pKeyField").val().trim();
	let p4 = $("#pKeyWord").val().trim();
	let param = "/galleryRead?num="+p1;
		param += "&keyField="+p3;
		param += "&keyWord="+p4 ;
	location.href= param;
}
</script>
<link rel="stylesheet" href="/style/style_Gallery.css">
<script src="/script/script_Gallery.js"></script>
<style>
#pageInfo{justify-content: space-between;}
#noticeList{border-collapse: collapse; width: 80%; text-align: center;}
.prnTr>td:nth-child(2){text-align: left;}
.prnTr:hover{background-color: rgba(90, 185, 94, 0.3);
	cursor: pointer;}
.prnTr>td>img{width: 16px; height: 10px;}
</style>
			<!--  헤더템플릿 시작, iframe으로 변경 -->
			<%@ include file="/WEB-INF/views/ind/headerTmp.jsp" %>
	    	<!--  헤더템플릿 끝 -->    	
    	
    	<main id="main" >
    		<div id="innerWrap" class="dFlex">
    		<div id="lnb">
	    		<!--  메인 LNB 템플릿 시작 -->
	    		
				<%@ include file="/WEB-INF/views/ind/mainLnbTmp.jsp" %>
				
	    		<!--  메인 LNB 템플릿 끝 -->    	
    		</div>
    		
	    	<!-- 실제 작업 영역 시작 -->
    		<div id="contents">
    		
    			<h3><a href="/gallery/list.jsp?gnbParam=gallery">갤러리게시판</a></h3>
	    			<div id="pageInfo" class="dFlex">
	    			</div>
	    			
    			<div id="container">
    			<c:forEach items="${galleryList }" var="g">
	    			<div id="post" onclick="Read('${g.num}')">
		    			<div id="imgBox"><img src="galleryDir/${g.fileName}" alt="#" /></div>
		    			<div id="titleBox">제목 : ${g.subject}</div>
		    			<div id="uName">작성자 :  ${g.uname}</div>
		    			<div id="date">작성일 : ${g.regTM}</div>
		    			<div id="viewCnt">조회수 : ${g.readCnt}</div>
	    			</div>
    			</c:forEach>
				</div>
	    		<div id="listBtnArea">
	    			<c:if test="${uidSession!=null }">
						<button type="button" id="galleryBtn" class="listBtnStyle">글쓰기</button>
					</c:if>
	    			<form action="gallerySearch">
						<div>
							<input type="hidden" value="${uidSession }" name="uid" id="uid">
							<select name="keyField" id="keyField">
								<option value="subject">제  목
								</option>
								<option value="uName">이  름
								</option>
								<option value="content">내  용
								</option>
							</select>	
							<input type="text" name="keyWord" id="keyWord" 
							size="20" maxlength="30"/>
							<button type="button" id="searchBtn">검색</button>
						</div>	
						<input type="hidden" id="pKeyField" value="" />
						<input type="hidden" id="pKeyWord" value=""/>
   					</form>
	    		</div>
	    		
	    		<div id="listPagingArea">
    			
<!--     			<div id="pagingTd"> -->
<!--     				<span class="moveBlockArea" onclick="moveBlock('', '')"> -->
<!-- 						&lt;  -->
<!-- 					</span> -->
<!--     				<span class="moveBlockArea" ></span> -->
<!--     				<span class="nowPageNum"></span> -->
<!--     					<span class="pageNum" onclick="movePage('')"> -->
<!--     					</span> -->
<!--     					<span  class="moveBlockArea"  -->
<!--     					onclick="moveBlock('', '')"> -->
<!-- 							&gt; -->
<!-- 						</span> -->
<!--     					<span class="moveBlockArea"></span> -->
<!--     			</div> -->
    			
    		</div>
    		</div>
    		
    		
    		<!-- 실제 작업 영역 끝 -->
    		</div>
    	</main>
    	<!--  main#main  -->
    
    	<!--  푸터템플릿 시작 -->
		<%@ include file="/WEB-INF/views/ind/footerTmp.jsp" %>
    	<!--  푸터템플릿 끝 -->  
