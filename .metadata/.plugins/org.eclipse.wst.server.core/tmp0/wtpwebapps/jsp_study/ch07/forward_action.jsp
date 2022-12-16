<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	%>

	<!--forward 액션은 최종 페이지에 파라미터를 함께 전달함, 최초 요청된 페이지 url이 표시됨 -->
	<jsp:forward page="page_control_end.jsp">
		<jsp:param name="tel" value="000-000-0000" />
	</jsp:forward>
</body>
</html>
