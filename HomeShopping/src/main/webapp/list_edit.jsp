<%@ page language="java" import="java.sql.*" import="java.util.*"
	import="DBPKG.Connect" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list edit</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<h2 align="center">회원목록조회/수정</h2>
	<table style="width: 1200px; margin: auto;" border="1">
		<tr>
			<th align="center">회원번호</th>
			<th align="center">회원성명</th>
			<th align="center">전화번호</th>
			<th align="center">주소</th>
			<th align="center">가입일자</th>
			<th align="center">고객등급</th>
			<th align="center">거주지역</th>
		</tr>
		<%
		Connection con = Connect.getConnection();
		Statement stmt = con.createStatement();
		String sql = "select * from member_tbl_02";
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			String custno = rs.getString(1);
			String custname = rs.getString(2);
			String phone = rs.getString(3);
			String address = rs.getString(4);
			String joindate = rs.getString(5);
			String grade = rs.getString(6);
			String city = rs.getString(7);
			
	        String gradeDisplay = "";
	        if ("A".equals(grade)) {
	          gradeDisplay = "VIP";
	        } else if ("B".equals(grade)) {
	          gradeDisplay = "일반";
	        } else if ("C".equals(grade)) {
	          gradeDisplay = "직원";
	        }
			
			%>
		<tr>
			<td align="center"><a style="color: black"
				href="edit.jsp?custno=<%= custno %>"><%= custno %></a></td>
			<td align="center"><%= custname %></td>
			<td align="center"><%= phone %></td>
			<td align="center"><%= address %></td>
			<td align="center"><%= joindate %></td>
			<td align="center"><%= gradeDisplay %></td>
			<td align="center"><%= city %></td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>
