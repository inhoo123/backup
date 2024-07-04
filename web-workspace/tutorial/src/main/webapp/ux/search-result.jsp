<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Map<String, String> map = new HashMap<>();

map.put("page", "페이지의 각종 속성 설정을 잡고자 할때 사용한다.");
map.put("include", "다른 파일의 내용을 포함 시킬 때 사용한다.");
map.put("taglib", "사용자 정의 태그를 활용하고자 할때 사용한다.");

String subject = request.getParameter("subject");
String value = map.get(subject);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>
		검색어 :<%=subject%></h3>
	<%
	if (value != null) {
	%>
	<%=value%>
	<%
	} else {
	%>
	<p>등록되지 않은 주제입니다</p>
	<%
	}
	%>
</body>
</html>