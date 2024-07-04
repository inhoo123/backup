<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사이드:회원가입</title>
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
					<h2 style="color: white; font-weight: 550;"><small>회원가입</small></h2>
				</div>
			</div>
		</div>
	</div>
	

	<div style="width: 840px; margin: 0 auto; padding-top: 100px">
		

		<form action="${pageContext.servletContext.contextPath }/join-handle">
			<table style="border-collapse: collapse; width: 100%">
				<tr>
					<td
						style="border: 1px solid #ccc; padding: 12px; text-align: center; background-color: #ddd"><span
						style="color: red"></span>랜덤코드</td>
					<td style="border: 1px solid #ccc; padding: 12px;"><input
						name="code" readonly value="${generatedString }"
						style="padding: 6px 10px; width: 280px; border: 1px solid #ccc" /></td>
				</tr>

				<tr>
					<td
						style="border: 1px solid #ccc; padding: 12px; text-align: center; background-color: #ddd"><span
						style="color: red"></span>아이디</td>
					<td style="border: 1px solid #ccc; padding: 12px;"><input
						name="id" type="text"
						style="padding: 6px 10px; width: 280px; border: 1px solid #ccc" /></td>
				</tr>
				<tr>
					<td
						style="border: 1px solid #ccc; padding: 12px; text-align: center; background-color: #ddd"><span
						style="color: red"></span>비밀번호</td>
					<td style="border: 1px solid #ccc; padding: 12px;"><input
						name="password" type="password"
						style="padding: 6px 10px; width: 280px; border: 1px solid #ccc" /></td>
				</tr>
				<tr>
					<td
						style="border: 1px solid #ccc; padding: 12px; text-align: center; background-color: #ddd"><span
						style="color: red"></span>비밀번호확인</td>
					<td style="border: 1px solid #ccc; padding: 12px;"><input
						name="password_check" type="password"
						style="padding: 6px 10px; width: 280px; border: 1px solid #ccc" /></td>
				</tr>
				<tr>
					<td
						style="border: 1px solid #ccc; padding: 12px; text-align: center; background-color: #ddd;"><span
						style="color: red"></span>닉네임</td>
					<td style="border: 1px solid #ccc; padding: 12px;"><input
						name="name" type="text"
						style="padding: 6px 10px; width: 280px; border: 1px solid #ccc" /></td>
				</tr>
			</table>
			<div style="text-align: center; margin-top: 20px;">
				<button type="submit" style="padding: 6px; background-color: #3b4890; color: white; cursor: pointer; width: 70px;">회원가입</button>
				<button type="reset" style="padding: 6px; background-color: #3b4890; color: white; cursor: pointer; width: 70px;">취소</button>
			</div>
		</form>
	</div>


</body>
</html>