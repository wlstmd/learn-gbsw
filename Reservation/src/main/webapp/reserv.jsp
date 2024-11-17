<%@ page language="java" import="java.sql.*" import="java.util.*" import="jdbcCon.Connect" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/index.css?ver=2" />
<title>Reservation</title>
<script type="text/javascript">
	function check() {
		let nowDate = new Date();
		let date_s = document.frm.date_s.value;
		let date_e = document.frm.date_e.value;

		let today_y = '' + nowDate.getFullYear();
		let today_m = '' + (nowDate.getMonth() + 1);
		let today_d = '' + nowDate.getDate();

		if (today_m.length < 2)
			today_m = "0" + today_m;
		if (today_d.length < 2)
			today_d = "0" + today_d;

		let today_string = today_y + "-" + today_m + "-" + today_d;

		if (date_s.length == 0) {
			alert("시작 날짜를 확인해주세요");
			return false;
		} else if (date_e.length == 0) {
			alert("종료 날짜를 확인해주세요");
			return false;
		} else if (date_s < today_string || date_e <= today_string) {
			alert("현재 날짜보다 이전 날짜는 선택할 수 없습니다.");
			return false;
		} else if (date_e <= date_s) {
			alert("종료 날짜는 시작 날짜 이전 날짜로 선택할 수 없습니다.");
			return false;
		}
		document.frm.submit();
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<h2>객실 예약하기</h2>
	<p>예약 가능한 객실 리스트를 확인하고 예약하는 페이지입니다.</p>
	<form name="frm" method="post" action="reserv.jsp?search=1">
		<%
		String search = request.getParameter("search");
		if (search == null) {
		%>
		입실일: <input type="date" name="date_s"> 퇴실일: <input type="date"
			name="date_e"> <input type="button" value="예약 가능한 객실 보기"
			onclick="check()">
		<%
		} else {
		String date_s = request.getParameter("date_s");
		String date_e = request.getParameter("date_e");
		%>
		입실일: <input type="date" name="date_s" value="<%=date_s%>">
		퇴실일: <input type="date" name="date_e" value="<%=date_e%>"> <input
			type="button" value="예약 가능한 객실 보기" onclick="check()"> <br>
		<table border="1">
			<tr>
				<td>순번</td>
				<td>객실번호</td>
				<td>객실등급</td>
				<td>조식여부</td>
				<td>예약하기</td>
			</tr>
			<%
			try {
				Connection con = Connect.getConnection();
				Statement stmt = con.createStatement();
				ResultSet rs = null;
				String sql = "SELECT rnum, grade, breakfast FROM rroom WHERE rnum " + "NOT IN (SELECT rnum FROM Rreserv WHERE "
				+ "((date_s < TO_DATE('" + date_e + "', 'YYYY-MM-DD')) " + "AND (date_e > TO_DATE('" + date_s
				+ "', 'YYYY-MM-DD')))) " + "ORDER BY rnum ASC";
				rs = stmt.executeQuery(sql);
			%>
			<%
			int cnt = 1;

			while (rs.next()) {
				String rnum = rs.getString(1);
				String grade = rs.getString(2);
				if (grade.equals("1")) {
					grade = "패밀리룸";
				} else if (grade.equals("2")) {
					grade = "스위트룸";
				} else {
					grade = "트윈룸";
				}
				String breakfast = rs.getString(3);
				if (breakfast.equals("1")) {
					breakfast = "조식 제공";
				} else {
					breakfast = "조식 미포함";
				}
			%>
			<tr>
				<td><%=cnt++%></td>
				<td><%=rnum%></td>
				<td><%=grade%></td>
				<td><%=breakfast%></td>
				<td><input type="button" value="예약하기"
					onclick="document.location = 'reserv2.jsp?date_s=<%=date_s%>&date_e=<%=date_e%>&rnum=<%=rnum%>'"></td>
			</tr>
			<%
			}
			rs.close();
			stmt.close();
			con.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
			%>
		</table>
	</form>
	<%
	}
	%>
</body>
</html>