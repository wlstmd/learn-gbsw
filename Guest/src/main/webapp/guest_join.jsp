<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div align="center">
		<h3>회원가입</h3>
		<form name="frm1" action="guest_join_ok.jsp" method="POST">
			<table width="600" border="1">
				<tr>
					<td width="40%" align="left">아이디</td>
					<td width="60%" align="left">
						<input type="text" size="12" maxlength="12" name="userid">
					</td>
				</tr>
				<tr>
					<td width="40%" align="left">이름</td>
					<td width="60%" align="left">
						<input type="text" size="15" maxlength="12" name="username">
					</td>
				</tr>
				<tr>
					<td width="40%" align="left">비밀번호</td>
					<td width="60%" align="left">
						<input type="password" size="12" maxlength="12" name="passwd">
					</td>
				</tr>
				<tr>
					<td width="40%" align="left">비밀번호확인</td>
					<td width="60%" align="left">
						<input type="password" size="12" maxlength="12" name="passwd2">
					</td>
				</tr>
				<tr>
					<td width="40%" align="left">주민번호</td>
					<td width="60%" align="left">
						<input type="text" size="6" maxlength="6" name="jumin1"> - <input type="text" maxlength="7" name="jumin2">
					</td>
				</tr>
				<tr>
					<td width="40%" align="left">성별</td>
					<td width="60%" align="left">
						<input type="radio" name="gender" value="1">
						<input type="radio" name="gender" value="2">
					</td>
				</tr>
				<tr>
					<td width="40%" align="left">주소</td>
					<td width="60%" align="left">
						<input type="text" size="50" maxlength="50" name="address">
					</td>
				</tr>
				<tr>
					<td width="40%" align="left">직업</td>
					<td width="60%" align="left">
						<select name="job">
							<option value="" selected>직업을 선택하세요.</option>
							<option value="1">학생</option>
							<option value="2">회사원</option>
							<option value="3">공무원</option>
							<option value="4">군인</option>
							<option value="9">기타</option>
						</select>
					</td>
				</tr>
				<tr>
					<td width="40%" align="left">메일수신여부</td>
					<td width="60%" align="left">
						<input type="checkbox" name="mailreceive">
					</td>
				</tr>
				<tr>
					<td width="40%" align="left">자기소개</td>
					<td width="60%" align="left">
						<textarea name="intro" rows=5 cols=50></textarea>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<input type="button" value="가입" onclick="valid_check()">
					</td>
				</tr>
			</table>
		</form>
		<a href="main.jsp">홈으로</a>
	</div>
</body>
<script type="text/javascript">
	function valid_check() {
		if(document.frm1.userid.value == "") {
			alert("아이디를 입력하세요.");
			document.frm1.userid.focus();
			return false;
		} else if(document.frm1.username.value == "") {
			alert("이름을 입력하세요.");
			document.frm1.username.focus();
			return false;
		} else if(document.frm1.passwd.value == "") {
			alert("비밀번호를 입력하세요.")
			document.frm1.passwd.focus();
			return false;
		} else if(document.frm1.passwd2.value == "") {
			alert("비밀번호확인을 입력하세요.")
			document.frm1.passwd2.focus();
			return false;
		} else if(document.frm1.jumin1.value == "") {
			alert("주민번호를 입력하세요.")
			document.frm1.jumin1.focus();
			return false;
		} else if(document.frm1.jumin2.value == "") {
			alert("주민번호를 입력하세요.")
			document.frm1.jumin2.focus();
			return false;
		} else if(document.frm1.address.value == "") {
			alert("주소를 입력하세요.")
			document.frm1.address.focus();
			return false;
		} else if(document.frm1.passwd.value != document.frm1.passwd2.value) {
			alert("비밀번 한번 더 확인하세요.")
			document.frm1.passwd2.focus();
			return false;
		} else {
			document.frm1.submit();
		}
	}
</script>
</html>