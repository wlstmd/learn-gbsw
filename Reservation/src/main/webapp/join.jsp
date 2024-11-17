<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<script type="text/javascript">
	function check() {
		let userid = document.frm.userid.value
		let userpw = document.frm.userpw.value
		let usernm = document.frm.usernm.value
		let age = document.frm.age.value
		let phone = document.frm.phone.value

		if (userid == "") {
			alert("아이디를 입력하세요.");
			frm.userid.focus();
			return null;
		} else if (userpw == "비밀번호를 입력하세요.") {
			alert("");
			return null;
		} else if (usernm == "이름을 입력하세요.") {
			alert("");
			frm.usernm.focus();
			return null;
		} else if (age == "나이를 입력하세요.") {
			alert("");
			frm.age.focus();
			return null;
		} else if (phone == "연락처를 입력하세요.") {
			alert("");
			frm.phone.focus();
			return null;
		} else {
			document.frm.submit();
		}
	}
</script>
</head>
<jsp:include page="header.jsp" />
<body>
	<h2 style="text-align: center;">회원가입</h2>
	<form name="frm" action="join_ok.jsp" method="post">
		<table style="width: 500px; margin: auto;">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="userid"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="userpw"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="usernm"></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="number" name="age"></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;"><input
					type="button" onclick="check()" value="가입">
			</tr>
		</table>
	</form>
</body>

</html>