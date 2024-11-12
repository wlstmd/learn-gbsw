<%@ page language="java" import="java.sql.*" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Subject Join Ok</title>
</head>
<body>
	<%
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
			String sql = "insert into subject values(?, ?, ?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			String jinseungsubcode = request.getParameter("jinseungsubcode");
			String jinseungsubname = request.getParameter("jinseungsubname");
			String jinseungsubtext = request.getParameter("jinseungsubtext");
			
			pstmt.setString(1, jinseungsubcode);
			pstmt.setString(2, jinseungsubname);
			pstmt.setString(3, jinseungsubtext);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
			%>
			<script type="text/javascript">
				alert("과목등록이 완료되었습니다.");
				self.location.href = "subject_list.jsp";
			</script>
			<%
		} catch(Exception e) {
			%>
			<script type="text/javascript">
				alert("과목등록이 실패했습니다. 다시 시도해주세요.")
				self.location.href = "subject_join.jsp";
			</script>
			<%
		}
	%>
</body>
</html>