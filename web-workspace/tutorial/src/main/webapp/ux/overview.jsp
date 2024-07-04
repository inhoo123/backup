<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상호작용</title>
</head>
<body>
	<h2>사용자와 웹 앱간의 상호작용</h2>
	<p>사용자로 부터 요청이 발생하였을 때, 같이 전달된 데이터들은 request 객체를 이용해서 얻어낼수 있고, 이걸
		토대로 요청을 분석해서 적절한 응답을 보내줄 수 있는 페이지 구축이 가능</p>
	<p>웹 앱 개발을 할 때는 데이터 처리 페이지만 만들어두면 사용자가 이 웹앱을 쓰는데 있어 불편함을 느낄 수 밖에없음
	</p>
	<p>사용자 서버측에서 제공하는 웹과 상호작용을 편하게 하려면 사용자용 요청 화면도 구현을 해야한다. 이 화면을
		구현하는데 사용되는 태그가 a 태그와 form 태그 이다.</p>
	<h4>a (anchor)태그</h4>
	<p>
		링크를 만들어 내는 태그로 사용자가 우리측의 웹 페이지를 쉽게 이동할 수 있게 해줌으로서 사용자가 경험을 향상시켜주는 중요한
		태그이다. 추천 검색어 <a href="./serch-result.jsp?subject=page">페이지</a> <a
			href="./serch-result.jsp?subject=include">인쿨르드</a>
			 <a href="./serch-result.jsp?subject=taglib">태그립</a>
	</p>
	<h4>form (form) 태그</h4>
	<p>form 태그는 사용자 입력한 데이터를 서버로 전송하는 기능을 갖고 있는 아주 중요한 태그이다.</p>
	<form action="./search-result.jsp">
		<p>
			입력<input type="text" name="subject" /> 
			<input type="password"name="sublject" />
			<input type="button"name="sublject" />
	<select name="os">
	<option>window</option>
	<option>mac</option>
	<option>Linux</option>
	</select>
		</p>
		
		<p>
			<button type="button">button</button>
			<button type="reset">리셋</button>
			<button type="submit">제출</button>
		</p>
	</form>
	<p>
		form 태그에는 action 설정이 들어가야 한다.action 으로 설정한 곳으로 데이터가 전송된다.
		form 태그자체는 전송능만 있기 때문에 입력용 태그를 form 태그 소속으로 작성해두어야 한다.
		입력용 태그는 종류가 꽤 많음.(w3school 참조)
	</p>
</body>
</html>