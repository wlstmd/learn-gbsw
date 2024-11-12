<%@ page language="java" import="java.sql.*" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Request List</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<h3>수강목록</h3>
	<table border="1">
		<tr>
			<td>수강신청코드</td>
			<td>학생코드</td>
			<td>과목코드</td>
			<td>신청일</td>
		</tr>
		<%
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
			Statement stmt = con.createStatement();
			String sql = "select * from request order by add_code asc";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				String jinseungaddcode = rs.getString(1);
				String jinseungstucode = rs.getString(2);
				String jinseungsubcode = rs.getString(3);
				String jinseungadddate = rs.getString(4);
				
				%>
				<tr>
					<td><%= jinseungaddcode %></td>
					<td><%= jinseungstucode %></td>
					<td><%= jinseungsubcode %></td>
					<td><%= jinseungadddate %></td>
				</tr>
			<%
			}
			rs.close();
			stmt.close();
			con.close();
		%>
	</table>
</body>
</html>