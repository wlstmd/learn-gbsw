<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Subject Join</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<h3>과목 등록</h3>
	<form name="frm" method="post" action="subject_join_ok.jsp">
		<table border="1">
			<tr>
				<td>과목코드</td>
				<td>
					<input type="text" name="jinseungsubcode">
				</td>
			</tr>
			<tr>
				<td>과목명</td>
				<td>
					<input type="text" name="jinseungsubname">
				</td>
			</tr>
			<tr>
				<td>과목소개</td>
				<td>
					<input type="text" name="jinseungsubtext">
				</td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<input type="button" onclick="valid()" value="등록">
				</td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript">
	function valid() {
		if(document.frm.jinseungsubcode.value == "") {
			alert("과목코드를 입력하세요.");
			document.frm.jinseungsubcode.focus();
			return false;
		} else if(document.frm.jinseungsubname.value == "") {
			alert("과목명을 입력하세요.");
			document.frm.jinseungsubname.focus();
			return false;
		} else if(document.frm.jinseungsubtext.value == "") {
			alert("과목소개를 입력하세요.");
			document.frm.jinseungsubtext.focus();
			return false;
		} else {
			document.frm.submit();
		}
	}
</script>
</html>