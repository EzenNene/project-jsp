<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

<% Date now = new Date(); %>
<% SimpleDateFormat nowDate = new SimpleDateFormat("yyyy년 MM월 dd일"); %>
<% String nowDateFormat = nowDate.format(now); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
<%= nowDateFormat %>
</body>
</html>