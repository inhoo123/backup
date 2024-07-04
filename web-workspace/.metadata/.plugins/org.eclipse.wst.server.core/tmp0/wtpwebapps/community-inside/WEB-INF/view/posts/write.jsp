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
		<h1 style="font-weight: bold">게시글쓰기</h1>
		<div>
			<form
				action="${pageContext.servletContext.contextPath }/write-handle" method="post">
				<table style="border-collapse: collapse; width: 100%">
					<tr style="border:1px solid #ccc; width: 100%">
						<td ><select name="category"
							class="p-3 fs-3 w-50 border-rounded">
								<option value="운동">운동</option>
								<option value="유머">유머</option>
								<option value="축구">축구</option>
								<option value="자유글">자유글</option>
								<!-- 필요한 카테고리 옵션을 추가하세요 -->
						</select></td>
					</tr>
					<tr>
						<td
							style="border: 1px solid #ccc; padding: 12px; text-align: center; background-color: #eee"><span
							style="color: red">*</span>제목</td>
						<td style="border: 1px solid #ccc; padding: 12px;"><input
							name="title" type="text"
							style="padding: 6px 10px; width: 500px; border: 1px solid #ccc" /></td>
					</tr>
					<tr>
						<td style="border: 1px solid #ccc; padding: 12px;" colspan="2">
							<textarea name="body"
								style="height: 200px; resize: none; width: 100%; box-sizing: border-box; padding: 6px 10px; border: 1px solid #ccc"></textarea>
						</td>

					</tr>
				</table>
				<button type="submit">보내기</button>
			</form>
		</div>
	</div>
</body>
</html>