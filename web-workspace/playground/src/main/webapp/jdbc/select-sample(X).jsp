<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="oracle.jdbc.datasource.impl.OracleDataSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
OracleDataSource ods = new OracleDataSource();
ods.setURL("jdbc:oracle:thin:@//3.36.66.249:1521/xe");
ods.setUser("playground");
ods.setPassword("oracle");

Connection conn = ods.getConnection();

PreparedStatement stmt = conn.prepareStatement("SELECT * FROM RANKS");

//SELECT statement 는 executeQuery() 
ResultSet rs = stmt.executeQuery();
//boolean nest(): 현재 로우 기준 그다움 row로 이동하면서 데이터가 있다면 true,아니면 false
// 해당 row에서 데이터를 뽑아내고자 한다면
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>select-sample(X).jsp
	<h2>전체 랭킹 데이터</h2>
<%int cnt =0;
  while (rs.next()) {
		cnt++;
		String ip = rs.getString("ip"); // 컬럼명 혹은 컬럼인덱스를 줘도 된다.
		int turn = rs.getInt("turn");
		double elapsed = rs.getDouble(3);%>
	<p><%=ip%>(<%=turn%>)<%=elapsed%>sec</p>
<%}%>
</body>
</html>