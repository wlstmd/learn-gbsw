<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
</head>
<body>
	<div style="float: right">
		<a href="main.jsp">메인화면</a>&nbsp;&nbsp; 
		<a href="join.jsp">회원가입</a>&nbsp;&nbsp;
		<a href="roomlist.jsp">객실목록</a>&nbsp;&nbsp;
		<%
		String id = (String) session.getAttribute("userid");
		if (id != null && id.length() > 0) {
		%>
		<a href="reserv.jsp">예약하기</a>&nbsp;&nbsp; 
		<a href="reserv_check.jsp">예약확인</a>&nbsp;&nbsp;
		<a href="mypage.jsp">회원정보수정</a>&nbsp;&nbsp; 
		<a href="mypage.jsp"><%=id%>님</a>&nbsp;&nbsp;
		<a href="logout.jsp">로그아웃</a>&nbsp;&nbsp;
		<%
		} else {
		%>
			<a href="login.jsp">로그인</a>&nbsp;&nbsp;
		<%
		}
		%>
	</div>
	<p style="clear: both"></p>
</body>
</html>