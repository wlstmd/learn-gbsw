<%@ page language="java" import="java.sql.*" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Join</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<%
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
		Statement stmt = con.createStatement();
		String sql = "select class_code from class";
		ResultSet rs = stmt.executeQuery(sql);
	%>
		<h3>학생등록</h3>
		<form name="frm" action="student_join_ok.jsp" method="POST">
			<table border="1">
				<tr>
					<td width="40%" align="left">학생코드</td>
					<td width="100%" align="left">
						<input type="text" name="jinseungstucode">
					</td>
				</tr>
				<tr>
					<td width="40%" align="left">학생 이름</td>
					<td width="100%" align="left">
						<input type="text" name="jinseungstuname">
					</td>
				</tr>
				<tr>
					<td width="40%" align="left">학생 주소</td>
					<td width="100%" align="left">
						<input type="text" name="jinseungstuaddress">
					</td>
				</tr>
				<tr>
					<td width="40%" align="left">학생 생년월일</td>
					<td width="100%" align="left">
						<input type="text" name="jinseungstubir" maxlength="6">
					</td>
				</tr>
				<tr>
					<td>학과코드</td>
					<td>
						<select name="jinseungclasscode">
							<%
								while(rs.next()) {
									String jinseungclasscode = rs.getString(1);
									String classname = "";
									if(jinseungclasscode.contains("A001")) {
										classname = "소프트웨어개발과";
									} else if(classname.contains("A002")) {
										classname = "사물인터넷과";
									} else {
										classname = "게임개발과";
									}
									%>
									<option value="<%=jinseungclasscode %>"><%=classname %></option>
									<%
								}
							rs.close();
							stmt.close();
							con.close();
							%>
						</select>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<input type="button" value="등록" onclick="valid()">
					</td>
				</tr>
			</table>
		</form>
</body>
<script type="text/javascript">
	function valid() {
		let jinseungstucode = document.frm.jinseungstucode.value;
		let jinseungstuname = document.frm.jinseungstuname.value;
		let jinseungstuaddress = document.frm.jinseungstuaddress.value;
		let jinseungstubir = document.frm.jinseungstubir.value;
		let jinseungclasscode = document.frm.jinseungclasscode.value;
		
		if(jinseungstucode == "") {
			alert("학생코드를 입력해주세요.");
			document.frm.jinseungstucode.focus();
			return false;
		} else if(jinseungstuname == "") {
			alert("학생이름을 입력해주세요.");
			document.frm.jinseungstuname.focus();
			return false;
		} else if(jinseungstuaddress == "") {
			alert("학생이름을 입력해주세요.");
			document.frm.jinseungstuaddress.focus();
			return false;
		} else if(jinseungstubir == "") {
			alert("학생이름을 입력해주세요.");
			document.frm.jinseungstubir.focus();
			return false;
		} else {
			document.frm.submit();
		}
	}
</script>
</html>