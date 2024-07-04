<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 운세</title>
</head>
<body>
	<h2>오늘의 운세</h2>
	<img  src="https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/1197731480876321-cc0366a3-4839-46d1-b69d-c3630f7221f6.jpg">
	<h6>명란젓 먹고싶다</h6>
	
	<p>
		<%
		if ((Math.random() * 10) >= 6) {
		%>
		<b>성공</b>
		<%
		} else {
		%>
		<b>실패</b>
		<%
		}
		%>
	</p>
</body>
</html>