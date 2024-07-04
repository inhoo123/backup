<%@page import="java.sql.PreparedStatement"%>
<%@page import="oracle.jdbc.datasource.impl.OracleDataSource"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String title = request.getParameter("title");//1
String author = request.getParameter("author");//2
String publisher = request.getParameter("publisher");//3
String status = request.getParameter("status");//4
String price = request.getParameter("price");//5
String discountPrice = request.getParameter("discountPrice");//6

int Iprice = Integer.parseInt(price);
int IdiscountPrice = Integer.parseInt(discountPrice);
double discountRate = (double)(Iprice - IdiscountPrice) / Iprice * 100;


OracleDataSource ods = new OracleDataSource();
ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
ods.setUser("playground");
ods.setPassword("oracle");

Connection conn = ods.getConnection();

	PreparedStatement stmt = 
conn.prepareStatement("insert into books(title,author,publisher,status,price,discountPrice,discountRate)values(?,?,?,?,?,?,?)");
stmt.setString(1, title);
stmt.setString(2, author);
stmt.setString(3, publisher);
stmt.setString(4, status);
stmt.setInt(5, Iprice);
stmt.setInt(6, IdiscountPrice);
stmt.setDouble(7, discountRate);

int cnt = stmt.executeUpdate();


conn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 정보등록</title>
</head>
<body>
	<h2 style="text-align: center;">책 등록</h2>
	<%if (cnt == 1) {%>
	<p style="text-align: center;">등록완료 되었습니다.</p>
	<div style="text-align: center;">
	<img  src="https://th.bing.com/th/id/OIP.NxRffpvX7pmrPkEZ3BRA6wHaEK?w=280&h=180&c=7&r=0&o=5&pid=1.7">
	</div>
	<%} else {
	%><p>등록안됨</p>
	<%}%><br/>
	<a style="text-align: center;" href="<%=application.getContextPath()%>/book/book-list.jsp">회원님들이 등록한 중고책 목록 보러가기</a>
	
</body>
</html>