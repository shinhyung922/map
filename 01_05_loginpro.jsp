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
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		boolean check = false;
	
	
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String jdbcUrl ="jdbc:mysql://localhost:3306/PROJECT01?serverTimezone=UTC&useSSL=false";
			String dbId= "root";
			String dbPw="root";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			String sql ="SELECT * FROM member WHERE id=? AND pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				check= true;
				session.setAttribute("log", id);
				response.sendRedirect("01_01_main.jsp");
			}else{
				response.sendRedirect("01_04_login.jsp");
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
	
	<%if(check){%> 
		<script>
		alert("로그인 성공.")
		</script>
	<%}else{ %>
		<script>
		alert("로그인 실패")
		</script> 
	<%} %>
	
	
	
</body>
</html>