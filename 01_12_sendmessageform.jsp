<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		request.setCharacterEncoding("utf-8");
		String id = (String)session.getAttribute("log"); 
		
%>
	<form action="01_13_sendMassage.jsp" method="post">
		<input type="hidden" name="sender" value="<%=id %>">
		받는 사람 : <input type="text" name="receiver" >
		제목 : <input type="text" name="subject"><br>
		내용 : <textarea rows="10" cols="20" name="content"></textarea>
		<input type="submit" value="보내기">
		<input type="reset" value="취소">
	
	</form>
</body>
</html>