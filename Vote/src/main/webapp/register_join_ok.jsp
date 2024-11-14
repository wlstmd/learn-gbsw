<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후보 등록 처리</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="section" style="min-height: 400px">
		<%
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
			ResultSet rs = null;
			PreparedStatement pstmt = null;
			String sql = "insert into TBL_REGISTER values(?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			
			String no = request.getParameter("NO");
			String name = request.getParameter("Name");
			String code = request.getParameter("Code");
			String school = request.getParameter("School");
			String jumin = request.getParameter("jumin") + request.getParameter("jumin2");
			String major = request.getParameter("Major");
			
			pstmt.setString(1, no);
			pstmt.setString(2, name);
			pstmt.setString(3, code);
			pstmt.setString(4, school);
			pstmt.setString(5, jumin);
			pstmt.setString(6, major);
			
			Statement stmt = con.createStatement();
			String sql2 = "select no from TBL_REGISTER order by no desc";
			rs = stmt.executeQuery(sql2);
			rs.next();
			String n = rs.getString(1);
			
			int topNo = Integer.parseInt(n);
			int compare = Integer.parseInt(no);
			if(compare != (topNo + 1)) {
				request.setAttribute("message", "error");
				request.setAttribute("sendvalue", topNo + 1);
				request.getRequestDispatcher("register_join.jsp").forward(request, response);
			} else {
				pstmt.executeUpdate();
			}
			
			stmt.executeQuery("commit");
			
			stmt.close();
			con.close();
			stmt.close();
		%>
		<jsp:include page="header.jsp" />
		<h2><%=name %>님의 후보등록이 완료되었습니다.</h2>
		<br>
		<a href="main.jsp">홈으로</a>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>