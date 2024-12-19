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
	String pw = request.getParameter("pw");
	String id = (String)session.getAttribute("log");
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
		String sql ="SELECT pw FROM member WHERE id=? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()){
			String dbpw= rs.getString(1);
			
			if(pw.equals(dbpw)){
				String deletesql = "DELETE FROM member WHERE id=?";
				pstmt = conn.prepareStatement(deletesql);
				pstmt.setString(1, id);
				int result = pstmt.executeUpdate();
				if(result == 1){
					check = true;
					response.sendRedirect("01_01_main.jsp");
				}
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
</body>
</html>