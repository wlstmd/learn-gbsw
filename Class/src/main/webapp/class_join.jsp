<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Class Join</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div align="leftr">
		<h3 align="left">학과 등록</h3>
		<form name="frm1" action="class_join_ok.jsp" method="POST">
			<table witdh="600" border="1">
				<tr>
					<td width="10%" align="left">학과코드</td>
					<td width="100%" align="left">
						<input type="text" name="jinseungclasscode">
					</td>
				</tr>
				<tr>
					<td width="10%" align="left">학과이름</td>
					<td width="100%" align="left">
						<input type="text" name="jinseungclassname">
					</td>
				</tr>
				<tr>
					<td width="10%" align="left">학과연락처</td>
					<td width="100%" align="left">
						<input type="text" name="classphone1"> - <input type="text" name="classphone2"> - <input type="text" name="classphone3">
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<input type="button" value="등록" onclick="valid_check()">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript">
	function valid_check() {
		if(document.frm1.jinseungclasscode.value == "") {
			alert("학과코드를 입력하세요.");
			document.frm1.jinseungclasscode.focus();
			return false;
		} else if(document.frm1.jinseungclassname.value == "") {
			alert("학과이름을 입력하세요.");
			document.frm1.jinseungclassname.focus();
			return false;
		} else if(document.frm1.classphone1.value == "") {
			alert("학과연락처를 입력하세요.");
			document.frm1.classphone1.focus();
			return false;
		} else if(document.frm1.classphone2.value == "") {
			alert("학과연락처를 입력하세요.");
			document.frm1.classphone2.focus();
			return false;
		} else if(document.frm1.classphone3.value == "") {
			alert("학과연락처를 입력하세요.");
			document.frm1.classphone3.focus();
			return false;
		} else {
			document.frm1.submit();
		}
	}
</script>
</html>