<%@ page language="java" import="java.sql.*" import="java.util.*" import="jdbcCon.Connect" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/index.css?ver=2" />
<title>Reservation_Check</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<h2>예약 확인하기</h2>
	<%
	String jinseungid = (String) session.getAttribute("userid");
	%>
	<p><%=jinseungid%>회원님이 예약하신 현황입니다.
	</p>
	<br>
	<table>
		<tr>
			<th>순번</th>
			<th>예약시작일</th>
			<th>예약자명</th>
			<th>연락처</th>
			<th>객실번호</th>
			<th>객실등급</th>
			<th>조식여부</th>
		</tr>
		<%
		try {
			Connection con = Connect.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = null;
			String sql = "select date_s, date_e, a.rnum, usernm, phone, grade, breakfast from Rreserv a, Rroom b where a.rnum = b.rnum and a.userid='"
			+ jinseungid + "'";
			rs = stmt.executeQuery(sql);
			int cnt = 1;
			while (rs.next()) {
				String date_s = rs.getString(1);
				String date_e = rs.getString(2);
				String rnum = rs.getString(3);
				String usernm = rs.getString(4);
				String phone = rs.getString(5);
				String grade = rs.getString(6);
				String breakfast = rs.getString(7);
		%>
		<tr>
			<td><%=cnt++%></td>
			<td><%=date_s%></td>
			<td><%=date_e%></td>
			<td><%=usernm%></td>
			<td><%=phone%></td>
			<td><%=rnum%></td>
			<td><%=grade%></td>
			<td><%=breakfast%></td>
		</tr>
		<%
		}
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		%>
	</table>
</body>
</html>