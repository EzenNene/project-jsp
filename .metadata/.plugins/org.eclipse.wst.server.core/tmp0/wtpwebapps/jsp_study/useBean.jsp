<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>구구단 출력하기</h4>
	<jsp:useBean id="func" class="ch07.com.dao.GuGuDan" />
	<% int arr[]=func.process(5); 
		for(int i=0; i<9; i++) {
			out.println(5 + "*" + (i+1) + "=" + arr[i] + "<br>");	
		}
	%>

<%-- 1. System.out.println() : 이클립스 콘솔에 출력됨 --%>
<%-- 2. out.println() : 웹 화면에 출력됨 --%>



</body>
</html>