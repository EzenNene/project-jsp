<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- sendRedirect는 단순히 지정된 페이지로 최종 화면 이동, 최종 전달된 페이지 url이 표시됨 -->
	<%
	response.sendRedirect("page_control_end.jsp");
	%>
</body>
</html>
