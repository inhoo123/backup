<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String line = request.getParameter("line");//? 뒷부분의 전체 문자열을 추출
System.out.println(line);
String[] lines = request.getParameterValues("line");
if(lines==null){
	//redirect 수신자는 브라우저가 될꺼기 때문에, 재 이동시켜야될 경로(위치)는 contextPath를 설정해서 보내
	response.sendRedirect(request.getContextPath()+"/example/triangle.jsp");
	return;
}
System.out.println(lines[0]+","+lines[1]+","+lines[2]);
int[] arr =new int[lines.length];
for(int i =0;i<lines.length;i++){
	arr[i] = Integer.parseInt(lines[i]);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삼각형의 조건</title>
</head>
<body>
	<h2>삼각형이 만들어질까?</h2>
<p>
 <%if(arr[0]<=arr[1]+arr[2]&&
 arr[1]<=arr[2]+arr[0]&&
 arr[2]<=arr[1]+arr[0]) {%>
 <b>삼각형이 될수있습니다.</b> <%}else{ %>
 <b>이선들은 삼각형이될 수 없습니다.</b><%} %>
 </p>
 </body>
 </html>