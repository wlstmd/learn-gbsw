<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표 관리 프로그램</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="section" style="min-height: 400px; text-align: center">
		<h2>투표 관리 메인 페이지</h2>
		<h3>투표를 관리 하기위한 서비스 메인 페이지입니다. 투표 관리 페이지에서는 다음과 같은 기능을 제공합니다.</h3>
		<table align="center" width="200">
			<tr>
				<td>
					<ul>
						<li>후보등록</li>
						<li>후보조회</li>
						<li>투표하기</li>
						<li>투표결과</li>
						<li>후보자 순위</li>
					</ul>
				</td>
			</tr>
		</table>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>