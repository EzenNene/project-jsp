<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
<link rel="stylesheet" href="./css/style.css" />
</head>
<body>
	<div class="wrap">
		<%@ include file="header.jsp"%>
		<%@ include file="nav.jsp"%>

		<div class="boxContainer">

			<c:forEach var="photographer" items="${photographerList}" varStatus="status">
				<div class="card">

					<div class="card_Img">
						<a href="./portfolio?p_id=${photographer.p_id}">
							<img alt="${photographer.p_id}" src=" ${photographer.p_img}">
						</a>
					</div>

					<div class="card_info">
						<span>${photographer.p_name}</span>
						<span>${photographer.p_intro}</span>
					</div>

				</div>
			</c:forEach>

		</div>

		<script type="text/javascript" src="./script.js"></script>

	</div>
</body>
</html>