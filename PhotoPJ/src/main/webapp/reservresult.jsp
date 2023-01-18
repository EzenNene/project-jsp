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
	

	<%-- <c:if test="${reservList == null}">
			<jsp:forward page="reservresult" />
	</c:if> --%>
	
	<div class="wrap">
		<table class="reserv_list">
			<caption>

				<h1>${testname}작가님 예약목록</h1>			

			</caption>
			<thead>
				<tr>
					<th>예약번호</th>
					<th>모델이름</th>
					<th>컨셉</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="reserv" items="${reservList}" varStatus="status">
					<tr>						
						<td>${reserv.reserv_id}</td>
						<td>${reserv.m_name}</td>
						<td>${reserv.concept}</td>

						<%-- <td>${reserv.reserv_id}</td> --%>
						<%-- <td>${reserv.m_name}</td> --%>
						<%-- <td>${reserv.concept}</td> --%>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="bt_wrap bt_list">
			<a href="write">컨셉 수정하기</a>
			<a href="write2">예약 삭제하기</a>
		</div>
		
	</div>
</body>
</html>