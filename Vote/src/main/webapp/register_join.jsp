<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후보 등록</title>
</head>
<body>
	<%
		if(request.getAttribute("messsage") != null) {
			out.print(request.getAttribute("message") + "<br>");
			out.print("NO 컬럼값이 " + request.getAttribute("sendvalue") + "가 아닙니다. 올바르게 입력해주세요.");
		}
	%>
	<%@ include file="header.jsp" %>
	<div class="section" style="min-height: 400px">
		<h2 align="left">후보 등록</h2>
		<form name="frm1" action="register_join_ok.jsp" method="POST">
			<table border="1" width="600">
				<tr>
					<td align="left" width="40%">후보번호</td>
					<td align="left" width="60%">
						<input type="text" name="NO" size="10" maxlength="2">
					</td>
				</tr>
				<tr>
					<td align="left" width="40%">이름</td>
					<td align="left" width="60%">
						<input type="text" name="Name" size="10" maxlength="20">
					</td>
				</tr>
				<tr>
					<td align="left">반</td>
					<td align="left">
						<select name="Code">
							<option value="P1">1반</option>
							<option value="P4">4반</option>
							<option value="P6">6반</option>
							<option value="P7">7반</option>
							<option value="P9">9반</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="left">학력</td>
					<td align="left">
						<select name="School">
							<option value="1">중졸</option>
							<option value="2">고졸</option>
							<option value="3">전문대졸</option>
							<option value="4">대졸</option>
							<option value="5">석사수료</option>
							<option value="6">석사취득</option>
							<option value="7">박사수료</option>
							<option value="8">박사취득</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="left">주민번호</td>
					<td align="left">
						<input type="text" name="jumin" size="6" maxlength="6">-<input type="text" name="jumin2" size="7" maxlength="7">
					</td>
				</tr>
				<tr>
					<td align="left">전공학년반</td>
					<td align="left">
						<input type="text" name="Major" size="20" maxlength="20">
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<input type="button" value="등록" onclick="valid()">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<%@ include file="footer.jsp" %>
</body>
<script type="text/javascript">
	function valid() {
		if(document.frm1.NO.value == "") {
			alert("후보번호를 입력하세요.");
			document.frm1.NO.focus();
			return false;
		} else if(document.frm1.Name.value == "") {
			alert("이름을 입력하세요.");
			document.frm1.Name.focus();
			return false;
		} else if(document.frm1.Code.value == "") {
			alert("선거 그룹번호를 선택하세요.");
			document.frm1.Code.focus();
			return false;
		} else if(document.frm1.School.value == "") {
			alert("학력을 선택하세요.");
			document.frm1.School.focus();
			return false;
		} else if(document.frm1.jumin.value == "") {
			alert("주민번호를 입력하세요.");
			document.frm1.jumin.focus();
			return false;
		} else if(document.frm1.jumin2.value == "") {
			alert("주민번호를 입력하세요.");
			document.frm1.jumin2.focus();
			return false;
		} else if(document.frm1.Major.value == "") {
			alert("전공학년반을 입력하세요.");
			document.frm1.Major.focus();
			return false;
		} else {
			document.frm1.submit();
		}
	}
</script>
</html>