<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Book"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="oracle.jdbc.datasource.impl.OracleDataSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String sort=request.getParameter("sort");
OracleDataSource ods = new OracleDataSource();
ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
ods.setUser("playground");
ods.setPassword("oracle");

Connection conn = ods.getConnection();

String sql = "SELECT * FROM BOOKS";
if(sort == null || sort.equals("ta")) {
	sql += " ORDER BY TITLE ASC";
}else if(sort.equals("spd")) {
	sql = " ORDER BY SALE_PRICE DESC";
}else if(sort.equals("spa")) {
	sql = " ORDER BY SALE_PRICE ASC";
}else {
	sql = " ORDER BY TITLE ASC";
}

PreparedStatement stmt = conn.prepareStatement(sql);

ResultSet rs = stmt.executeQuery();
List<Book> books = new ArrayList<>();
while (rs.next()) {
	//new Review(rs.getString(1), rs.getString(2), rs.getInt(1));
	String title = rs.getString("title");
	String author = rs.getString("author");
	String publisher = rs.getString("publisher");
	String status = rs.getString("status");
	int price = rs.getInt("price");
	int discountPrice = rs.getInt("discountprice");
	double discountRate = rs.getDouble("discountrate");

	Book one = new Book(title, author, publisher, status, price, discountPrice, discountRate); // 요령이 생기면 객체로 안 만들고 맵으로 처리하는 경우도 ..
	books.add(one);
}
conn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고 책 목록</title>
</head>
<body>
<h2 style="text-align: center;">중고책 모음</h2>
	<%for(Book one: books){ %>
	<h4 style="text-align: center;"><%=one.title() %> - <small style="color: #555"><%=one.author() %>  (출판사)<%=one.publisher() %></small></h4>
	<p style="text-align: center;">
	 상품상태:<b><%=one.status() %></b></br> 
     원가 <small style="background-color:#789;"><%=one.price() %>원</small>
	 할인가 <%=one.discountPrice() %>원(<small style="color: red"><%=one.discountRate()%>%</small>)	   
	</p>
	<%} %>
		
	
	

</body>
</html>