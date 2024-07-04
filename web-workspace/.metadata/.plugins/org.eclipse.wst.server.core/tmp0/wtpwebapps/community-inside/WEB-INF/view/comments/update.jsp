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
		<h1 style="font-weight: bold">댓글수정</h1>
		<div>
			<form
				action="${pageContext.servletContext.contextPath }/comment-update-handle"
				method="post">
				<input type="hidden" name="postNo" value="${post.no }" /> <input
					type="hidden" name="no" value="${comment.no }" />
				<table style="border-collapse: collapse; width: 100%">
					<tr style="border: 1px solid #ccc; width: 100%">
					</tr>
					<tr>
						<td style="border: 1px solid #ccc; padding: 12px;" colspan="2">
							<textarea name="body"
								style="height: 200px; resize: none; width: 100%; box-sizing: border-box; padding: 6px 10px; border: 1px solid #ccc">${comment.body }</textarea>
						</td>

					</tr>
				</table>
				<button type="submit">변경</button>
			</form>
		</div>
	</div>
</body>
</html>