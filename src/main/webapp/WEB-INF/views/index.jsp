<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ind/topTmp.jsp" %>
<style>
#iconSample {
    width: 13px;
    height: 13px;
    color: #fff;
    font-size: 11px;
    text-align: center;
    line-height: 13px;
    border-radius: 50%;
    background-color: #f44;
    display: inline-block;
    transform: translate(2px, -2px);
}
div.bbsList tr.adminTr>td {
	text-align: center;
	padding: 20px 2px 10px;
	border-bottom: 1px solid #d2d2d2;
	color: #aaa;
	font-weight: bold;
}

div.bbsList tr.adminTr>td.subjectTd {
	text-align: left;
}
.fixedNotice{text-align: center;}
.fixedNotice>td:nth-child(2){text-align: left;}
.fixedNotice:hover{background-color: rgba(90, 185, 94, 0.3);
	cursor: pointer; font-weight: bold;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
$(function () {
	$("title").text("cheers");
})
function Read(p1,p2) {
	let p3 = $("#pKeyField").val().trim();
	let p4 = $("#pKeyWord").val().trim();
	let param = "/notice/read.jsp?num="+p1;
		param += "&nowPage="+p2;
		param += "&keyField="+p3;
		param += "&keyWord="+p4 ;
	location.href= param;
}
</script>
<link rel="stylesheet" href="style/style_BBS.css">
<script src="script/script_BBS.js"></script>

<!--  헤더템플릿 시작, iframe으로 변경 -->
<%@ include file="ind/headerTmp.jsp" %>
    	<!--  헤더템플릿 끝 -->    	
    	
			<main id="main">
    		<div id="innerWrap" class="dFlex">
    			
	    		<div id="lnb">
		    		<!--  메인 LNB 템플릿 시작 -->
					<%@ include file="ind/mainLnbTmp.jsp" %>
		    		<!--  메인 LNB 템플릿 끝 -->    	
	    		</div>
	    		
		    	<!-- 실제 작업 영역 시작 -->
	    		<div id="contents" class="bbsList">
	    			<h3><a href="/bbs/list.jsp?gnbParam=bbs">자유게시판</a></h3>
	    			<div id="pageInfo" class="dFlex">
	    			<span> 개</span>
	    			<span>페이지 : </span>
	    			</div>
	    			
	    			<table id="boardList">
	    				<thead>
	    					<tr>
	    						<th>번호</th>
	    						<th>제목</th>
	    						<th>이름</th>
	    						<th>날짜</th>
	    						<th>조회수</th>
	    					</tr>
	    					<tr>
	    						<td colspan="5" class="spaceTd"></td>
	    					</tr>
	    				</thead>
	    				<tbody>
	    				<tr class="fixedNotice" onclick="Read()">
	    					<td></td>
	    					<td></td>
	    					<td></td>
	    					<td></td>
	    					<td></td>
	    				</tr>
   				
	    					<tr class="adminTr">
	    						<td>
	    						</td>
	    						<td class="subjectTd">
	    							
	    						</td>
	    						<td></td>
	    						<td></td>
	    						<td></td>
	    					</tr>
	    					<tr class="prnTr" onclick="read('')">
	    						<td>
	    						</td>
	    						<td class="subjectTd">
	    						
	    						</td>
	    						<td></td>
	    						<td></td>
	    						<td></td>
	    					</tr>
	    					<tr id="listBtnArea">
	    						<td colspan="2">
	    						<c:if test="${uidSession!=null }">
	    							<button type="button" id="writeBtn" class="listBtnStyle">글쓰기</button>
								</c:if>
	    						</td>
	    						<td colspan="3">
	    							<form name="searchFrm" class="dFlex" id="searchFrm">
	    								<div>
	    									<select name="keyField" id="keyField">
	    										<option value="subject">제  목
	    										</option>
	    										<option value="uName">이  름
	    										</option>
	    										<option value="content">내  용
	    										</option>
	    									</select>
	    								</div>
	    								<div>
	    									<input type="text" name="keyWord" id="keyWord" 
	    									size="20" maxlength="30" value=""/>
	    								</div>
	    								<div>
	    									<button type="button" id="searchBtn" class="listBtnStyle">검색</button>
	    								</div>
	    							</form>
	    							<!-- 검색결과 유지용 매개변수 데이터 -->
	    							<input type="hidden" id="pKeyField" value="" />
	    							<input type="hidden" id="pKeyWord" value=""/>
	    							
	    						</td>
	    					</tr> <!-- tr#listBtnArea -->
	    					
	    					<tr id="listPagingArea">
	    					<!-- 페이징 시작 -->
	    						<td colspan="5" id="pagingTd">
	    							<span id="moveBlockArea" onclick="moveBlock('',')"></span>
	    							<span class="moveBlockArea"></span>
	    					
	    					<!-- 페이지 나누기용 페이지번호 출력 시작 -->
	    					 		<span class="nowPageNum"></span>
	    					 		<span class="PageNum" onclick="movePage('')">
	    					 		</span>
	    					 <!-- 페이지 나누기용 페이지번호 출력 끝 -->
	    					 
	    					 		<span class="moveBlockArea" onclick="moveBlock('','')">
	    					 		&gt;</span>
	    					 		<span class="moveBlockArea"></span>
	    					 
	    						</td>
	    					</tr>
	    				</tbody>
	    			</table>
	    		</div>
	    		<!-- 실제 작업 영역 끝 -->
    		</div>
    	</main>
    	
    	<!--  main#main  -->
		<%@ include file="ind/footerTmp.jsp" %>