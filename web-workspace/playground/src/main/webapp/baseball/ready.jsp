<%@ page import="model.Rank"%>
<%@ page import="model.GameResult"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// application setting

	List<Rank> ranks = (List<Rank>)application.getAttribute("ranks");
	Rank top = ranks.size() >=1 ? ranks.get(0) : null;
	
	// client setting
	int[] target = new int[3];
	List<Integer> list = new ArrayList<>();
	while (list.size() < 3) {
		int p = (int) (Math.random() * 10);
		if (!list.contains(p)) {
			list.add(p);
		}
	}
	System.out.println("list=="+list);
	
	for (int i = 0; i < list.size(); i++) {
		target[i] = list.get(i).intValue();
		
	}
	
	
	session.setAttribute("target", target);
	session.setAttribute("history", new ArrayList<GameResult>());
	session.setAttribute("startTime", System.currentTimeMillis());
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숫자야구</title>
</head>
<body>
	<div style="text-align: center;">
		<h1>숫.자.야.구</h1>
		<p>임의의 3자리 숫자를 맞추는 게임입니다. 제시한 숫자에 따라 힌트가 제공됩니다.</p>
		<p>
			숫자는 맞지만 위치가 틀렸을 때는 <b>볼</b>
		</p>
		<p>
			숫자와 위치가 전부 맞으면 <b>스트라이트</b>
		</p>
		<p>
			제시한 숫자가 전부 틀리면 <b>아웃</b>
		</p>
		<p>
			<a href="<%=request.getContextPath()%>/baseball/game.jsp">준비되셨나요?
			</a>
		</p>
		<%if(top != null) { %>
		<p>
			최고 기록 : <%=top.getTurn() %> (<%=top.getElapsed() %> ms) <small><%=top.getIp() %></small>
		</p>
		<%}else { %>
		<p>
			아직 기록된 랭크정보가 없습니다. 
			<b style="color: red; font-size: 18pt;">빠르게 도전해보세요!</b>
		</p>
		<%} %>
	</div>
</body>
</html>
