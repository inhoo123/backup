<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>parking-fee</title>
</head>
<body>
	</div>
	<div style="text-align: center">
		<form action="./parkingfee-result.jsp">
			<p>
				이용시간<br /> 시간(time): <input type="number"
					style="text-align: center" name="time" />

			</p>
			열차 사용유무<br />
			<%----1.type radio 는 name 이 같은 radio 들끼리 그룹처리된다.
				  2. radio 계열은 별도의 value 지정을 해줘야 구분된다.	
			 --%>
			<input type="radio" name="use" value="yes">예
			<input type="radio" name="use" value="no" />아니요
			<p>
				<button type="submit">결과보기</button>
				<button type="reset">초기화</button>
			</p>
		</form>
	</div>
</body>
</html>