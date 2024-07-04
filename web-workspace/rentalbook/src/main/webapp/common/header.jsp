<%@page import="rentalbook.vo.User"%>
<%@page import="rentalbook.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%


boolean headerAuth = (boolean)session.getAttribute("auth");
String headerAuthUserId = (String)session.getAttribute("auth_user_id");

UserDao headerUserDao = new UserDao();
User headerAuthUser = headerUserDao.findByUserId(headerAuthUserId);

%>
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/common/style.css" />
<%-- header include  --%>
<div style="padding: 8px;">
	<%-- banner / login & join shortcut / search --%>
	<div
		style="display: flex; align-items: center; justify-content: space-between;">
		<%--banner  --%>
		<div>
			<h2>
				<a style="text-decoration-line: none; color: black;"
					href="<%=application.getContextPath()%>/index.jsp">&#128214;도서관</a>
			</h2>
		</div>
		<%-- search --%>
		<div>
			<input type="text" style="padding: 8px; font-size: 14pt;"
				placeholder="... .. ." class="srch-bar" />
		</div>
		<%-- login & join shortcut --%>
		<%
		if (!headerAuth) {
		%>
		<div>
			<a href="<%=application.getContextPath()%>/member/login.jsp"
				class="no-deco-link fs-small">Login</a> <a
				href="<%=application.getContextPath()%>/member/join.jsp"
				class="no-deco-link fs-small">Register</a>
		</div>
		<%
		} else {
		%>
		<div>
			<a href="<%=application.getContextPath()%>/member/logout.jsp"
				class="no-deco-link fs-small">&#128275; Logout</a> <a
				href="<%=application.getContextPath()%>/mylib/modify.jsp"
				class="no-deco-link fs-small">&#128269; Account</a>
		</div>
		<%
		}
		%>
		<%-- shortcut  링크 --%>
		</div>
		<div style="display: flex; align-items: center; justify-content: space-around;">
		<div><a href="" class="no-deco-link fs-large">도서관소개</a></div>
		<div><a href="<%=application.getContextPath() %>/book/search.jsp" class="no-deco-link fs-large">도서 검색</a></div>
		<div><a href="<%=application.getContextPath() %>/feed/list.jsp" class="no-deco-link fs-large">열린공간</a></div>
		<div><a href="<%=application.getContextPath() %>/mylib/favorites.jsp" class="no-deco-link fs-large">찜 목록</a></div>
	</div>
</div>