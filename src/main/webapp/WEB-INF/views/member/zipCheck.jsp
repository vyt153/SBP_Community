<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>우편번호 찾기</title>
	    <link rel="stylesheet" href="/style/style_Common.css">
	    <script src="/resource/jquery-3.6.0.min.js"></script>
	    <script src="/script/script_Join.js"></script>
	</head>
	<body>
		<div id="wrap_zipcodePopup">
			<h1>우편번호 찾기</h1>
			<form action="" id="zipFrm">
				<table id="zipFrmTbl">
					<tbody>
						<tr>
							<td id="serachInputArea">
								<span>동 이름 입력</span>
								<input type="text" name="area3" id="area3" />
								<button id="addrSearchBtn" type="button">검색</button>							
							</td>
						</tr>
						<tr>
							<td><hr /></td>
						</tr>
						<tr>
							<td id="zipResArea">
								<span>검색어를 입력해주세요</span>
								<span><b>[ ]</b></span>에 대한 검색결과입니다.
								
								<table id="zipResTbl">
									<tbody>
									
										<tr>
											<td><span></span></td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<!-- div#wrap -->
	</body>
</html>