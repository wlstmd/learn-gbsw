<%@ page language="java" import="java.sql.*" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표 결과</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="section" style="min-height: 400px;">
		<h2 align="left">투표결과</h2>
		<table border="1" width="800">
			<tr>
				<td>이름</td>
				<td>생년월일</td>
				<td>성별</td>
				<td>투표번호</td>
				<td>투표시간</td>
				<td>개인정보이용동의</td>
			</tr>
			<%
				Class.forName("oracle.jdbc.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
				ResultSet rs = null;
				Statement stmt = con.createStatement();
				String sql = "select * from TBL_VOTE";
				
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					String jinseungname = rs.getString(2);
					String jinseungbirth = rs.getString(1);
					String jinseunggender = "";
					String jinseungyear = jinseungbirth.substring(6, 7);
					
					switch(jinseungyear) {
						case "1": jinseunggender = "남"; jinseungyear = "19" + jinseungbirth.substring(0, 2); break;
						case "2": jinseunggender = "여"; jinseungyear = "19" + jinseungbirth.substring(0, 2); break;
						case "3": jinseunggender = "남"; jinseungyear = "20" + jinseungbirth.substring(0, 2); break;
						case "4": jinseunggender = "여"; jinseungyear = "20" + jinseungbirth.substring(0, 2); break;
					}
					jinseungbirth = jinseungyear + "년" + jinseungbirth.substring(2, 4) + "월" + jinseungbirth.substring(4, 6) + "일";
					
					String jinseungchoice_no =  rs.getString(3);
					String jinseungtime = rs.getString(4);
					String jinseungconfirm = rs.getString(6);
					if(jinseungconfirm.equals("Y")) jinseungconfirm = "동의";
					else jinseungconfirm = "미동의";
					%>
					<tr>
						<td><%=jinseungname %></td>
						<td><%=jinseungbirth %></td>
						<td><%=jinseunggender %></td>
						<td><%=jinseungchoice_no %></td>
						<td><%=jinseungtime %></td>
						<td><%=jinseungconfirm %></td>
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