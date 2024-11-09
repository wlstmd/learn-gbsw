<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
	PreparedStatement pstmt = null;
	String SQL = "INSERT INTO MEMBER VALUES(?, ?, ?, ? ,?, ?, ?, ?, ?)";
	
	pstmt = conn.prepareStatement(SQL);
	String userid = request.getParameter("userid");
	String username = request.getParameter("username");
	String userpw = request.getParameter("userpw");
	String jumin = request.getParameter("jumin1") + request.getParameter("jumin2");
	String gender = request.getParameter("gender");
	String address = request.getParameter("address");
	String job = request.getParameter("job");
	String mailreceive = request.getParameter("mailreceive");
	if(mailreceive != null && mailreceive.equals("on"))
		mailreceive = "Y";
	else
		mailreceive = "N";
	String intro = request.getParameter("intro").replace("\r\n", "<br>");
	
	pstmt.setString(1, userid);
	pstmt.setString(2, username);
	pstmt.setString(3, userpw);
	pstmt.setString(4, jumin);
	pstmt.setString(5, gender);
	pstmt.setString(6, address);
	pstmt.setString(7, job);
	pstmt.setString(8, mailreceive);
	pstmt.setString(9, intro);
	
	pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
%>

<h2><%= username %>님의 회원가입이 완료되었습니다.</h2>
<br>
<a href="main.jsp">홈으로</a>