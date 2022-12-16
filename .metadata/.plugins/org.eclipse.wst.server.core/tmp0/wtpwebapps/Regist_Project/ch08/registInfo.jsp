<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>고객정보 조회</h2>
	<hr>
	<ul>
		<li>고객 아이디: ${r.id}</li>
		<li>고객명: ${r.name}</li>
		<li>주소: ${r.address}</li>
		<li>등급: ${r.grade}</li>
		<li>전화번호: ${r.phone}</li>
	</ul>
</body>
</html>