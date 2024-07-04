<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:choose>
	<c:when test="${empty title }">
		<title>핏투게더</title>
	</c:when>
	<c:otherwise>
		<title>${title }::핏투게더</title>
	</c:otherwise>
</c:choose>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/style.css?<%=System.currentTimeMillis() %>" />
</head>
<body>
	<%@ include file="/WEB-INF/view/common/header.jsp"%>
	<div class="container px-1">
		<h1 class="my-2">"${param.q }" 검색결과 </h1>
		
		<table class="default-table">
				<thead>
					<tr class="border-bottom">
				
						<th style="width: 10%">번호</th>
						<th>제목</th>
						<th style="width: 10%">글쓴이</th>
						<th style="width: 15%">작성일</th>
						<th style="width: 10%">조회</th>
						<th style="width: 10%">추천</th>

					</tr>
				</thead>
				<tbody>
						<c:forEach items="${foundPosts}" var="one" >
							<tr style="border-bottom: 1px solid #ddd; height: 30px;">


								<td style="text-align: center;"><a
									href="${pageContext.servletContext.contextPath }/posts/view?no=${one.no}"
									class="no-deco-link">${one.no } </a></td>
								<td><a
									href="${pageContext.servletContext.contextPath }/posts/view?no=${one.no}"
									class="no-deco-link">${one.title } </a></td>
								<td class="text-center">${one.writerId}</td>
								<td class="text-center">${one.writedAt}</td>
								<td class="text-center">${one.viewCount}</td>
								<td class="text-center">${one.likes}</td>
							

							</tr>
						</c:forEach>
					
				</tbody>

			</table>
		
	</div>
</body>
</html>