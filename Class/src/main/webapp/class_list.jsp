<%@ page language="java" import="java.util.*" import='java.sql.*' contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Class List</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<h3 align="left">회원목록</h3>
	<table width="600" border="1">
		<tr>
			<td>학과코드</td>
			<td>학과명</td>
			<td>학과연락처</td>
		</tr>
		<tr>
		<%
				Class.forName("oracle.jdbc.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
				Statement stmt = con.createStatement();
				ResultSet rs = null;
				String sql = "select * from class order by class_code";
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					String jinseungclasscode = rs.getString(1);
					String jinseungclassname = rs.getString(2);
					String classphone = rs.getString(3);
				
		%>
			<td><%= jinseungclasscode %></td>
			<td><%= jinseungclassname %></td>
			<td><%= classphone %></td>
		</tr>
		<%
		}

			stmt.close();
			con.close();
		%>
	</table>
</body>
</html>