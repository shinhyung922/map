<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<link rel="stylesheet" href="01_02_join.css">
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function checkPost() {
            new daum.Postcode({
                oncomplete: function(data) {
                  
                    document.getElementById('postcode').value = data.zonecode; 
                    document.getElementById('address').value = data.roadAddress;
                    document.getElementById('address2').focus(); 
                }
            }).open();
        }
    </script>
</head>
<body>

	<div class="join-container">
		<h4>회원가입</h4>
		   <hr class="title-line">
			<form method="post" action="01_02_joincheckid.jsp">
				<div class="form-group">
					<label>아이디</label>
					<input type="text" name="id" placeholder="아이디를 입력해주세요">
					<% if (request.getParameter("error") != null && request.getParameter("error").equals("check2")) { %>
					<small style="color: red; font-size: 0.8rem;">중복된 아이디입니다. 
					</small>
					<%} %>
				</div>
				<div class="form-group">
                	<label>비밀번호</label>
					<input type="password" name="pw" placeholder="비밀번호를 입력해주세요">
				</div>
				<div class="form-group">
              	 	<label>이름</label>
					<input type="text" name="name" placeholder="이름을 입력해주세요">
				</div>
				
				<div class="form-group">
              		<label>성별</label>
              		<div class="radio-group">
						<input type="radio" name="gender" value="남자">남자
						<input type="radio" name="gender" value="여자">여자
					</div>  
				</div>
				<div class="form-group">
              		<label>생년월일</label>
					<input type="date" name="date" id="date" onchange="calculateAge()">
				</div>
				<div class="form-group">
              		<label>나이</label>
					<input type="text" id="age"name="age">
				</div>
				<div class="form-group">
               		<label>주소</label>
               		<div class="address-group">
               		   <div class="input-group">
							<input type="text" id="postcode" name="zipcode" readonly>
							<input type="button" value="우편번호검색" onclick="checkPost()">
					   </div>
							<input type="text" id="address" name="add1" size="50" placeholder="주소" readonly>
							<input type="text" id="address2" name="add2" size="50" placeholder="상세주소">		
					</div>
				</div>			
					  
				<div class="form-group">
              	    <label>전화번호</label>
              	    <div class="input-group">
						<select name="phone1">
							<option>010</option>
							<option>011</option>
							<option>070</option>
							<option>02</option>
						</select>
						<input type="text" name="phone2" size="3">
						<input type="text" name="phone3" size="3">
					</div>
				</div>
				<div class="form-group">
              	    <label>이메일</label>
             		<div class="input-group">
						<input type="text" id="email1" >@
						<input type="text" id="email2">
							<select name="email">
								<option>선택</option>
								<option>naver.com</option>
								<option>nate.com</option>
								<option>gamil.com</option>
								<option>hanmail.net</option>
							</select>
					</div>
				</div>
				<div class="form-group" style="justify-content: center;">
					<button type="submit" class="submit-btn">가입하기</button>
				</div>
			
		</form>
	
	</div>
<script>

	function calculateAge() {
 	   let birth = document.getElementById("date").value;
  		  if (birth) {
		        let Year = new Date(birth).getFullYear();
		        let today = new Date().getFullYear();
		        let age = today - Year;
		        document.getElementById("age").value = age;
		   }
}
	
	


</script>



</body>
</html>