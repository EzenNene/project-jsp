<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/style.css" />
</head>
<body>
	<%@ include file="header.jsp"%>
	<%@ include file="nav.jsp"%>

	<div class="boxContainer">
		<!--  <form action="/Photo/reserv?p_id=${photographer.p_id}" method="get">-->
		<form action="/home" method="get">

			<div>
				<span>${photographer.p_name} 작가님 촬영 예약 페이지 입니다<br></span>
				<% out.println(request.getParameter("month")); %>월
				<% out.println(request.getParameter("i")); %>일 예약입니다
				<span><br></span>
				<span>예약자 성함 : </span>
				<input type="text" id="name" name="name" required maxlength="8" size="10">
				<span><br></span>
				<span>원하시는 컨셉을 적어주세요</span>
			</div>
			<div>
				<textarea id="story" name="story" rows="5" cols="33"></textarea>
				<button type="submit">예약하기</button>
			</div>
		</form>

	</div>

</body>
</html>