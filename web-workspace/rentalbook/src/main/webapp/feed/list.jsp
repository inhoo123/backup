<%@page import="rentalbook.vo.Feed"%>
<%@page import="java.util.List"%>
<%@page import="rentalbook.dao.FeedDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
FeedDao feedDao = new FeedDao();
List<Feed> feeds = feedDao.findAll();


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열린공간 | 동네도서관</title>
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/common/style.css" />
<link rel="icon" href="<%=application.getContextPath()%>/favicon.ico" />
</head>
<body>
    <%@ include file="/common/header.jsp"%>
    <div class="container">
        <h2>의견들</h2>
        <div class="breadcrumb">
            열린공간 &gt; <span>의견들</span>
        </div>
        <div class="feed-count">
            총 <%=feeds.size()%> 건의 의견이 등록되어 있습니다.
        </div>
        <table class="default-table">
            <thead>
                <tr class="border-bottom">
                    <th style="width: 10%">번호</th>
                    <th style="width: 40%">제목</th>
                    <th style="width: 20%">글쓴이</th>
                    <th style="width: 20%">등록일</th>
                    <th style="width: 10%">조회</th>
                </tr>
            </thead>
            <tbody>
                <%
                for (Feed one : feeds) {
                %>
                <tr class="border-bottom">
                    <td><%=one.no() %></td>
                    <td>
                        <a href="<%=application.getContextPath()%>/feed/view.jsp?no=<%=one.no() %>" class="no-deco-link">
                            <%=one.title() %>
                        </a>
                    </td>
                    <td><%=one.writerId() %></td>
                    <td><%=one.writedAt() %></td>
                    <td><%=one.readCnt() %></td>
                    
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
        <div style="margin-top: 10px; text-align: right;">
            <a href="<%=application.getContextPath()%>/feed/write.jsp" class="btn-write">
                의견쓰기
            </a>
        </div>
    </div>
</body>
</html>

