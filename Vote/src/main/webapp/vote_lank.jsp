<%@ page language="java" import="java.sql.*" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후보자 순위</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="section" style="min-height: 400px;">
		<h2 align="left">후보자 순위</h2>
		<table border="1" width="600">
			<tr>
				<td>후보순위</td>
				<td>후보번호</td>
				<td>성명</td>
				<td>총득표수</td>
			</tr>
			<%
				Class.forName("oracle.jdbc.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
				Statement stmt = con.createStatement();
				ResultSet rs = null;
				String sql = "select tr.no, tr.name, COUNT(tv.choice_no) as count" +
								" from TBL_REGISTER tr join TBL_VOTE tv" +
								" on tr.no = tv.choice_no" +
								" group by tr.no, tr.name" +
								" order by COUNT(tv.choice_no) desc, tr.no asc";
				
				rs = stmt.executeQuery(sql);
				int lank = 1;
				while(rs.next()) {
					String no = rs.getString(1);
					String name = rs.getString(2);
					String total = rs.getString(3);
					%>
					<tr>
						<td><%= lank %>위</td>
						<td><%= no %></td>
						<td><%= name %></td>
						<td><%= total %></td>
					</tr>
					<%
				}
				stmt.close();
				con.close();
			%>
		</table>
		<a href="main.jsp">홈으로</a>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>