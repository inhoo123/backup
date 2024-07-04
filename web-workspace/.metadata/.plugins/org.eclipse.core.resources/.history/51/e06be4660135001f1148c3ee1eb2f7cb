<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="conatiner text-center" style="margin-top: 100px">
		<h1 style="font-weight: bold">게시글수정</h1>
		<div>
			<form
				action="${pageContext.servletContext.contextPath }/update-handle" method="post">
				<input type="hidden" name="no" value="${post.no }"/>
				<table style="border-collapse: collapse; width: 100%">
					<tr style="border:1px solid #ccc; width: 100%">					
					</tr>
					<tr>
						<td
							style="border: 1px solid #ccc; padding: 12px; text-align: center; background-color: #eee"><span
							style="color: red">*</span>제목</td>
						<td style="border: 1px solid #ccc; padding: 12px;"><input
							name="title" type="text" value ="${post.title }"
 							style="padding: 6px 10px; width: 500px; border: 1px solid #ccc" /></td>
					</tr>
					<tr>
						<td style="border: 1px solid #ccc; padding: 12px;" colspan="2">
							<textarea name="body" 
								style="height: 200px; resize: none; width: 100%; box-sizing: border-box; padding: 6px 10px; border: 1px solid #ccc">${post.body }</textarea>
						</td>

					</tr>
				</table>
				<button type="submit">변경</button>
			</form>
		</div>
	</div>
</body>
</html>