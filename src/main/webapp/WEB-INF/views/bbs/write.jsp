<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/ind/topTmp.jsp" %>
<script>
$(function () {
	$("title").text("게시판 글쓰기");
})
</script>
		<link rel="stylesheet" href="/style/style_BBS.css">
		<script src="/script/script_BBS.js"></script>
			<!--  헤더템플릿 시작 -->
			<%@ include file="/WEB-INF/views/ind/headerTmp.jsp" %>
	    	<!--  헤더템플릿 끝 -->
	    	
	    	<main id="main" class="dFlex">
    			<div id="innerWrap" class="dFlex">
	    		<div id="lnb">
		    		<!--  메인 LNB 템플릿 시작 -->
					<%@ include file="/WEB-INF/views/ind/mainLnbTmp.jsp" %>
		    		<!--  메인 LNB 템플릿 끝 -->    	
	    		</div>
    		
	    		<div id="contents" class="bbsWrite">
		    	<h2>글쓰기</h2>
			    	<form name="writeFrm" enctype="multipart/form-data" method="post" id="writeFrm">
<!-- input type="file"이 있다면 무조건 enctype 지정 method="post" 필수(데이터 전송 용량 한계를 없애기 위해) -->
			    		<table>
			    			<tbody>
			    				<tr>
			    					<td class="req">성명</td>
			    					<td>
			    						${uidSession }
			    						<input type="hidden" name="uname" value="${uname }"/>
			    						<input type="hidden" name="uid" value="${uidSession }"/>
			    					</td>
			    				</tr>
			    				<tr>
			    					<td class="req">제목</td>
			    					<td>
			    						<input type="text" name="subject" maxlength="50" id="subject" />
			    					</td>
			    				</tr>
			    				<tr>
			    					<td class="contentTD">내용</td>
			    					<td>
			    						<textarea name="content" id="content" wrap="hard" cols="60"></textarea>
			    					</td>
			    				</tr>
			    				<tr>
			    					<td>파일첨부</td>
			    					<td>
			    						<span class="spanFile">
			    						<input type="file" name="filename" id="filename" /></span>
			    					</td>
			    				</tr>
			    				<tr>
			    					<td>내용타입</td>
			    					<td>
			    						<label>
			    							<input type="radio" name="contentType" value="HTML"/>
			    							<span>HTML</span></label>
			    						<label>
			    							<input type="radio" name="contentType" value="TEXT" checked/>
			    							<span>TEXT</span></label>
			    					</td>
			    				</tr>
			    			</tbody>
			    			<tfoot>
			    				<tr>
			    					<td colspan="2"><hr /></td>
			    				</tr>
			    				<tr>
			    					<td colspan="2">
			    						<button type="button" id="regBtn">등록</button>
			    						<button type="reset" id="resetBtn">다시쓰기</button>
			    						<button type="button" id="listBtn">리스트</button>
			    					</td>
			    				</tr>
			    			</tfoot>
			    		</table>
			    	</form>
		    	</div>
		    	</div>
	    	</main>
<!--  푸터템플릿 시작 -->
<%@ include file="/WEB-INF/views/ind/footerTmp.jsp" %>
  	<!--  푸터템플릿 끝 --> 