<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% request.setCharacterEncoding("euc-kr"); %>
  
<jsp:useBean id = "m" class="ch07.com.dao.Member" />
<jsp:setProperty name = "m" property="*" />


<%=
	m.result()
%>

</body>
</html>