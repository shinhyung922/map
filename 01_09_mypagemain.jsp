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

    }
    .container {
        width: 280px; /* 전체 너비 */
	    margin: 50px auto;
	    background-color: transparent; /* 배경색 제거 */
	    box-shadow: none; /* 박스 그림자 제거 */
	    border-radius: 0; /* 모서리 둥글기 제거 */
	    box-sizing: border-box;
	    padding: 15px;
    }
    .header {
         text-align: center;
		 font-size: 24px; /* 글씨 크기 */
		 font-weight: bold; /* 글씨 굵기 */
		 padding-bottom: 10px; /* 아래 여백 */
		 margin-bottom: 10px;
		 border-bottom: 1px solid #ddd; /* 구분선 유지 */
    }
    
    .header .id {
   		text-align: center;
        font-size: 14px;
  		color: black;
   		font-weight: bold;
   		
    }
    
    .section {
        padding: 10px 5px;
        border-bottom: 1px solid #ddd;
        display: flex;
        justify-content: space-between;
        align-items: center;
        cursor: pointer;
    }
    .section:last-child {
        border-bottom: none;
    }
    .section:hover {
        background-color: #f5f5f5;
    }
    .section div {
   		 flex-shrink: 0; /* 숫자 영역도 줄어들지 않도록 설정 */
   		 text-align: right; /* 오른쪽 정렬 */
   		 min-width: 50px; /* 숫자의 최소 너비 설정 */
	}
    .section span {
        font-weight: bold;
        margin-right: 5px; 
        flex-shrink: 0; /* 요소가 줄어들지 않도록 설정 */
      
    }
    .arrow {
        font-size: 16px;
        color: #999;
    }
    .section a {
        color: black;
        text-decoration: none;
        font-weight: bold;
    }
    .section a:hover {
        text-decoration: underline;
    }
    
    
</style>
</head>
<body>

	<jsp:include page="01_01_main.jsp"></jsp:include>

<%
    String id = (String)session.getAttribute("log");
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    int likecount = 0;
    int boardcount = 0;

    try {
        String jdbcUrl = "jdbc:mysql://localhost:3306/PROJECT01?serverTimezone=UTC&useSSL=false";
        String dbId = "root";
        String dbPw = "root";
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);

        
        String likeSql = "SELECT COUNT(*) FROM board WHERE mem_id=?";
        pstmt = conn.prepareStatement(likeSql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        if (rs.next()) {
        	likecount = rs.getInt(1);
        }
        

        String postSql = "SELECT COUNT(*) FROM board WHERE mem_id=?";
        pstmt = conn.prepareStatement(postSql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        if (rs.next()) {
        	boardcount = rs.getInt(1);
        }
        
    } catch (Exception e) {
        e.printStackTrace();
        
    } finally {
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

	<div class="container">
	    <div class="header">마이페이지</div>
	    <div class="id"><strong>아이디:</strong> <%= id %></div>
	    </div>
	
		<div class="section" onclick="location.href='01_10_updatemember.jsp?id=<%=id%>'">
			<span>회원정보수정</span>
			<div > > </div>
		</div>

	    <div class="section" onclick="location.href='01_15_likelist.jsp?id=<%=id %>'">
	        <span>좋아요</span>
	        <div><%= likecount %> 개</div>
	    </div>
	
	    <div class="section" onclick="location.href='01_14_myboardlist.jsp?id=<%=id %>'">
	         <span>내가 쓴 글</span>
	        <div><%= boardcount %> 개 </div>
	    </div>
	
	    
	    <div class="section" onclick="location.href='01_07_deletemember.jsp?id=<%=id %>'">
	    	<span>회원탈퇴</span>
	    </div>
	</div>

</body>
</html>