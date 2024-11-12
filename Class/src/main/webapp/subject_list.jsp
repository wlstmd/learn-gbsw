<%@ page language="java" import="java.sql.*" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Subject List</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<h3>과목 목록</h3>
	<table border="1">
		<tr>
			<td>과목코드</td>
			<td>과목명</td>
			<td>과목소개</td>
		</tr>
		<%
		 	Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
			Statement stmt = con.createStatement();
			String sql = "select * from subject order by sub_code asc";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				String jinseungsubcode = rs.getString(1);
				String jinseungsubname = rs.getString(2);
				String jinseungsubtext = rs.getString(3);
				%>
				<tr>
					<td><%=jinseungsubcode %></td>
					<td><%=jinseungsubname %></td>
					<td><%=jinseungsubtext %></td>
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