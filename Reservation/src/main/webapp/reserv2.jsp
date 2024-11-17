<%@ page language="java" import="java.sql.*" import="java.util.*" import="jdbcCon.Connect" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/index.css?ver=2" />
<title>Reservation2</title>
<script type="text/javascript">
	function check() {
		let usernm = document.frm.usernm.value;
		let phone = document.frm.phone.value;
		if (usernm.length == 0) {
			alert("예약자명을 확인해주세요.");
			return false;
		}
		if (phone.length == 0) {
			alert("연락처를 확인해주세요.");
			return false;
		}
		document.frm.submit();
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<h2>객실 예약하기</h2>
	<p>선택하신 객실을 예약하는 페이지입니다.</p>
	<form name="frm" method="post" action="reserv_ok.jsp">
		<table border="1">
			<tr>
				<th>예약시작일</th>
				<th>예약종료일</th>
				<th>객실번호</th>
				<th>객실등급</th>
				<th>조식여부</th>
				<th>예약자명</th>
				<th>연락처</th>
			</tr>
			<%
			String date_s = request.getParameter("date_s");
			String date_e = request.getParameter("date_e");
			String input_rnum = request.getParameter("rnum");
			String usernm = (String) session.getAttribute("usernm");
			String phone = (String) session.getAttribute("phone");

			try {
				Connection con = Connect.getConnection();
				Statement stmt = con.createStatement();
				ResultSet rs = null;
				String sql = "select rnum, grade, breakfast from rroom where rnum='" + input_rnum + "'";
				rs = stmt.executeQuery(sql);

				if (rs.next()) {
					String rnum = rs.getString("rnum");
					String grade = rs.getString("grade");
					String breakfast = rs.getString("breakfast");
			%>
			<tr>
				<td><input type="text" name="date_s" value="<%=date_s%>"></td>
				<td><input type="text" name="date_e" value="<%=date_e%>"></td>
				<td><input type="text" name="rnum" value="<%=rnum%>"></td>
				<td><%=grade%></td>
				<td><%=breakfast%></td>
				<td><input type="text" name="usernm" value="<%=usernm%>"></td>
				<td><input type="text" name="phone" value="<%=phone%>"></td>
			</tr>
			<tr>
				<td colspan="7" align="center"><input type="button"
					value="예약 완료하기" onclick="check()"></td>
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
</body>
</html>