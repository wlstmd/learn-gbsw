<%@ page language="java" import="java.sql.*"
	import="java.text.SimpleDateFormat" import="DBPKG.Connect"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

		String sql = "INSERT INTO member_tbl_02 VALUES(?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = con.prepareStatement(sql);

		int custno = Integer.parseInt(request.getParameter("custno"));
		String custname = request.getParameter("custname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String joindate = request.getParameter("joindate");

		SimpleDateFormat inputFormat = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat outputFormat = new SimpleDateFormat("yyyyMMdd");

		try {
			java.util.Date parsedDate = inputFormat.parse(joindate);
			joindate = outputFormat.format(parsedDate);
		} catch (Exception e) {
			throw new Exception("잘못된 날짜 형식입니다. YYYYMMDD 형식으로 입력해주세요.");
		}

		String grade = request.getParameter("grade");
		String city = request.getParameter("city");

		pstmt.setInt(1, custno);
		pstmt.setString(2, custname);
		pstmt.setString(3, phone);
		pstmt.setString(4, address);
		pstmt.setString(5, joindate);
		pstmt.setString(6, grade);
		pstmt.setString(7, city);

		pstmt.executeUpdate();

		pstmt.close();
		con.close();
	%>
	<script type="text/javascript">
    alert("등록이 완료되었습니다!");
    self.location.href="main.jsp";
</script>
	<%
	} catch (Exception e) {
	System.out.println("error : " + e);
	%>
	<script type="text/javascript">
    alert("등록에 실패했습니다: <%=e.getMessage()%>
		");
		self.location.href = "join.jsp";
	</script>
	<%
}
%>
</body>
</html>