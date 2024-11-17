<%@ page language="java" import="java.sql.*" import="java.util.*" import="jdbcCon.Connect" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>roomlist</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="section" style="text-align: center; min-height: 250px">
		<h2>객실 리스트</h2>
		<p>저희 호텔이 보유하고 있는 객실 정보 입니다.</p>
		<% 
			try {
				Connection con = Connect.getConnection();
				Statement stmt = con.createStatement();
				ResultSet rs = null;
				String sql = "select * from Rroom";
				rs = stmt.executeQuery(sql);
				%>
				<form name="frm" method="post" action="reserv.jsp">
					<table style="margin: auto; border-collapse: collapse; border-top: 2px solid black; border-bottom: 2px solid black;">
						<tr style="background-color: #ccc"; font-weight:bold;>
							<td>순번</td>
							<td>객실번호</td>
							<td>객실등급</td>
							<td>조식여부</td>
						</tr>
						<% 
							int cnt = 1;
							while(rs.next()) {
								String rnum = rs.getString(1);
								String grade = rs.getString(2);
								String breakfast = rs.getString(3);
								
								if(grade.equals("1")) {
									grade = "패밀리룸";
								} else if(grade.equals("2")) {
									grade = "스위트룸";
								} else if(grade.equals("3")) {
									grade = "트윈룸";
								}
								
								if(breakfast.equals("1")) {
									breakfast = "조식 제공";
								} else if(breakfast.equals("2")) {
									breakfast = "조식 미포함";
								}
								%>
								
								<tr style="background-color: #f0f7ff;">
									<td><%= cnt++%></td>
									<td><%= rnum %></td>
									<td><%= grade %></td>
									<td><%= breakfast %></td>
								</tr>
								<%
							}
						%>
						<tr>
							<td colspan="4"><input type="submit" value="예약하기"></td>
						</tr>
					</table>
				</form>
				<%
				rs.close();
				stmt.close();
				con.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		%>
	</div>
</body>
</html>