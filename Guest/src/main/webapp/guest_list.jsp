<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록 출력</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<h3 align="left">회원목록</h3>
	<table width="900" border="1">
		<tr style="background-color: silver">
			<td>회원ID</td>
			<td>회원명</td>
			<td>생년월일</td>
			<td>성별</td>
			<td>직업</td>
			<td>주소</td>
			<td width="400">자기소개</td>
		</tr>
		<tr>
			<%
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
			Statement stmt = conn.createStatement();
			ResultSet rs = null;
			String SQL = "select * from MEMBER order by userid ASC";
			rs = stmt.executeQuery(SQL);

			while (rs.next()) {
				String userid = rs.getString(1);
				String username = rs.getString(2);
				String jumin = rs.getString(4);
				jumin = jumin.substring(0, 6);
				String gender = rs.getString(5);

				if (gender.equals("1"))
					gender = "남";
				else
					gender = "여";

				String address = rs.getString(6);
				String job = rs.getString(7);

				switch (job) {
				case "1":
					job = "학생";
					break;
				case "2":
					job = "회사원";
					break;
				case "3":
					job = "공무원";
					break;
				case "4":
					job = "군인";
					break;
				default:
					job = "기타";
				}

				String intro = rs.getString(9);
				%>
		<tr>
			<td><%=userid%></td>
			<td><%=username%></td>
			<td><%=jumin%></td>
			<td><%=gender%></td>
			<td><%=job%></td>
			<td><%=address%></td>
			<td><%=intro%></td>
		</tr>
		<%
		}
		stmt.close();
		conn.close();
		%>
	</table>
	<a href="main.jsp">홈으로</a>
</body>
</html>