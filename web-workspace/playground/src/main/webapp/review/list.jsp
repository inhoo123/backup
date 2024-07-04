<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Review"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="oracle.jdbc.datasource.impl.OracleDataSource"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<Review> reviews = new ArrayList<>();

	OracleDataSource ods = new OracleDataSource();
	ods.setURL("jdbc:oracle:thin:@//13.125.135.193:1521/xe");
	ods.setUser("playground");
	ods.setPassword("oracle");
	
	Connection conn = ods.getConnection();
	PreparedStatement stmt = conn.prepareStatement("SELECT * FROM REVIEWS");
	ResultSet rs =stmt.executeQuery();
	
	while(rs.next()) {
		//new Review(rs.getString(1), rs.getString(2), rs.getInt(1));
		String writer = rs.getString("writer");
		int score = rs.getInt("score");
		String message = rs.getString("message");

		Review one = new Review(writer, message, score);	// 요령이 생기면 객체로 안 만들고 맵으로 처리하는 경우도 ..
		reviews.add(one);
	}
	conn.close();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
</head>
<body>
	<h2>방명록</h2>
	<p>
		이곳을 방문했던 사람들이 남긴 메세지들입니다.
	</p>	
	<%if(reviews.isEmpty()) {%>
	<p>
		아직 남겨진 리뷰가 존재하지 않습니다. 당신이 첫 주인공이 되시는건 어떨가요?
	</p>
	<%}else { %>
		<b>총 <%=reviews.size() %>건의 의견이 남겨져 있습니다.</b>
	<ul>
		<%for(Review o : reviews) {%>
			<li><%=o.message() %> (<%=o.score() %>점) 
			 	<small style="color: #555">from <%=o.writer() %></small>
			</li>
	
		<%} %>
	</ul>
	<%} %>
</body>
</html>

