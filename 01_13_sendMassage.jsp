<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
			String sender = request.getParameter("sender");
			String receiver = request.getParameter("receiver");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			
		
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			boolean membercheck= false;
			boolean check = false;
			
			
			try{
			   String jdbcUrl = "jdbc:mysql://localhost:3306/PROJECT01?serverTimezone=UTC&useSSL=false";
			   String dbId= "root";
			   String dbPw= "root";
			   Class.forName("com.mysql.cj.jdbc.Driver");
			   conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			   String checkmembersql = "SELECT count(*) FROM member where id=?";
			   pstmt = conn.prepareStatement(checkmembersql);
			   pstmt.setString(1, receiver);
			   rs = pstmt.executeQuery();
			   
			   
			   if(rs.next() && rs.getInt(1) > 0 ){
				   membercheck = true;
			   }
			   
			   if(membercheck){
			   String sql = "insert into message (sender, receiver, content, subject, send_date) values(?, ?, ?, ?, NOW())";
			   pstmt = conn.prepareStatement(sql);
			   pstmt.setString(1, sender);
			   pstmt.setString(2, receiver);
			   pstmt.setString(3, content);
			   pstmt.setString(4, subject);
			   
			   
			   int result = pstmt.executeUpdate();
		         if(result == 1){
		            check = true;
		         }
			   }
			   
			}catch(Exception e){
			   e.printStackTrace();
			}finally{
			   if(conn != null){
			      conn.close();
			   }
			   if(pstmt != null){
			      pstmt.close();
			   }
			   
			   if(rs != null){
			      rs.close();
			   }
			}
			
%>

	<% if(check) { %>
		<script>
		alert("쪽지가 성공적으로 전송되었습니다!")
		</script>
	<% }else{ %>
		<script>
		alert("전송 실패 ")
		location.href="01_01_main.jsp"
		</script>
	<% }  %>
	
	
</body>
</html>