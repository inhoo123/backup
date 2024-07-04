<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>errorPage</title>
</head>
<body>
	<div style="text-align: center">
		<p>
			데이터 처리 중에 오류가 발생하였습니다. 잠시 뒤 다시 시도해주세요.
			<a href="<%=request.getContextPath()%>/baseball/ready.jsp"> 잠시
			뒤 다시 시도해주세요.</a>
		</p>



	</div>

</body>
</html>
