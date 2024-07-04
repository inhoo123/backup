<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${post.title }</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/style.css?<%=System.currentTimeMillis() %>" />
</head>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/style.css?<%=System.currentTimeMillis() %>" />
<body>

	<%@ include file="/WEB-INF/view/common/header.jsp"%>
	<div>
		<div class="container px-1">
			<div style="text-align: left;">
				<span style="color: #3b4890; font-weight: 750;"><h2>${post.category }
						갤러리</h2></span>
				<hr width="100%" color="#3b4890" size="3">
				<p style="font-weight: 750;">${post.title }
				<p>
				<div style="text-align: right">
					<span style="color: #777"></span> <span>${writer.name}</span> | <small><span
						style="color: #777"></span> <span>${post.writedAt}</span></small> <span
						style="text-align: right;">조회</span> <span>${post.viewCount}</span>
					<span style="text-align: right;">추천</span> <span>${post.likes}</span>
				</div>
				<hr style="border: 0; height: 1px; background: #bbb;">
				<div class="top">
					<h3
						style="text-align: left; margin-bottom: 8px; border-bottom: 1px solid #ccc; padding: 8px;">${ post.body}</h3>
				</div>
				<div style="padding: 4px; text-align: right;"></div>
			</div>
			<div style="text-align: left;">
				<a href="${pageContext.servletContext.contextPath}/list"
					class="no-deco-link"><button>목록</button></a>
			</div>
			<p></p>
			<div style="text-align: right;">

				<c:choose>
					<c:when
						test="${post.writerId != null &&	post.writerId eq sessionScope.authUser.id }">
						<a
							href="${pageContext.servletContext.contextPath}/delete-handle?no=${post.no}"
							class="no-deco-link">
							<button>삭제</button>
						</a>

						<a
							href="${pageContext.servletContext.contextPath}/update?no=${post.no}"

							class="no-deco-link">
							<button>수정</button>
						</a>
					</c:when>
				</c:choose>
			</div>
			<p>전체 댓글</p>
			<hr width="100%" color="#3b4890" size="3">
			<div>

				<c:forEach items="${comments }" var="one">
					<div
						style="border-top: 1px solid #eee; border-bottom: 1px solid #eee; display: flex; padding: 4px 0px;">
						<div style="flex: 2; color: #777">${one.writerId}</div>
						<div style="flex: 8">${one.body }</div>
						<div
							style="flex: 2; color: #999; font-size: small; text-align: right;">
							<fmt:formatDate value="${one.writedAt }" pattern="MM.dd HH:mm:ss" />
						</div>
						<c:choose>
							<c:when
								test="${post.writerId != null &&	post.writerId eq sessionScope.authUser.id }">
								<a
									href="${pageContext.servletContext.contextPath}/commentdelete-handle?no=${one.no}"
									class="no-deco-link">
									<button>삭제</button>
								</a>
							</c:when>
						</c:choose>
					</div>
				</c:forEach>
			</div>
			<div class="comment-section">
				<form style="border: 1px solid #ccc; padding: 12px;"
					action="${pageContext.servletContext.contextPath}/submit-comment"
					method="post">
					<input type="hidden" name="postNo" value="${post.no }" />
					<div style="display: flex; gap: 10px;">
						<div>
							<c:choose>
								<c:when test="${authUser == null }">
									<div style="margin-bottom: 4px;">
									<input name="writerId" type="text"
										style="padding: 6px 10px; width: 100px; border: 1px solid #ccc"
										placeholder="닉네임" required />
									</div>
									<div >
									<input name="password" type="password"
										style="padding: 6px 10px; width: 100px; border: 1px solid #ccc"
										placeholder="비밀번호" required />
									</div>
								</c:when>
								<c:otherwise>
								${post.writerId}
								</c:otherwise>
							</c:choose>
						</div>
						<div style="flex: 1">
							<textarea
								style="padding: 6px 10px; height: 100px; width: 100%; border: 1px solid #ccc; resize: none"
								name="body" placeholder="내용을 입력하세요" required></textarea>
						</div>
					</div>
					<div style="text-align: right">

						<button type="submit"
							style="padding: 6px; background-color: #3b4890; color: white; cursor: pointer; width: 70px;">등록</button>
					</div>

				</form>
			</div>
		</div>
	</div>

</body>
</html>
