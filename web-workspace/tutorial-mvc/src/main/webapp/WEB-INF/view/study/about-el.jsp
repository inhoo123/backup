<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tutorial-MVC</title>
</head>
<body>
	<h2>EL Usage</h2>
	<p>데이터 출력을 할때 세팅된 객체가 Map이거나 VO 형 객체면 내부 속성을 접근할 수 있다.</p>
	<ul>
		<li>${pages.get('total')}|&{pages.total}</li>
		<li>${pages.get('start')}|&{pages.start}</li>
		<li>${pages.get('end')}|&{pages.end}</li>
	</ul>
		<p>EL 태그내에서 객체의 메서드를 호출하는건비추천</p>
	<ul>
	<li>${soldier.sn } | ${solder.getSn()}</li>
	<li>${solder.name } |${solder.getName()} </li>
	<li>${solder.type } |${solder.getType()}</li>
	</ul>
	<ul>
		<li>${student.name } | ${student['name'] }</li>
		<li>${student.bn }</li>
		<li>${student.major }</li>
	</ul>	
	<p>
		데이터 출력을 할때 세팅된 객체가 배열이나 List 형 객체여도 출력을 지원한다.
	</p>
	<ul>
		<li>${category[0] }</li>
		<li>${students[0].name }</li>
	</ul>
	
</body>
</html>