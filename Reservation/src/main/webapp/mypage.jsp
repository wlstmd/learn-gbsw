<%@ page language="java" import="java.sql.*" import="java.util.*" import="jdbcCon.Connect" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<h2>회원정보</h2>
	<%
		String loginInfo = request.getParameter("LoginInfo");
		if(loginInfo != null && loginInfo.equals("1")) {
			%>
			<script>
				alert("비밀번호를 변경했습니다.")
			</script>
			<%
		} else if(loginInfo != null && loginInfo.equals("2")) {
			%>
				<script>
					alert("이전비밀번호 입력을 다시 확인해주세요.")
				</script>
			<%
		}
		
		try {
			Connection con = Connect.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = null;
			String id = (String) session.getAttribute("userid");
			String sql = "select * from ruser where userid = '" + id + "'";
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				String jinseunguserid = rs.getString(1);
				String jinseunguserpw = rs.getString(2);
				String jinseungusernm = rs.getString(3);
				int jinseungage = rs.getInt(4);
				String jinseungphone = rs.getString(5);
				%>
					<form name="frm" method="post" action="pw_adj.jsp">
						<table style="width: 500px; margin: auto;">
							<tr>
								<td>아이디</td>
								<td><%= jinseunguserid %></td>
							</tr>
							<tr>
								<td>이전비밀번호</td>
								<td><input type="password" name="prepw"></td>
							</tr>
							<tr>
								<td>새비밀번호</td>
								<td><input type="password" name="nextpw"></td>
							</tr>
							<tr>
								<td>새비밀번호 확인</td>
								<td><input type="password" name="nextpw2"></td>
							</tr>
							<tr>
								<td>이름</td>
								<td><%= jinseungusernm %></td>
							</tr>
							<tr>
								<td>나이</td>
								<td><%= jinseungage %></td>
							</tr>
							<tr>
								<td>연락처</td>
								<td><%= jinseungphone %></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: center">
									<input type="button" value="변경" onclick="check()">
								</td>
							</tr>
						</table>
					</form>
				<%
			}
			rs.close();
			stmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	%>
</body>
<script type="text/javascript">
	function check() {
		let prepw = document.frm.prepw;
		let nextpw = document.frm.nextpw;
		let nextpw2 = document.frm.nextpw2;
		
		if(prepw.value == "") {
			alert("이전비밀번호를 입력을 확인하세요.")
			return null;
		} 
		if(nextpw.value == "") {
			alert("새비밀번호 입력을 확인하세요.")
			return null;
		}
		if(nextpw2.value == "") {
			alert("새비밀번호 확인 입력을 확인하세요.")
			return null;
		}
		if(nextpw.value == nextpw2.value) {
			document.frm.submit();
		}
	}
</script>
</html>