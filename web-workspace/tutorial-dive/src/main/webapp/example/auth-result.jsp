<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");

	// id가 "admin" 
	// password 가 "1q2w3e4r" 이때만 인증성공
	if(id == null || id.isBlank() || pass==null || pass.isBlank()) {
		response.sendRedirect(request.getContextPath()+"/example/auth.jsp?error=blank");
		return;
	}
	
	boolean valid = false;
	if(id.equals("admin") && pass.equals("1q2w3e4r")) {
		request.getSession().setAttribute("auth", "success");
		valid = true;
	}
	
	if(!valid) {
		response.sendRedirect(request.getContextPath()+"/example/auth.jsp?error=invalid");
		return;
	}
	
	LocalDateTime time = LocalDateTime.now();
	String remoteAddr = request.getRemoteAddr();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증</title>
</head>
<body>
	<div style="text-align: center;">
		<h2>관리자 인증 성공</h2>
		<p>
			접속 아이피 : <%=remoteAddr %>  
		</p>
		<p>
			인증 시간 : <%=time.toString() %>
		</p>
	</div>
	
</body>
</html>