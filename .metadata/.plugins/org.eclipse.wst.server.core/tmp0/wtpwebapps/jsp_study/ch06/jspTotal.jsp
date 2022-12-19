<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ page import="java.util.*"%>
<%@ page import="java.lang.Math"%>
<title>Insert title here</title>
</head>
<body>
	<h2>jsp종합예제</h2>
	<hr>
	<!-- html용 주석 -->
	<%-- 선언태그: 멤버변수, 메소드선언 --%>
	<%!
		String[] members = {"강희재", "홍길동", "임꺽정", "이순신"};
		int num1 = 10;
		int calc(int num2) {
			return num1 + num2;
		}
	%>
	<%-- 표현태그: 사칙연산, 메소드 호출, 변수값 --%>
	<h3>
		1. calc(10) 메소드 실행 결과: <%=calc(10) %>
		<br />
		2. num1 변수 출력: <%=num1 %>
		<br />
		3. 연산출력: <%=num1 + 1 %>
	</h3>
	<hr>
	<%-- 스크립트릿 태그: 모든 자바 코드 --%>
	<ul>
		<% for(String name : members){%>
			<li><%=name%></li>
			<% }%>
	</ul>
	<hr>
	<ul>
		<% for(String name : members){
			out.println("<li>"+ name + "</li>");
			 }%>
	</ul>
	<hr>
	<%@ include file="../hello.jsp" %>
	<hr>
	<% Date day = new Date(); %>
	현재날짜 : <%= day %>
	5의 제곱 : <%= Math.pow(5, 2) %>
</body>
</html>