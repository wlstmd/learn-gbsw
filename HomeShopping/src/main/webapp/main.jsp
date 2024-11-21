<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<style>
body {
	margin: 0;
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="section" style="min-height: 400px;">
		<h3 style="text-align: center">쇼핑몰 회원관리 프로그램</h3>
		<div style="margin-left: 20px;">쇼핑몰 회원정보와 회원매출정보데이터베이스를 구축하고 회원관리 프로그램을 작성하는 프로그램이다.</div>
		<span style="margin-left: 20px;">프로그램 작성 순서</span>
		<ol style="margin: 0">
			<li>회원정보 테이블을 생성한다.</li>
			<li>매출정보 테이블을 생성한다.</li>
			<li>회원정보, 매출정보테이블에 제시된 문제지의 참조데이터를 추가 생성한다.</li>
			<li>회원정보 입력 화면 프로그램을 작성한다.</li>
			<li>회원정보 조회 프로그램을 작성한다.</li>
			<li>회원매출정보 조회 프로그램을 작성한다.</li>
		</ol>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>