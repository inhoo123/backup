<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String error = request.getParameter("error");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Example</title>
</head>
<body>
	<div style="text-align: center;">
		<h3>관리자 로그인</h3>
		<form action="<%=request.getContextPath()%>/example/auth-result.jsp">
			<p>
				ID<br /> <input type="text" name="id" placeholder="아이디.."/>
			</p>
			<p>
				PASSWORD<br /> <input type="password" name="pass" placeholder="비밀번호.."/>
			</p>
			<%if(error != null) { %>
			<p style="color: red">
				아이디 또는 비밀번호가 일치하지 않습니다.
			</p>
			<%} %>
			<p>
				<button type="submit">인증</button>
			</p>
		</form>
	</div>
</body>
</html>