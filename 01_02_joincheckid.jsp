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

	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name= request.getParameter("name");
	String gender = request.getParameter("gender");
	String date = request.getParameter("date");
	String str = request.getParameter("age");
	int age = Integer.parseInt(str);
	String address = request.getParameter("address");
	String phonenumber = request.getParameter("phonenumber");
	String mail = request.getParameter("mail");
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	boolean check = false;
	boolean check2 =false;
	
	try{
			String jdbcUrl ="jdbc:mysql://localhost:3306/PROJECT01?serverTimezone=UTC&useSSL=false";
			String dbId= "root";
			String dbPw="root";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			String sql ="SELECT id FROM member WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				check= true;	
			}else{
				String insertsql = "INSERT member VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?) ";
				pstmt= conn.prepareStatement(insertsql);
				pstmt.setString(1, id);
				pstmt.setString(2, pw);
				pstmt.setString(3, name);
				pstmt.setString(4, gender);
				pstmt.setString(5, date);
				pstmt.setInt(6, age);
				pstmt.setString(7, address);
				pstmt.setString(8, phonenumber);
				pstmt.setString(9, mail);
				int result = pstmt.executeUpdate();
				
				if(result == 1){
					response.sendRedirect("01_03_loginfrom.jsp");
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
	
		if(check){
			response.sendRedirect("01_02_joinform.jsp?error=check2");
		}
		


%>
</body>
</html>