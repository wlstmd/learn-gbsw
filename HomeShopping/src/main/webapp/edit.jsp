<%@ page language="java" import="java.sql.*" import="DBPKG.Connect"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<h2 align="center">회원 정보 수정</h2>
	<%
	String custno = request.getParameter("custno");
	Connection con = Connect.getConnection();
	Statement stmt = con.createStatement();
	String sql = "SELECT * FROM member_tbl_02 WHERE custno = '" + custno + "'";
	ResultSet rs = stmt.executeQuery(sql);

	String custname = "", phone = "", address = "", joindate = "", grade = "", city = "";

	if (rs.next()) {
		custname = rs.getString(2);
		phone = rs.getString(3);
		address = rs.getString(4);
		joindate = rs.getString(5);
		grade = rs.getString(6);
		city = rs.getString(7);
	}

	rs.close();
	stmt.close();
	con.close();
	%>
	<form action="edit_ok.jsp" method="post">
		<table style="width: 600px; margin: auto;" border="1">
			<tr>
				<td>회원번호</td>
				<td><input type="text" name="custno" size="10"
					value="<%=custno%>" readonly></td>
			</tr>
			<tr>
				<td>회원성명</td>
				<td><input type="text" name="custname" size="10"
					value="<%=custname%>"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone" size="13"
					value="<%=phone%>"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address" size="20"
					value="<%=address%>"></td>
			</tr>
			<tr>
				<td>가입일자</td>
				<td><input type="text" name="joindate" size="10"
					value="<%=joindate%>"></td>
			</tr>
			<tr>
				<td>고객등급</td>
				<td><input type="text" name="grade" size="10"
					value="<%=grade%>"></td>
			</tr>
			<tr>
				<td>거주지역</td>
				<td><input type="number" name="city" size="10"
					value="<%=city%>"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input style="width: 60px;"
					type="submit" value="수정"> <input style="width: 60px;"
					type="button" value="조회" onclick="get()"></td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript">

	function get() {
		window.location.href="list_edit.jsp"
	}
</script>
</html>