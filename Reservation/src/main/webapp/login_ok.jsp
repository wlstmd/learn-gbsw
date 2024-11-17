<%@ page import="java.sql.*" import="java.util.*" import="jdbcCon.Connect" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login_ok</title>
</head>
<body>
	<%
		try {
			Connection con = Connect.getConnection();
			Statement stmt = con.createStatement();
			
			String id = request.getParameter("userid");
			String pw = request.getParameter("userpw");
			
			String sql = "select * from ruser where userid='" + id + "' and userpw='" + pw + "'";
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				String userid = rs.getString(1);
				String userpw = rs.getString(2);
				String usernm = rs.getString(3);
				int age = rs.getInt(4);
				String phone = rs.getString(5);
				session.setAttribute("userid", userid);
				session.setAttribute("userpw", userpw);
				session.setAttribute("usernm", usernm);
				session.setAttribute("age", age);
				session.setAttribute("phone", phone);
				%>
				<jsp:forward page="/main.jsp" />
				<%
			} else {
				%>
				<jsp:forward page="/login.jsp?LoginErr=1" />
				<%
			}
			rs.close();
			stmt.close();
			con.close();
		} catch(Exception e) {
			%>
			<jsp:forward page="/login.jsp?LoginErr=1" />
			<%
		}
	%>
</body>
</html>