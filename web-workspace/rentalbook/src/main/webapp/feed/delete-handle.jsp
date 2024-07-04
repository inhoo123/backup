<%@page import="rentalbook.vo.Feed"%>
<%@page import="rentalbook.dao.FeedDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String authUserId= (String)session.getAttribute("auth_user_id");
int no = Integer.parseInt(request.getParameter("no"));

FeedDao feedDao = new FeedDao();

Feed found = feedDao.findByNo(no);
boolean result;

if(found== null || found.writerId()==null || !found.writerId().equals(authUserId)){
	result=false;
}else{
	result= feedDao.deleteByNo(no);
}

//=========================================
if (result) {
	response.sendRedirect(application.getContextPath() + "/feed/list.jsp");
} else {
	
%>
<script>
	window.alert("삭제가 되지 않았습니다.");
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