<%@ page language="java" import="java.sql.*" import="java.util.*" import="jdbcCon.Connect" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/index.css?ver=2" />
<title>Reservation_ok</title>
</head>
<body>
	<%
	String jinseungdate_s = request.getParameter("date_s");
	String jinseungdate_e = request.getParameter("date_e");
	String jinseungrnum = request.getParameter("rnum");
	String jinseunguserid = (String) session.getAttribute("userid");
	String jinseungusernm = (String) request.getParameter("usernm");
	String jinseungphone = (String) request.getParameter("phone");
	try {
		Connection con = Connect.getConnection();
		String sql = "insert into Rreserv values(?,?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, jinseungdate_s);
		pstmt.setString(2, jinseungdate_e);
		pstmt.setString(3, jinseungrnum);
		pstmt.setString(4, jinseunguserid);
		pstmt.setString(5, jinseungusernm);
		pstmt.setString(6, jinseungphone);
		pstmt.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
	<jsp:include page="header.jsp" />
	<h2>예약이 완료되었습니다.</h2>
	<p>행복하고 편안한 숙박 되십시오 ^^</p>
	<br>
	<a href="reserv_check.jsp">내 예약현황 확인하기</a>
</body>
</html>