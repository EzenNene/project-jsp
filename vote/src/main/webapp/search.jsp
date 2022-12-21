<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="DTO.Member"%>

<%
request.setCharacterEncoding("UTF-8");
ArrayList<Member> list = new ArrayList<>();
list = (ArrayList<Member>)request.getAttribute("list");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<%@ include file="header.jsp"%>
	<section>
		<div class="title">후보조회</div>
		<div class="wrapper">
			<table style="width: 900px">
				<tr>
					<th>후보번호</th>
					<th>성명</th>
					<th>소속정당</th>
					<th>학력</th>
					<th>주민번호</th>
					<th>지역구</th>
					<th>대표전화</th>
				</tr>
				<%
				for (Member m : list) {
				%>
				<tr>
					<td><%=m.getM_no()%></td>
					<td><%=m.getM_name()%></td>
					<td><%=m.getP_code()%></td>
					<td><%=m.getP_school()%></td>
					<td><%=m.getM_jumin()%></td>
					<td><%=m.getM_city()%></td>
					<td><%=m.getP_tel()%></td>
				</tr>
				<%
				}
				%>
			</table>
		</div>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>