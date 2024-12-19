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
        width: 600px;
        margin: 50px auto;
        border: 1px solid #ddd;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        padding: 20px;
        box-sizing: border-box;
    }

    .header {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 20px;
        text-align: left;
        border-bottom: 1px solid #ddd;
        padding-bottom: 10px;
    }

    .info-row {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px 0;
        border-bottom: 1px solid #f0f0f0;
    }

    .info-row:last-child {
        border-bottom: none;
    }

    .info-row label {
        font-weight: bold;
        color: #333;
    }

    .info-row input {
        width: 300px;
        border: 1px solid #ddd;
        padding: 8px;
        border-radius: 5px;
        box-sizing: border-box;
    }

    .button-container {
        text-align: center;
        margin-top: 20px;
    }

    .submit-button {
        background-color: #333;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }

    .submit-button:hover {
        background-color: #555;
    }
</style>
</head>
<body>
<%

		String id = request.getParameter("id");
		String memberlist [] = new String[7];
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
			String sql ="SELECT id, pw, name, birth, address, phone, email  FROM member WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				memberlist[0] = rs.getString("id");
				memberlist[1] = rs.getString("pw");
				memberlist[2] = rs.getString("name");
				memberlist[3] = rs.getString("birth");
				memberlist[4] = rs.getString("address");
				memberlist[5] = rs.getString("phone");
				memberlist[6] = rs.getString("email");
	
				
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
		<div class="container">
			<div class="header">회원정보수정</div>
				<form action="01_11_updatememberpro.jsp">
					<div class="info-row">
						<label>아이디</label>
						<input type="text" name="id" value="<%=memberlist[0] %>">
					</div>
					<div class="info-row">
						<label>비밀번호</label>
						<input type="password" name="password" value="<%=memberlist[1] %>">
					</div>
					<div class="info-row">
						<label>이름</label>
						<input type="text" name="name" value="<%=memberlist[2] %>">
					</div>
					<div class="info-row">
						<label>생년월일</label>
						<input type="date" name="birth" value="<%=memberlist[3] %>">
					</div>
					<div class="info-row">
						<label>주소</label>
						<input type="text" name="address" value="<%=memberlist[4] %>">
					</div>
					<div class="info-row">
						<label>핸드폰번호</label>
						<input type="text" name="phonenumber" value="<%=memberlist[5] %>">
					</div>
					<div class="info-row">
						<label>이메일주소</label>
						<input type="text" name="email" value="<%=memberlist[6] %>">
					</div>
					<div class="button-container">
						<input type="submit" value="완료" class="submit-button">
					</div>
			</form>
		</div>
</body>
</html>