<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/ind/topTmp.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
$(function () {
	$("title").text("회원정보수정");
})
</script>
<link rel="stylesheet" href="/style/style_MemMod.css">
<script src="/script/script_MemMod.js"></script>
	<!-- 헤더템플릿 시작 -->
	<%@ include file="/WEB-INF/views/ind/headerTmp.jsp" %>
	<!-- 헤더템플릿 끝 -->
	
	
	<!-- 실제 작업영역 시작-->
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
					<caption>회원 정보 수정</caption>
					<tbody>
						<tr>
							<td class="req">아이디</td>
							<td>${memberInfo.uid }
								<input type="hidden" name="num" value="${memberInfo.num }" >
								<input type="hidden" name="uid" value="${memberInfo.uid }" >
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td class="req">이름</td>
							<td>
								<input type="text" name="uname" id="uname" maxlength="20"
								value="${memberInfo.uname }"/>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td class="req">Email</td>
							<td>
							<c:set var="email" value="${fn:split(memberInfo.uemail,'@') }"/>
								<input type="text" id="uemail_01" maxlength="20" size="7"
								value="${email[0] }"/>
								<span>@</span>
								<input type="text" id="uemail_02" maxlength="20" size="10"
								value="${email[1] }"/>
								
								<select id="emailDomain" class="frmDropMenu">
									<option value="">직접입력</option>
									<option>naver.com</option>
									<option>daum.net</option>
								</select>
								
								<button type="button" id="emailAuthBtn" class="frmBtn">인증코드받기</button>
								
								<!-- 이메일 인증영역 시작 : Authentication Code 인증코드 -->
								
								<div id="emailAuthArea">
									<span>인증코드 입력</span>
									<input type="text" id="emailAuth" size="25" />
									<button type="button" class="frmBtn">인증하기</button>
								</div>
								<!-- div#emailAuthArea -->
								
								<input type="hidden" name="uemail" id="uemail" />
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>성별</td>
							<td>
							<label>
							<c:if test="${memberInfo.gender==1 }"><c:set value="checked" var="man"/></c:if>
							<c:if test="${memberInfo.gender==2 }"><c:set value="checked" var="woman"/></c:if>
								남<input type="radio" name="gender" value="1" ${man }/></label>
							<label>
								여<input type="radio" name="gender" value="2" ${woman }/></label>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td>
								<input type="text" name="ubirthday" id="ubirthday"
							 maxlength="6" size="8" value="${memberInfo.ubirthday }"/>
							 </td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>우편번호</td>
							<td>
								<input type="text" name="uzipcode" id="uzipcode" maxlength="7" size="7" value="${memberInfo.uzipCode }" readonly />
								<button type="button" id="findZipBtn" class="frmBtn">우편번호찾기</button>
							</td>
							<td><span>우편번호 찾기 버튼을 클릭하세요.</span></td>
						</tr>
						<tr>
							<td>주소</td>
							<td>
								<input type="text" name="uaddr" id="uaddr" maxlength="100" size="50" value="${memberInfo.uaddr }" />
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
							<td></td>
						</tr>
						<tr>
							<td>직업</td>
							<td>
							<c:if test="${memberInfo.ujob=='교수' }"><c:set value="selected" var="professor"/></c:if>
							<c:if test="${memberInfo.ujob=='학생' }"><c:set value="selected" var="student"/></c:if>
							<c:if test="${memberInfo.ujob=='회사원' }"><c:set value="selected" var="employee"/></c:if>
							<c:if test="${memberInfo.ujob=='공무원' }"><c:set value="selected" var="official"/></c:if>
							<c:if test="${memberInfo.ujob=='자영업' }"><c:set value="selected" var="self-employed"/></c:if>
							<c:if test="${memberInfo.ujob=='전문직' }"><c:set value="selected" var="profession"/></c:if>
							<c:if test="${memberInfo.ujob=='주부' }"><c:set value="selected" var="housekeeper"/></c:if>
							<c:if test="${memberInfo.ujob=='무직' }"><c:set value="selected" var="inoccupation"/></c:if>
								<select name="ujob" id="ujob" class="frmDropMenu">
									<option>- 선택 -</option>
									<option ${professor }>교수</option>
									<option ${student }>학생</option>
									<option ${employee }>회사원</option>
									<option ${official }>공무원</option>
									<option ${self-employed }>자영업</option>
									<option ${profession }>전문직</option>
									<option ${housekeeper }>주부</option>
									<option ${inoccupation }>무직</option>
								</select>
							</td>
							<td></td>
						</tr>
						<tr>
							<td colspan="3">
								<button type="button" id="modSbmBtn" class="frmBtn">수정하기</button>
								<button type="reset" class="frmBtn">다시쓰기</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		<!-- form[name=regFrm -->
		</div>
  		<!-- 실제 작업 영역 끝 -->
		</div>
	</main>
	<!-- 실제 작업영역 끝 -->
	
	<!-- 푸터템플릿 시작 -->
	<%@ include file="/WEB-INF/views/ind/footerTmp.jsp" %>
	<!-- 푸터템플릿 끝 -->
