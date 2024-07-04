<%@page import="java.util.List"%>
<%@page import="model.Rank"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

List<Rank> ranks = (List<Rank>)application.getAttribute("ranks");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>명예의전당</title>
</head>
<body>
<div style="text-align: center">
<%for(int i=0; i<ranks.size();i++) {%>
<p>
<h2>명예의 전당</h2>
<b>#<%=i+1 %></b>
<%=ranks.get(i).getIp() %>
<small>(
시도횟수:<%=ranks.get(i).getTurn() %>
걸린시간 : <%=ranks.get(i).getElapsed() %>ms
)</small>
</p>
<%} %>
 </div>
</body>
</html>