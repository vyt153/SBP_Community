<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/ind/topTmp.jsp" %>
		<link rel="stylesheet" href="/style/style_Template.css">
		<link rel="stylesheet" href="/style/style_BBS.css">
		<link rel="stylesheet" href="/style/style_Comments.css">
		<script src="/script/script_BBS.js"></script>
		<script src="/script/script_Com.js"></script>
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
    		
    		
	    	<!-- 실제 작업 영역 시작 -->
    		<div id="contents" class="bbsRead">

				<!--  게시글 상세보기 페이지 내용 출력 시작 -->
				<h2>${board.subject }</h2>
				<form id="comFrm">
				<table id="readTbl">
					<tbody id="readTblBody">
						<tr>
							<td>작성자</td>  <!-- td.req 필수입력 -->
							<td>${board.uname }</td>
							<td>등록일</td>  <!-- td.req 필수입력 -->
							<td>${board.regTM }</td>
						</tr>
						<tr>
							<td>첨부파일</td> <!-- td.req 필수입력 -->
							<td colspan="3">
								<input type="hidden" name="filename" value="" 
											id="hiddenFname" form="downloadForm">
							<c:if test="${board.fileName!=''}">	
								<a download href="/boardDir/${board.fileName }" id="downloadFile">${board.oriFileName }</a>	
								(<span>${board.filesize } byte</span>)
							</c:if>							
							<c:if test="${board.fileName == ''}">	
								등록된 파일이 없습니다.
							</c:if>							
							</td>
						</tr>
						<tr>
							<td colspan="4" id="readContentTd"><pre>${board.content }</pre></td>
						</tr>					
					</tbody>
					 
					<tfoot id="readTblFoot">	
						<tr>
							<td colspan="4" id="footTopSpace"></td>							
						</tr>			     
						<tr>
							<td colspan="4" id="articleInfoTd">
								<span>조회수 : ${board.readCnt }</span>
							</td>							
						</tr>
						<tr>
							<td colspan="4" id="hrTd"><hr></td>							
						</tr>
						<!-- 댓글 영역 시작 -->
						<tr>
							<td colspan="4"><b>댓글</b></td>
						</tr>
						<tr>
							<td colspan = "4">댓글이 없습니다.</td>
						</tr>
						
						<tr id="Com">
							<td colspan = "2">
								<input type="hidden" id = "cNum" name="cnum" form = "delBBSCom" value = ""/>
								<input type="hidden" id = "ckeyField" name = "ckeyField" form = "delBBSCom" value="">
								<input type="hidden" id = "ckeyWord" name = "ckeyWord" form = "delBBSCom" value="">
								<input type="hidden" id = "cnowPage" name = "cnowPage" form = "delBBSCom" value="">
							</td>
							<td>
								<button type="button" id="cModBtn">수정</button>
							</td>
							<td>
								<button type="button" id="cDelBtn" onclick = "delProcMtd()">삭제</button>
							</td>
						</tr>
						<tr>
							<td colspan = "3" id = "comTxt">
							</td>
							<td>
							</td>
						</tr>
						
						<tr>
							<td colspan="3">
							<textarea name="comment" id="comment" placeholder = "댓글을 입력해주세요."></textarea>
							</td>
							<td>
							<button type="button" id="comBtn">댓글쓰기</button>
							</td>
						</tr>
						<!-- 댓글 영역 종료 -->
						<tr>
							<td colspan="4" id="hrTd"><hr></td>							
						</tr>
						
						
						
						<tr>
						
							<td colspan="4" id="btnAreaTd" class="read">
								<button type="button" id="listBtn">목록</button>
							<c:if test="${board.uid==uidSession }">
								<button type="button" id="modBtn">수 정</button>
								<button type="button" id="delBtn">삭 제</button>
							</c:if>
							</td>
						</tr>
					</tfoot>
					 
				</table>
				
				<input type="hidden" name="listnum" value="${board.num }" id="listnum">
				<input type="hidden" name="uid" value="${board.uid }" id="uid">
				<input type="hidden" name="uname" value="${board.uname }" id="uname">
				<input type="hidden" name="nowPage" value="" id="nowPage">
				<input type="hidden" name="num" value="${board.num }" id="num">
				
				<!-- 검색어전송 시작 -->
				<input type="hidden" id="pKeyField" value="">
				<input type="hidden" id="pKeyWord" value="">
				<!-- 검색어전송 끝 -->
				</form>
			  
				<!--  게시글 상세보기 페이지 내용 출력 끝 -->
				<form action="/bbs/download.jsp" id="downloadForm"></form>
		    	<form id="delBBSCom"></form>

    		</div>
    		<!-- 실제 작업 영역 끝 -->
    		</div>
    	</main>
    	<!--  main#main  -->
        	   	
    	<!--  푸터템플릿 시작 -->
		<%@ include file="/WEB-INF/views/ind/footerTmp.jsp" %>
    	<!--  푸터템플릿 끝 -->  
        
