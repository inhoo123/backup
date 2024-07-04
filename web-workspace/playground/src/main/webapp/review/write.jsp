<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>안녕</title>
</head>
<body>
	<h2>방명록</h2>

	<form action="<%=application.getContextPath() %>/review/write-result.jsp">
		<p>
			 <input type="text" style="text-align: center" name="writer" placeholder="작성자..." />
		</p>
		<p>
			 <input type="text" style="text-align: center" name="message" placeholder="어..엄.."/>
		</p>
		<p>
			스코어 1~5점: <input type="number" style="text-align: center;" name="score" />
		</p>
		<img alt="" src="data:image/jpeg;base64,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">
		<p>
			<button type="submit">결과보기</button>
			<button type="reset">초기화</button>
		</p>

	</form>
</body>
</html>