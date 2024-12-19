<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.header {
        width: 100%;
        display: flex;
        justify-content: flex-end; /* 오른쪽 정렬 */
        padding: 10px 20px;
        box-sizing: border-box;
    }
    /* 기본 스타일 설정 */
    .dropdown {
        position: relative;
        display: inline-block;
        cursor: pointer;
    }
    
    .dropdown-content {
        display: none; /* 기본 상태에서는 숨김 */
        position: absolute;
        background-color: white;
        min-width: 120px;
        box-shadow: 0px 8px 16px rgba(0,0,0,0.2);
        z-index: 1;
    }
    
    /* 드롭다운 메뉴 스타일 */
    .dropdown-content a {
        color: black;
        padding: 8px 12px;
        text-decoration: none;
        display: block;
    }
    
    .dropdown-content a:hover {
        background-color: #f1f1f1;
    }
    
    /* 마우스를 올렸을 때 메뉴 보이기 */
    .dropdown:hover .dropdown-content {
        display: block;
    }
    .dropdown span {
        font-size: 14px;
        margin-left: 5px; /* 화살표와 이름 사이 간격 */
    }
</style>
</head>
<body>
<%
		String log = (String)session.getAttribute("log");

%>

	<div class="header">
		<% if( log == null){ %>
		
			<a href="01_04_login.jsp">로그인</a>
			<a href="01_02_joinform.jsp">회원가입</a>
						
		<% }else{%>
		<div class="dropdown">
			
			[ <%=log%> ] 님<span>▼</span> 		
			 <div class="dropdown-content">					
				<a href="01_06_logout.jsp">로그아웃</a>		
				<a href="01_09_mypagemain.jsp">마이페이지</a>
				<a href="01_12_sendmessageform.jsp">쪽지보내기</a>
				<a href="01_16_receiveMessage.jsp">받은쪽지함</a>
			</div>
		</div>
						
		<%}%>
	</div>

</body>
</html>