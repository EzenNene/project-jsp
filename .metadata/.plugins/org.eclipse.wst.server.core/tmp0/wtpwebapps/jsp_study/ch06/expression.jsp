<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.Calendar"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% Calendar today = Calendar.getInstance(); %>
<%=today.get(Calendar.YEAR) %>
<%=today.get(Calendar.MONTH)+1 %>
<%=today.get(Calendar.DATE) %>
</body>
</html>