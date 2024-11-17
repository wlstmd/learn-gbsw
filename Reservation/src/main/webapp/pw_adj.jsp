<%@ page language="java" import="java.sql.*" import="java.util.*" import="jdbcCon.Connect" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>password adjust</title>
</head>
<body>
	<%
		try {
			Connection con = Connect.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = null;
			String jinseungid = (String) session.getAttribute("userid");
			String jinseungprepw = request.getParameter("prepw");
			String jinseungnextpw = request.getParameter("nextpw");
			String sql = "select userpw from ruser where userid = '" + jinseungid + "'";
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				String dbpw = rs.getString(1);
				if(dbpw.equals(jinseungprepw)) {
					sql = "update ruser set userpw = '" + jinseungnextpw + "' where userid = '" + jinseungid + "'";
					stmt.executeQuery(sql);
					%>
					<jsp:forward page="/mypage.jsp?LoginInfo=1" />
					<%
				} else {
					%>
						<jsp:forward page="/mypage.jsp?LoginInfo=2" />
					<%
				}
				rs.close();
				stmt.close();
				con.close();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>