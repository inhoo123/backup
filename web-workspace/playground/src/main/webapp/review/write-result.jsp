<%@page import="java.sql.PreparedStatement"%>
<%@page import="oracle.jdbc.datasource.impl.OracleDataSource"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String writer = request.getParameter("writer");
String message = request.getParameter("message");
String score = request.getParameter("score");
int Iscore = Integer.parseInt(score);

OracleDataSource ods = new OracleDataSource();
ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
ods.setUser("playground");
ods.setPassword("oracle");

Connection conn = ods.getConnection();

PreparedStatement stmt = conn.prepareStatement("insert into reviews(writer,message,score)values(?,?,?)");
stmt.setString(1, writer);
stmt.setString(2, message);
stmt.setInt(3, Iscore);

int cnt = stmt.executeUpdate();

conn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>리뷰등록</h2>
	<%
	if (cnt == 1) {
	%>
	<p>당신의 소중한 의견이 잘 저장되었습니다.</p>
	<%
	} else {
	%><p>등록안됨</p>
	<%
	}
	%>
</body>
</html>