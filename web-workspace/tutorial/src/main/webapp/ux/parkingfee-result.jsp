<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="./parkingfee-error.jsp"%>
<%
int time = Integer.parseInt(request.getParameter("time"));
String use = request.getParameter("yes");

/*
  	무료회차 :30분 / 기본 30분 :1500, 10분당 500원, (열차이용객 30% 할인)
*/
int fee = 0;
int sale = 0;
if (time > 30) {
	fee = 0;
} else {
	fee = 1500;
	int overTime = (time - 30);
	fee += overTime / 10 * 500 + (overTime % 10 > 0 ? 500 : 0);
}
if (use.equals("yes")) {
	sale = (int)(fee * 0.3);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주차요금 계산</title>
</head>
<body>
	<h2>주차요금 계산결과</h2>
	<p>
		총 이용시간 <b><%=time%></b> 분에 해당하는 요금은 <b><%=fee%></b>입니다. 열차사용 할인금액<%=sale%>=
		최종 금액
		<%=fee - sale%>
	</p>


</body>
</html>