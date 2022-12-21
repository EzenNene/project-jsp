<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
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
		<div class="title">투표하기</div>
		<form name="frm" action="vote">
			<input type="hidden" id="GUBUN" value="vote">
			<div class="wrapper">
				<table>
					<tr>
						<th>주민번호</th>
						<td><input type="text" name="v_jumin"></td>
					</tr>
					<tr>
						<th>성명</th>
						<td><input type="text" name="v_name"></td>
					</tr>
					<tr>
						<th>투표번호</th>
						<td><input type="text" name="m_no"></td>
					</tr>
					<tr>
						<th>투표시간</th>
						<td><input type="text" name="v_time"></td>
					</tr>
					<tr>
						<th>투표장소</th>
						<td><input type="text" name="v_area"></td>
					</tr>
					<tr>
						<th>유권자확인</th>
						<td>
							<input type="radio" name="v_confirm">확인
							<input type="radio" name="v_confirm">미확인
						</td>
						
					</tr>

					<tr>
						<td colspan="2">
							<button class="btn" type="submit"
								onclick="fn_submit(); return false;">투표하기</button>
							<button class="btn" type="button" onclick="location='list'">다시하기</button>
						</td>
					</tr>
				</table>
			</div>
		</form>

	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>