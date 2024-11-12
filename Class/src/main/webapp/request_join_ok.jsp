<%@ page language="java"  import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Request Join Ok</title>
</head>
<body>
	<%
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
			String sql = "insert into request values((select MAX(add_code) + 1 from request), ?, ?, ?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			String jinseungstucode = request.getParameter("jinseungstucode");
			String jinseungsubcode = request.getParameter("jinseungsubcode");
			String jinseungadddate = request.getParameter("jinseungadddate");
			
			pstmt.setString(1, jinseungstucode);
			pstmt.setString(2, jinseungsubcode);
			pstmt.setString(3, jinseungadddate);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
			%>
			<script type="text/javascript">
				alert("수강신청 등록이 완료되었습니다!")
				self.location.href = "request_list.jsp";
			</script>
			<%
		} catch(Exception e) {
			%>
			<script type="text/javascript">
				alert("수강신청 등록이 실패했습니다. 다시 시도해주세요.");
				self.location.href = "request_join.jsp";
			</script>
			<%
		}
	%>
</body>
</html>