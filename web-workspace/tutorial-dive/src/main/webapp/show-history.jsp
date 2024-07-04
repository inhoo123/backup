<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<String> list = (List<String>)session.getAttribute("history");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>당신의 방문기록</h2>
	<ul>
	<%for(String one : list) { %>
		<li><%=one %></li>
	<%} %>
	</ul>
</body>
</html>