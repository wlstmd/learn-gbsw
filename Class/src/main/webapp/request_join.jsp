<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Request Join</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<%
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
		Statement stmt = con.createStatement();
	%>
	<h3>수강등록</h3>
	<form name="frm" method="post" action="request_join_ok.jsp">
		<table border="1">
			<tr>
				<td>수강신청코드</td>
				<td>일련번호자동입력</td>
			</tr>
			<tr>
				<td>학생코드</td>
				<td>
					<select name="jinseungstucode">
						<%
							String sql = "select stu_code from student";
							ResultSet rs = stmt.executeQuery(sql);
							while(rs.next()) {
								String jinseungstucode = rs.getString(1);
								%>
								<option value="<%= jinseungstucode %>"><%= jinseungstucode %></option>
								<%
							}
						%>
					</select>
				</td>
			</tr>
			<tr>
				<td>과목코드</td>
				<td>
					<select name="jinseungsubcode">
						<%
							sql = "select sub_code from subject";
							rs = stmt.executeQuery(sql);
							while(rs.next()) {
								String jinseungsubcode = rs.getString(1);
								%>
								<option value="<%= jinseungsubcode %>"><%=jinseungsubcode %></option>
								<%
							}
						%>
					</select>
				</td>
			</tr>
			<%
				Calendar cal = Calendar.getInstance();
				int year = cal.get(Calendar.YEAR);
				int month = cal.get(Calendar.MONTH) + 1;
				int date = cal.get(Calendar.DATE);
				String date_s = "";
				if(date < 10) date_s = "" + "0" + date;
			%>
			<tr>
				<td>신청일</td>
				<td>
					<input type="date" name="jinseungadddate" value="<%=year %>-<%=month %>-<%=date_s %>"> 
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" onclick="valid()" value="등록">
				</td>
			</tr>
		</table>
		<%
			rs.close();
			con.close();
			stmt.close();
		%>
	</form>
</body>
<script type="text/javascript">
	function valid() {
		if(document.frm.jinseungstucode.value == "") {
			alert("학생 코드를 확인해주세요.");
			document.frm.jinseungstucode.focus();
			return false;
		} else if(document.frm.jinseungsubcode.value == "") {
			alert("과목코드를 확인해주세요.");
			document.frm.jinseungsubcode.focus();
			return false;
		} else {
			document.frm.submit();
		}
	}
</script>
</html>