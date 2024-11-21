<%@ page language="java" import="java.sql.*"
	import="java.text.SimpleDateFormat" import="DBPKG.Connect"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit OK</title>
</head>
<body>
	<%
	try {
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

		Connection con = Connect.getConnection();

		PreparedStatement pstmt = con.prepareStatement(
		"UPDATE member_tbl_02 SET custname=?, phone=?, address=?, joindate=?, grade=?, city=? WHERE custno=?");

		pstmt.setString(1, custname);
		pstmt.setString(2, phone);
		pstmt.setString(3, address);
		pstmt.setString(4, joindate);
		pstmt.setString(5, grade);
		pstmt.setString(6, city);
		pstmt.setInt(7, custno);

		int rows = pstmt.executeUpdate();

		if (rows > 0) {
	%>
	<script>
    alert("회원정보 수정이 완료되었습니다.");
    location.href = "list_edit.jsp";
</script>
	<%
	} else {
	%>
	<script>
    alert("회원정보 수정에 실패했습니다.");
    history.back();
</script>
	<%
	}

	pstmt.close();
	con.close();
	} catch (Exception e) {
	%>
	<script>
    alert("오류 발생: <%=e.getMessage()%>
		");
		history.back();
	</script>
	<%
}
%>
</body>
</html>