<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   		session.removeAttribute("auth");
   									
   		System.out.println(request.getSession()==session);
   %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>
		인증해제 되었습니다.
	</p>
</body>
</html>