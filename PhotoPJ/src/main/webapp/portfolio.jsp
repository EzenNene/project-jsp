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
	<div class="wrap_pf">
		<%@ include file="header.jsp"%>
		<%@ include file="nav.jsp"%>

		<div class="boxContainer">

			<div class="infobox">
				<div class="card_Img">
					<img alt="${photographer.p_name}" src="${photographer.p_img}">
				</div>
				<div class="textbox">
					<span>${photographer.p_name} 작가</span>
					<span>${photographer.p_intro}</span>
					<div class="tel_email_loc">
						<span>연락처 : ${photographer.p_phone}</span>
						<span>이메일 : ${photographer.p_email}</span>
						<span>활동지역 : ${photographer.p_loc}</span>					
					</div>
					<a href="./reserv?p_id=${photographer.p_id}">예약하기</a>
				</div>
				
			</div>
			
		<div class= "pf_images">
			<article><img alt="1" src="https://images.unsplash.com/photo-1672170784185-19b0c7a9c024?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1935&q=80"></article>
			<article><img alt="2" src="https://images.unsplash.com/photo-1672166361196-6f85e76d9ce6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1947&q=80"></article>
			<article><img alt="3" src="https://images.unsplash.com/photo-1672197341074-451a44600435?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"></article>
			<article><img alt="4" src="https://images.unsplash.com/photo-1672167834379-f6f3f9b8429e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"></article>
			<article><img alt="5" src="https://images.unsplash.com/photo-1672092301149-5bf9df0449b7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80"></article>
			<article><img alt="6" src="https://images.unsplash.com/photo-1672187455503-70bafac016ce?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80"></article>
		</div>

		</div>
		
		
	</div>
</body>
</html>