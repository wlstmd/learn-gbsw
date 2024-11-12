<%@ page language="java" import="java.sql.*" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Class Join Ok</title>
</head>
<body>
	<%
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
			String sql = "insert into class values(?, ?, ?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			String jinseungclasscode = request.getParameter("jinseungclasscode");
			String jinseungclassname = request.getParameter("jinseungclassname");
			String classphone = request.getParameter("classphone1");
			String classphone2 = request.getParameter("classphone2");
			String classphone3 = request.getParameter("classphone3");
			classphone = classphone + "-" + classphone2 + "-" + classphone3;
				
			pstmt.setString(1, jinseungclasscode);
			pstmt.setString(2, jinseungclassname);
			pstmt.setString(3, classphone);
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
			%>
			<script type="text/javascript">
				alert("학과 등록이 완료 되었습니다!");
				self.location.href="class_list.jsp";
			</script>
			<%
		} catch(Exception e) {
			%>
			<script type="text/javascript">
				alert("학과 등록이 실패했습니다. 다시 시도해주세요.");
				self.location.href="class_join.jsp";
			</script>
			<%
		}
	%>
</body>
</html>