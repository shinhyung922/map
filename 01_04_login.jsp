<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="01_04_1_login.css">
</head>
<body>
	
	<div class="login-container">
		<h4>로그인</h4>
			<form method="post" action="01_05_loginpro.jsp">
				<input type="text" placeholder="아이디를 입력하세요" name="id">				
				<input type="password" placeholder="비밀번호를 입력하세요" name="pw">
				<input type="submit" value="로그인" class="login-btn">
				<button type="button" class="join-btn" onclick="location.href='01_02_joinform.jsp'">회원가입</button>
			</form>
	</div>
	
</body>
</html>