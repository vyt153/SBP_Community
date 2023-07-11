<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>아이디 중복 체크</title>
	    <link rel="stylesheet" href="/style/style_Common.css">    
	    <script src="/resource/jquery-3.6.0.min.js"></script>
	    <script src="/script/script_Join.js"></script>
	</head>
	<body>
		<div id="wrap_Popup">
			<div>
				<h1><%=uid %></h1>
				
		<span>
				</span>
			</div>
			<hr />
			<div id="closeBtnArea">
 				<button type="button">돌아가기</button> 
			</div>
		</div>
		<!-- div#wrap -->
	</body>
</html>