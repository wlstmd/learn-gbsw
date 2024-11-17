<%@ page language="java" import="java.sql.*" import="java.util.*" import="jdbcCon.Connect " contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join_ok</title>
</head>
<body>
	<%
		try {
			Connection con = Connect.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = null;
			
			String userid = request.getParameter("userid");
			String userpw = request.getParameter("userpw");
			String usernm = request.getParameter("usernm");
			String age = request.getParameter("age");
			String phone = request.getParameter("phone");
			
			String sql = "INSERT INTO RUSER VALUES('" + userid + "', '" + userpw + "', '" + usernm + "', '" + age + "', '" + phone + "')";
			int result = stmt.executeUpdate(sql);
			
			if(result > 0) {
				%>
					<h2>회원가입</h2>
					<br>
					<%=userid%>님 회원가입을 축하드립니다.
					<a href="main.jsp">메인화면으로 가기</a>
				<%
			} else {
				String sql1 = "select * from ruser where userid = '" + userid + "'";
				rs = stmt.executeQuery(sql1);
				
				if(rs.next()) {
					%>
						<script>
							alert("이미 등록된 아이디어입니다.");
							window.history.back();
						</script>
					<%
				}
			}
			
			if(rs != null) {
				rs.close();
				stmt.close();
				con.close();
			}
		} catch(Exception e) {
			out.print("<br> 회원 가입 중 오류가 발생하였습니다. 다시 시도해주세요. <br><br>");
			out.print("<a href=\"join.jsp\">회원가입으로 돌아가기</a>");
		}
	%>
</body>
</html>