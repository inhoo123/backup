<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>book</title>
</head>
<body>
	<h2 style="text-align: center;">&#128213;책 정보 입력</h2>

	<form action="<%=application.getContextPath() %>/book/add-book-handle.jsp"style="text-align: center;">
		<p>
			 <input type="text" style="text-align: center" name="title" placeholder="제목.." />
		</p>
		<p>
			 <input type="text" style="text-align:center" name="author" placeholder="저자.."/>
		</p>
		<p>
			 <input type="text" style="text-align:center" name="publisher" placeholder="출판사.."/>
		</p>
		<p>
			 <input type="text" style="text-align:center" name="status" placeholder="최상/상/중"/>
		</p>
		<p>
			 <input type="number" style="text-align:center" name="price" placeholder="원래가격" />
		</p>
		<p>
			 <input type="number" style="text-align:center" name="discountPrice" placeholder="할인가격" />
		</p>
			<button type="submit">결과보기</button>
			<button type="reset">초기화</button>

	</form>
</body>
</html>