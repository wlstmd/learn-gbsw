<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<style>
body {
	margin: 0;
}

a {
	text-decoration: none;
	color: white;
	height: 40px;
}
</style>
</head>
<body>
	<div style="background-color: gray">
		<h2 align="center"
			style="display: flex; justify-content: center; align-items: center; color: white; height: 60px; margin: auto;">쇼핑몰
			회원관리 ver 1.0</h2>
	</div>

	<nav>
		<div style="background-color: silver; padding: 5px;">
			&ensp;&ensp;<a href="join.jsp">회원등록</a> &ensp;&ensp;<a
				href="list_edit.jsp">회원목록조회/수정</a> &ensp;&ensp;<a
				href="sale_list.jsp">회원매출조회</a> &ensp;&ensp;<a href="main.jsp">홈으로</a>
		</div>
	</nav>
</body>
</html>