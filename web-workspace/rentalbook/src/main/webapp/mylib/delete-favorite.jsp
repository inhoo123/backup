<%@page import="rentalbook.dao.BookDao"%>
<%@page import="rentalbook.dao.FavoriteDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String[] no = request.getParameterValues("no");

if (no == null) {

	no = new String[0];
}
for (String n : no) {

	FavoriteDao favoriteDao = new FavoriteDao();
	BookDao bookDao = new BookDao();
	int parsedNo = Integer.parseInt(n);
	favoriteDao.deleteByNo(parsedNo);
}
%>
<script>
     	window.alert( "총<%=no.length%>개의 도서가 해제되었습니다.");
    	location.href="<%=application.getContextPath()%>
	/mylib/favorites.jsp"
</script>