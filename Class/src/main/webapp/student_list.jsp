<%@ page language="java" import="java.sql.*" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student List</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<h3>학생목록</h3>
	<table border="1">
		<tr>
			<td>학생코드</td>
			<td>이름</td>
			<td>주소</td>
			<td>생년월일</td>
			<td>학과명</td>
		</tr>
		<%
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
			Statement stmt = con.createStatement();
			String sql = "select * from student order by stu_code asc";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				String jinseungstucode = rs.getString(1);
				String jinseungstuname = rs.getString(2);
				String jinseungstuaddress = rs.getString(3);
				String jinseungstubir = rs.getString(4);
				String jinseungclasscode = rs.getString(5);
				
				if(jinseungclasscode.contains("A001")) {
					jinseungclasscode = "소프트웨어개발과";
				} else if(jinseungclasscode.contains("A002")) {
					jinseungclasscode = "사물인터넷과";
				} else {
					jinseungclasscode = "게임개발과";
				}
				%>
				<tr>
					<td><%=jinseungstucode %></td>
					<td><%=jinseungstuname %></td>
					<td><%=jinseungstuaddress %></td>
					<td><%=jinseungstubir %></td>
					<td><%=jinseungclasscode %></td>
				</tr>
			<%
			}
			rs.close();
			con.close();
			stmt.close();
		%>
	</table>
</body>
</html>