<%@page import="rentalbook.dao.FeedDao"%>
<%@page import="rentalbook.vo.Feed"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String title = request.getParameter("title");
String body = request.getParameter("body");
int no = Integer.parseInt(request.getParameter("no"));

Feed one= new Feed(no,null,title,body,null,0);

FeedDao feedDao = new FeedDao();

boolean r = feedDao.updateTitleAndBody(one);


//=========================================
if (r) {
	response.sendRedirect(application.getContextPath() + "/feed/view.jsp?no="+no);
} else {
%>
<script>
	window.alert("변경되지 않았습니다.");
	history.go(-1);
</script>
<%
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>