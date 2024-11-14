<%@ page language="java" import="java.sql.*" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후보 조회</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="section" style="min-height: 400px">
		<h2 align="left">후보조회</h2>
		<table border="1" width="800">
			<tr>
				<td>후보번호</td>
				<td>성명</td>
				<td>반</td>
				<td>파트너</td>
				<td>학력</td>
				<td>주민번호</td>
				<td>전공학년반</td>
				<td>전화번호</td>					
			</tr>
			<%
				Class.forName("oracle.jdbc.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
				Statement stmt = con.createStatement();
				ResultSet rs = null;
				String sql = "select no, name, p_class, p_partner, school, jumin, major, p_tel1, p_tel2, p_tel3" + " from TBL_REGISTER join TBL_PARTNER on TBL_REGISTER.code = TBL_PARTNER.p_code" + " order by no asc";
				rs = stmt.executeQuery(sql);
				
				
				while(rs.next()) {
					String jinseungno = rs.getString(1);
					String jinseungname = rs.getString(2);
					String jinseungp_class = rs.getString(3);
					String jinseungp_partner = rs.getString(4);
					String jinseungschool = rs.getString(5);
					
					switch(jinseungschool) {
						case "1": { jinseungschool = "중졸"; break;} 
						case "2": { jinseungschool = "고졸"; break;} 
						case "3": { jinseungschool = "전문대졸"; break; } 
						case "4": {	jinseungschool = "대졸"; break; } 
						case "5": { jinseungschool = "석사수료"; break; } 
						case "6": { jinseungschool = "석사취득"; break; } 
						case "7": { jinseungschool = "박사수료"; break; } 
						case "8": { jinseungschool = "박사취득"; break; } 
					}
					String jinseungjumin = rs.getString(6);
					jinseungjumin = jinseungjumin.substring(0, 6) + "-" + jinseungjumin.substring(6);
					String jinseungmajor = rs.getString(7);
					String jinseungphone = rs.getString(8) + "-" + rs.getString(9) + "-" + rs.getString(10);
					
					%>
					<tr>
						<td><%= jinseungno %></td>
						<td><%= jinseungname %></td>
						<td><%= jinseungp_class %></td>
						<td><%= jinseungp_partner %></td>
						<td><%= jinseungschool %></td>
						<td><%= jinseungjumin %></td>
						<td><%= jinseungmajor %></td>
						<td><%= jinseungphone %></td>
					</tr>
					<%
				}
				stmt.close();
				con.close();
			%>
		</table>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>