<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="dchead">

	<!-- links -->
	<div style="display: flex; justify-content: flex-end; gap: 2px;">
		<c:choose>
			<c:when test="${sessionScope.authUser == null }">
				<div>
					<a href="${pageContext.servletContext.contextPath }/login"
						>로그인 <small>..</small></a>
				</div>
			</c:when>
			<c:otherwise>
				<div>
					<a href="${pageContext.servletContext.contextPath }/login"
						> ${sessionScope.authUser.name }님 </a> <a
						href="${pageContext.servletContext.contextPath }/login"
						> 로그아웃</a>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<!-- logo & searchbar -->
	<div class="center"
		style="display: flex; align-items: center; gap: 20px;">

		<a href="${pageContext.servletContext.contextPath }/index"> <img
			src="${pageContext.servletContext.contextPath }/image/inside.png"
			style="border: 1px solid black; padding: 5px; width: 150px; background-color: white; border-radius: 32px;" />
		</a>
		<div >
			<c:choose>
				<c:when test="${empty param.q }">
					<form action="${pageContext.servletContext.contextPath }/search">
						<input class="search" type="text" placeholder="갤러리 & 통합검색" name="q"
							style="width: 300px;" />
					</form>
				</c:when>
				<c:otherwise>
					<input type="text" style="width: 1500px;" value="${param.q }" />
				</c:otherwise>
			</c:choose>
		</div>


	</div>
</div>
<!-- 네비게이션 -->
<div class="gnb_bar">
	<a href="${pageContext.servletContext.contextPath }/posts/list"
		>갤러리 <small></small></a>
</div>

