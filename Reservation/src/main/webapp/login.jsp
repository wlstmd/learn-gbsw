<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>
	<h2 style="text-align: center">회원 로그인</h2>
	<%
		String LoginErr = request.getParameter("LoginErr");
		if(LoginErr != null) {
			%>
			<script type="text/javascript">
				alert("로그인에 실패하였습니다. 다시 시도해주세요.")
			</script>
			<%
		}
	%>
	<form action="login_ok.jsp" method="post" style="text-align: center">
		아이디 : <input type="text" name="userid"><br>
		비밀번호 : <input type="password" name="userpw"><br>
		<input type="submit" value="로그인">
	</form>
</body>
</html>