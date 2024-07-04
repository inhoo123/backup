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
	<div>
		<div class="gnb_bar2">
			<div style="text-align: center;">
				<div style="display: flex; align-items: center; justify-content: center;">
					<a href="${pageContext.servletContext.contextPath }/index"> <img
						src="${pageContext.servletContext.contextPath }/image/inside2.png"
						style="border: 5px padding: 7px; width: 150px; border-radius: 32px;" />
					</a>
					<h2 style="color: white; font-weight: 550;"><small>로그인</small></h2>
				</div>
			</div>
		</div>
	</div>
	<div style="width: 840px; margin: 0 auto;"></div>
	<div
		style="width: 450px; margin: 60px auto; border: 2px solid #3b4890; padding: 30px;">
		<form action="${pageContext.servletContext.contextPath }/login-handle"
			method="post">
			<p>
				<input type="text" class="login-input" placeholder="아이디"
					name="id"/>
			</p>
			<p>
				<input type="password" class="login-input"
					placeholder="비밀번호" name="password"/>
			</p>
			<p>
				<button type="submit" class="login-input2">로그인</button>
			</p>
		</form>
		<a 
			href="${pageContext.servletContext.contextPath }/join">회원가입</a>
	</div>	
</body>
</html>