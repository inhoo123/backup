<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사이드 로그인</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/style.css?<%=System.currentTimeMillis() %>" />
</head>
<body>
	<div style="width: 840px; margin: 0 auto;">
	<div style="text-align: center">
	<h2>로그인</h2>
	</div>
<div
			style="width: 400px; margin: 60px auto; border: 1px solid #ddd; padding: 30px;">
			<form
				action="${pageContext.servletContext.contextPath }/login-handle" method="post">
				<p>
					<input type="text" class="login-input" placeholder="아이디를 입력해주세요" name="id"/>
				</p>
				<p>
					<input type="password" class="login-input"
						placeholder="비밀번호를 입력해주세요" name="password"/>
				</p>
				<p>
					<button type="submit" class="login-input">로그인</button>
				</p>
			</form>
		</div>

	</div>
</body>
</html>