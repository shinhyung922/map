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
<style>

    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        color: #333;
    }

    h3 {
        margin: 20px;
        color: #444;
    }

    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    table th, table td {
        padding: 10px;
        text-align: center;
        border: 1px solid #ddd;
    }

    table th {
        background-color: #6c7ae0;
        color: #fff;
        font-weight: bold;
    }

    table tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    table tr:hover {
        background-color: #f1f1f1;
    }

    .button {
        display: inline-block;
        padding: 8px 16px;
        margin-top: 10px;
        background-color: #6c7ae0;
        color: white;
        text-decoration: none;
        border-radius: 4px;
    }

    .button:hover {
        background-color: #5a65d4;
    }

    .center {
        text-align: center;
    }
</style>
</head>
<body>
<%
			String id = (String)session.getAttribute("log");
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int boardsize =0;
			
			
			try{
			   String jdbcUrl = "jdbc:mysql://localhost:3306/PROJECT01?serverTimezone=UTC&useSSL=false";
			   String dbId= "root";
			   String dbPw= "root";
			   Class.forName("com.mysql.cj.jdbc.Driver");
			   conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			   String sql = "SELECT COUNT(*) FROM board";
			   pstmt = conn.prepareStatement(sql);
			   rs = pstmt.executeQuery();
			   if(rs.next()){
			      boardsize = rs.getInt(1);
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


			
			String boardlist [][] = new String [boardsize][10];
			
			try{
				String jdbcUrl = "jdbc:mysql://localhost:3306/PROJECT01?serverTimezone=UTC&useSSL=false";
				String dbId= "root";
				String dbPw= "root";
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
				String sql= " SELECT BOARD_ID, TITLE, mem_id, CONTENT, VIEW, LIKES, COMMENT, WRITE_DAY, img, CATEGORY_ID FROM board WHERE mem_id=? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				int i =0;
				while(rs.next()){
					boardlist[i][0] = rs.getInt(1) +"";
					boardlist[i][1] = rs.getString(2);
					boardlist[i][2] = rs.getString(3);
					boardlist[i][3] = rs.getString(4);
					boardlist[i][4] = rs.getInt(5) +"";
					boardlist[i][5] = rs.getInt(6) +"";
					boardlist[i][6] = rs.getInt(7) +"";
					boardlist[i][7] = rs.getString(8);
					boardlist[i][8] = rs.getString(9);
					boardlist[i][9] = rs.getInt(10) +"";
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
			<div align="center">
				<h3>내 글 보기</h3>
					<table border="1">
						<tr>
							<td>번호</td>
							<td>제목</td>
							<td>작성자</td>
							<td>내용</td>
							<td>조회수</td>
							<td>좋아요수</td>
							<td>댓글</td>
							<td>작성일</td>
							<td>이미지</td>
							<td>카테고리</td>
						</tr>
					<% for(int i =0; i < boardsize; i++){ 
						if(boardlist[i][0] != null){
					
					%>
					
					<tr>
						<td><%=boardlist[i][0] %></td>
						<td><%=boardlist[i][1] %></td>
						<td><%=boardlist[i][2] %></td>
						<td><a href= "_03_boardview.jsp?board_no=<%=boardlist[i][0]%>"><%=boardlist[i][3] %></a></td>	
						<td><%=boardlist[i][4] %></td>
						<td><%=boardlist[i][5] %></td>
						<td><%=boardlist[i][6] %></td>
						<td><%=boardlist[i][7] %></td>
						<td><%=boardlist[i][8] %></td>
						<td><%=boardlist[i][9] %></td>	
					</tr>
						<%} %>
					<%} %>
					</table>
			
			</div>

	



</body>
</html>