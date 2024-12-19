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
		String currentid = (String)session.getAttribute("log"); 

		String newid = request.getParameter("id"); 
		String pw = request.getParameter("password");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String address = request.getParameter("address");
		String phonenumber = request.getParameter("phonenumber");
		String email = request.getParameter("email");
		
		  Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      
	      boolean check =false;

	      try{
	         String jdbcUrl = "jdbc:mysql://localhost:3306/PROJECT01?serverTimezone=UTC&useSSL=false";
	         String dbId= "root";
	         String dbPw= "root";
	         Class.forName("com.mysql.cj.jdbc.Driver");
	         conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
	         
	         if(!newid.equals(currentid)){
	         String checksql = "SELECT * FROM member WHERE id=?";
	         pstmt = conn.prepareStatement(checksql);
	         pstmt.setString(1, newid);
	         rs = pstmt.executeQuery();
	         if(rs.next()){
	        	 out.println("중복아이디 입니다.");
	        	 return;
	         	}
	         }
	         
	         String sql = "UPDATE member SET id=?, pw=?, name=?, birth=?,address=?, phone=?,email=? WHERE id=?";
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, newid);
	         pstmt.setString(2, pw);
	         pstmt.setString(3, name);
	         pstmt.setString(4, birth);
	         pstmt.setString(5, address);
	         pstmt.setString(6, phonenumber);
	         pstmt.setString(7, email);
	         pstmt.setString(8, currentid);
	         
	         int result = pstmt.executeUpdate();
	         if(result == 1){
	        	 session.setAttribute("log", newid);
	            check = true;
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
	   
	   <% if(check){ %>
	      <script>
			alert("수정 완료!");
			location.href="01_09_mypagemain.jsp";
			</script>
	   <%}else{ %>
	      수정실패 ㅠㅠ 
	   <%} %>
	   




</body>
</html>