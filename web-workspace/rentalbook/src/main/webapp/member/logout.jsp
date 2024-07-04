<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%session.setAttribute("auth", false);%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	window.alert("로그아웃 되었습니다.");
	location.href="<%=application.getContextPath()%>/common/header.jsp";
</script>
</body>
</html>