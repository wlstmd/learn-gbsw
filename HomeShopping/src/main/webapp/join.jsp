<%@ page language="java" import="java.sql.*" import="java.util.*"
	import="java.text.SimpleDateFormat" import="DBPKG.Connect"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<h2 align="center">홈쇼핑 회원 등록</h2>
	<form name="frm" method="post" action="join_ok.jsp">
		<table style="width: 600px; margin: auto;" border="1">
			<tr>
				<td align="center">회원번호(자동발생)</td>
				<td>
					<%
					int newCustno = 0;

					try {
						Connection con = Connect.getConnection();
						Statement stmt = con.createStatement();
						String sql = "SELECT MAX(custno) FROM member_tbl_02";
						ResultSet rs = stmt.executeQuery(sql);

						if (rs.next()) {
							int maxCustno = rs.getInt(1);
							newCustno = maxCustno + 1;
						}

						rs.close();
						stmt.close();
						con.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
					%> <input type="text" name="custno" value="<%=newCustno%>"
					size="10" readonly>
				</td>
			</tr>
			<tr>
				<td align="center">회원성명</td>
				<td><input type="text" name="custname" size="10"></td>
			</tr>
			<tr>
				<td align="center">회원전화</td>
				<td><input type="text" name="phone" size="13" maxlength="13">
				</td>
			</tr>
			<tr>
				<td align="center">회원주소</td>
				<td><input type="text" name="address" size="20" maxlength="60">
				</td>
			</tr>
			<tr>
				<td align="center">가입일자</td>
				<td>
					<%
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
					String currentDate = sdf.format(new java.util.Date());
					%> <input type="text" name="joindate" size="10"
					value="<%=currentDate%>" readonly>
				</td>
			</tr>
			<tr>
				<td align="center">고객등급[A:VIP,B:일반,C:직원]</td>
				<td><input type="text" name="grade" size="10"></td>
			</tr>
			<tr>
				<td align="center">도시코드</td>
				<td><input type="number" name="city" size="10"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input style="width: 60px;"
					type="button" value="등록" onclick="join()"> <input
					style="width: 60px;" type="button" value="조회" onclick="get()">
				</td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript">
	function join() {
		if (document.frm.custno.value == "") {
			alert("회원번호가 입력되지 않았습니다.")
			document.frm.custno.focus();
			return false;
		} else if (document.frm.custname.value == "") {
			alert("회원이름이 입력되지 않았습니다.");
			document.frm.custname.focus();
			return false;
		} else if (document.frm.phone.value == "") {
			alert("회원전화가 입력되지 않았습니다.");
			document.frm.phone.focus();
			return false;
		} else if (document.frm.address.value == "") {
			alert("회원주소가 입력되지 않았습니다.");
			document.frm.address.focus();
			return false;
		} else if (document.frm.joindate.value == "") {
			alert("가입일자가 입력되지 않았습니다.");
			document.frm.joindate.focus();
			return false;
		} else if (document.frm.grade.value == "") {
			alert("고객등급이 입력되지 않았습니다.");
			document.frm.grade.focus();
			return false;
		} else if (document.frm.city.value == "") {
			alert("도시코드가 입력되지 않았습니다.");
			document.frm.city.focus();
			return false;
		} else {
			document.frm.submit();
		}
	}

	function get() {
		window.location.href="list_edit.jsp"
	}
</script>
</html>