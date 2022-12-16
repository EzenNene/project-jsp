<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int n1 = Integer.parseInt(request.getParameter("n1")); //int형으로 변경
	int n2 = Integer.parseInt(request.getParameter("n2"));
	System.out.println("n1: " + n1);
	System.out.println("n2: " + n2);
	System.out.println(request.getParameter("n1"));
	System.out.println(request.getParameter("n2"));
	//연산자를 받아옴
	String op = request.getParameter("op"); //연산자
	System.out.println("op : " + op);
		
	long result = 0; // 연산의 결과를 담을 변수

switch(op) {
		case "+" : result = n1 + n2; break;
		case "-" : result = n1 - n2; break;
		case "*" : result = n1 * n2; break;
		case "/" : result = n1 / n2; break;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	결과 : <%= result %>
</body>
</html>