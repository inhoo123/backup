<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="/built-in/error.jsp"%>
<%
	int code = application.hashCode();
	String id = Integer.toString(code, 16);
	application.log("로그 테스트");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application :: <%=application.getInitParameter("title") %></title>
</head>
<body>
	<h2>ServletContext application</h2>
	<p><%=id%></p>
	<p>application 이라는 내장객체는 ServletContext 객체로, 웹 어플리케이션 전반에 걸친 정보 및
		설정을 확인하거나 변경하고자 할 때 사용되는 객체이다. 이 application 객체는 서버가 이 웹 어플리케이션을 부여되는
		객체이다</p>
	<p>JSP에서는 빌트인 객체로 잡혀있지만, 확보할 수 있는 방법은 그것말고도 몇가지가 있다.</p>
	<ul>
		<li>request.getServletContext() : <%=application == request.getServletContext()%></li>
		<li>session.getServletContext() : <%=application == session.getServletContext()%></li>
	</ul>
	<p>application 객체를 이용해서 프로젝트의 설정 자체를 변경하는 작업은 보통 하지 않고, 특정 메서드만 주로
		사용하게 된다.</p>
	<h4>로깅 관련 메서드</h4>
	<li>log(String message):로그 남길때 사용</li>
	<li>log(String message,Throwable t)</li>
	<h4>서버 정보 관련 메서드</h4>
	<ul>
		<li>getServerInfo() : <%=application.getServerInfo() %>:WAS 이름과
			버전
		</li>
		<li>getContextPath():<%=application.getContextPath() %>: 웹
			어플리케이션의 컨텍스트 패스
		</li>
	</ul>
	<h4>컨텍스트 초기 파라미터 관련 메서드</h4>
	<ul>
		<li>getInitParameter(String name) : <%=application.getInitParameter("title") %></li>
		<li><del>getInitParameterNames() : 모든 컨텍스트 초기 파라미터의 이름을 반환 (Enumeration)</del></li>
	</ul>
	<h4>저장소 관련 메서드</h4>
	<ul>
		<li>setAttribute(String name, Object object) : 데이터 저장</li>
		<li>getAttribute(String name) : 데이터 읽기</li>
		<li>removeAttribute(String name) : 데이터 삭제</li>
	</ul>
</body>
</html>
