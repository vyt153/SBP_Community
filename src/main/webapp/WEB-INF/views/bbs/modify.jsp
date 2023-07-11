<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/ind/topTmp.jsp" %>
<link rel="stylesheet" href="/style/style_BBS.css">
<script src="/script/script_BBS.js"></script>	
<script>
$(function () {
	$("title").text("게시글 수정");
})
</script>
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
   	
   	
    	<div id="contents" class="bbsWrite">
    		<h2>글 수정하기</h2>
    		
    		<form name="modFrm" enctype="multipart/form-data" method="post" id="modFrm">
	    		<table>
	    			<tbody>
	    				<tr>
	    					<td class="req">성명</td>
	    					<td>
								${board.uname }
	    						<input type="hidden" name="uname" value="${board.uname }"/>
	    						<input type="hidden" name="uid" value="${board.uid }"/>
	    					</td>
	    				</tr>
	    				<tr>
	    					<td class="req">제목</td>
	    					<td>
	    						<input type="text" id="subject" name="subject" value="${board.subject }"/>
	    					</td>
	    				</tr>
	    				<tr>
	    					<td class="contentTD">내용</td>
	    					<td>
	    						<textarea name="content" 
									id="content" cols="60" wrap="hard">${board.content }</textarea>
	    					</td>
	    				</tr>
	    				<tr>
	    					<c:if test="${board.fileName=='' }">
	    					<td>파일첨부</td>
	    					<td>
	    						<span class="spanFile">
	    							<input type="file" name="filename" id="filename"/>
	    						</span>
	    					</td>
	    					</c:if>
	    					<c:if test="${board.fileName!='' }">
	    					<td>파일 수정</td>
	    					<td>
	    						<span class="spanFile">
									${board.oriFileName }
	    							<label class="fileUplodeHid">
		    							<input type="file" name="filename"/>
		    							<button type="button" id="fileModBtn">파일 변경</button>
	    							</label>
	    							<button type="button" id="fileDelBtn">파일 삭제</button>
	    						</span>					
								<small>* 파일은 하나만 업로드 가능합니다.</small>
								<!-- 파일 삭제 클릭시 value값이 1로 변경 됨. -->			    						
	    						<input type="hidden" name="delFile" id="fileDelData"/>
	    					</td>
							</c:if>
	    				</tr>
	    				<tr>
	    					<td>내용타입</td>
	    					<td>
	    						<label><input type="radio" name="contentType" value="HTML" />
	    						<span>HTML</span></label>
	    						<label><input type="radio" name="contentType" value="HTML" checked/>
	    						<span>TEXT</span></label>
	    					</td>
	    				</tr>
	    			</tbody>
	    			<tfoot>
	    				<tr>
	    					<td colspan="2"> <hr /></td>
	    				</tr>
	    				<tr>
	    					<td colspan="2">
		    					<button type="button" id="modProcBtn">수정하기</button>
		    					<button type="button" id="resetBtn" onclick="reset()">다시쓰기</button>
		    					<button type="button" id="listBtn">리스트</button>
	    					</td>
	    				</tr>
	    			</tfoot>
	    		</table>
	    		<input type="hidden" name="num" value="${board.num }"/>
    		</form>
    	</div>
    	</div>
   	</main>
   	<!--  푸터템플릿 시작 -->
	<%@ include file="/WEB-INF/views/ind/footerTmp.jsp" %>
   	<!--  푸터템플릿 끝 -->  