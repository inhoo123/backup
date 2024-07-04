<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath"
	value="${pageContext.servletContext.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tutorial-MVC</title>
</head>
<body>

	<ul>
		<c:forEach var="one" items="${jobs }">
			<li><a
				href="${contextPath }/view/study?job_title=${one.job_title}">
					[${one.job_id }] ${one.job_title}
					</a>
		</c:forEach>
	</ul>
</body>
</html>