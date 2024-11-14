<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표하기</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="section" style="min-height: 400px">
		<h2 align="left">투표하기</h2>
		<form name="frm1" action="vote_action.jsp" method="POST">
			<table border="1" width="600">
				<tr>
					<td align="left" width="30%">주민번호</td>
					<td align="left" width="70%">
						<input type="text" name="v_jumin" size="20" maxlength="13">예)0403013000001
					</td>
				</tr>
				<tr>	
					<td align="left">성명</td>
					<td align="left" width="70%">
						<input type="text" name="v_name" size="20" maxlength="20">
					</td>
				</tr>
				<tr>	
					<td align="left">후보번호</td>
					<td align="left">
						<select name="choice_no">
							<option value="">==후보번호 선택==</option>
							<%
								Class.forName("oracle.jdbc.OracleDriver");
								Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
								Statement stmt = con.createStatement();
								String sql = "select no, name from TBL_REGISTER";
								ResultSet rs = stmt.executeQuery(sql);
								
								while(rs.next()) {
									int no = rs.getInt(1);
									String name = rs.getString(2);
									%>
									<option value="<%= no %>"><%= no %>번 <%= name %></option>
									<%
								}
							%>
						</select>
					</td>
				</tr>
				<tr>
					<td align="left">투표시간</td>
					<td align="left" width="70%">
						<input type="text" name="v_time" size="20" maxlength="4">예)0930
					</td>
				</tr>
				<tr>
					<td align="left">투표소</td>
					<td align="left" width="70%">
						<input type="text" name="v_area" size="20" maxlength="30">예)제1투표소
					</td>
				</tr>
				<tr>
					<td align="left">개인정보수집이용동의</td>
					<td>
						<input type="radio" name="v_confirm" value="Y">동의
						<input type="radio" name="v_confirm" value="N">미동의
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<input type="button" value="투표하기" onclick="valid()">
						<input type="button" value="다시하기" onclick="res()">
					</td>
				</tr>
			</table>
		</form>
		<a href="main.jsp">홈으로</a>
	</div>
	<%@ include file="footer.jsp" %>
</body>
<script type="text/javascript">
	function valid() {
		if(document.frm1.v_jumin.value == "") {
			alert("주민번호를 입력하세요.");
			document.frm1.v_jumin.focus();
			return false;
		} else if (document.frm1.v_jumin.value.length != 13) {
			alert("주민번호는 13자리를 입력해야합니다.");
			document.frm1.v_jumin.focus();
			return false;
		} else if (document.frm1.v_name.value == "") {
			alert("이름을 입력하세요.");
			document.frm1.v_name.focus();
			return false;
		} else if (document.frm1.choice_no.value == "") {
			alert("후보번호를 입력하세요.");
			document.frm1.choice_no.focus();
			return false;
		} else if (document.frm1.v_time.value == "") {
			alert("투표시간을 입력하세요..")
			document.frm1.v_time.focus();
			return false;
		} else if (document.frm1.v_area.value == "") {
			alert("투표장소를 입력하세요.");
			document.frm1.v_area.focus();
			return false;
		} else if (document.frm1.v_confirm.value == "") {
			alert("개인정보수집이용동의에 동의하지 않으면 투표 할 수 없습니다.");
			document.frm1.v_confirm.focus();
			return false;
		} else {
			document.frm1.submit();
		}
	}
	
	function res() {
		alert("다시 입력합니다.")
		document.frm1.reset();
	}
</script>
</html>