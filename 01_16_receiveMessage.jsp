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
	
			String id= (String)session.getAttribute("log");
	
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			int messagecount = 0;
			
			try{
			   String jdbcUrl = "jdbc:mysql://localhost:3306/PROJECT01?serverTimezone=UTC&useSSL=false";
			   String dbId= "root";
			   String dbPw= "root";
			   Class.forName("com.mysql.cj.jdbc.Driver");
			   conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			   String sql = "SELECT count(*) FROM message";
			   pstmt = conn.prepareStatement(sql);
			   rs = pstmt.executeQuery();
			   
			   if(rs.next() ){
				  messagecount = rs.getInt(1);
				   
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
			
			
			
			String messageList [][] = new String [messagecount][6]; 
			
			try{
			   String jdbcUrl = "jdbc:mysql://localhost:3306/PROJECT01?serverTimezone=UTC&useSSL=false";
			   String dbId= "root";
			   String dbPw= "root";
			   Class.forName("com.mysql.cj.jdbc.Driver");
			   conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			   String checkmembersql = "SELECT sender, subject, content, send_date FROM message WHERE receiver = ?";
			   pstmt = conn.prepareStatement(checkmembersql);
			   pstmt.setString(1, id);
			   rs = pstmt.executeQuery();
			   
			   int i =0;
			   while(rs.next() ){
				   messageList[i][0] = rs.getString(1);
				   messageList[i][1] = rs.getString(2);
				   messageList[i][2] = rs.getString(3);
				   messageList[i][3] = rs.getString(4);
					i++;
				   
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
			 <h2>받은 쪽지함</h2>
			 	<table border="1">
			 		<tr>
			 			<td>보낸사람</td>
			 			<td>제목</td>
			 			<td>내용</td>
			 			<td>보낸날짜</td>
			 		</tr>
			 		<%for(int i =0; i < messagecount; i++){
			 			if(messageList[i][0] != null){	
			 		%>
			 			
			 		<tr>
			 			<td><%=messageList[i][0] %></td>
			 			<td><%=messageList[i][1] %></td>
			 			<td><%=messageList[i][2] %></td>
			 			<td><%=messageList[i][3] %></td>
			 		</tr>
			 			<%} %>
			 		<%} %>
			 	</table>

</body>
</html>