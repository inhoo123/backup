<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="dchead">

	<!-- links -->
	<div style="display: flex; justify-content: flex-end; gap: 2px;">
		<c:choose>
			<c:when test="${sessionScope.authUser == null }">
				<div >
					<a href="${pageContext.servletContext.contextPath }/login"
						><small style="padding: 5px; background-color: #3b4890; color: white; cursor: pointer; width: 50px;">로그인</small></a>
				</div>
			</c:when>
			<c:otherwise>
				<div>	
						<small>${sessionScope.authUser.name }님</small>  <a
						href="${pageContext.servletContext.contextPath }/logout"
						> <small style="padding: 5px; background-color: #3b4890; color: white; cursor: pointer; width: 50px;">로그아웃</small></a>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<!-- logo & searchbar -->
	<div
		style="display: flex;  gap: 20px;">

		<a href="${pageContext.servletContext.contextPath }/index"> <img
			src="${pageContext.servletContext.contextPath }/image/inside.png"
			style="border: 1px solid black; padding: 7px; width: 150px; background-color: white; border-radius: 32px;" />
		</a>
		<div >
					<form action="${pageContext.servletContext.contextPath }/search/view">
						<input class="search" type="text" placeholder="갤러리 & 통합검색" name="q"
							style="width: 300px; height:45px;" value="${param.q }" />
					</form>
		</div>


	</div>
</div>
<div class="gnb_bar">
<div class="container px-1">
<div style="text-align: left; margin-left: 80px;">
	<a href="${pageContext.servletContext.contextPath }/list"
		><span style="color:white;  font-weight: 550;">모든글</span></a>
	
	<a href="${pageContext.servletContext.contextPath }/list/category?category=운동"
		><span style="color:white;  font-weight: 550;">&emsp;&emsp;운동</span></a>
		
		
		<a href="${pageContext.servletContext.contextPath }/list/category?category=유머"
		><span style="color:white;  font-weight: 550;">&emsp;&emsp;유머</span></a>
		
		
		<a href="${pageContext.servletContext.contextPath }/list/category?category=축구"
		><span style="color:white;  font-weight: 550;">&emsp;&emsp;축구</span></a>
		
		
		<a href="${pageContext.servletContext.contextPath }/list/category?category=자유글"
		><span  style="color:white;  font-weight: 550;">&emsp;&emsp;자유글</span></a>
		</div>
		</div>
</div>
<!-- 네비게이션 -->

