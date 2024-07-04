
<%@page import="rentalbook.vo.Book"%>
<%@page import="java.util.List"%>
<%@page import="rentalbook.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String sort = request.getParameter("sort") == null ? "title" : request.getParameter("sort");

BookDao bookDao = new BookDao();
List<Book> books = null;
String mode = null;

if (sort.equals("title")) {
	books = bookDao.findAll();
	mode = "도서명순(가나다순)";
} else if (sort.equals("rentalCnt")) {
	books = bookDao.findAllOrderByRentalCnt();
	mode = "대여회수순";
} else if (sort.equals("bookId")) {
	books = bookDao.findAllOrderByBookId();
	mode = "최신순";
}
// 전체 페이지 수 계산하고 
int pageSize = 9;
int lastP = books.size() / pageSize + (books.size() % pageSize > 0 ? 1 : 0);

int p = request.getParameter("p") == null ? 1 : Integer.parseInt(request.getParameter("p"));
// 데이터 몇개씩 묶음처리 할꺼냐에 계산이 달라짐. 10개씩 처리한다고 가정

int fromIndex = (p - 1) * pageSize;
int toIndex = p * pageSize;
// toIndex 만약 어떤 상태라면 이걸 마지막 인덱스번호+1 로 바꿔야한다.	
if (p == lastP) {
	toIndex = books.size();
}
List<Book> extractBooks = books.subList(fromIndex, toIndex);

int blockEnd = (int) Math.ceil(p / 10.0) * 10;
int blockStart = blockEnd - 9;

blockEnd = (blockEnd > lastP) ? lastP : blockEnd;
int length = blockEnd - blockStart;
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
		<h2>도서검색</h2>
		<div class="breadcrumb">
			도서검색 &gt; <span><%=mode%></span>
		</div>
		<div class="feed-count">
			전체
			<%=books.size()%>
			개가 검색되었습니다.
		</div>
		<div class="sort-options">
			<div>
				<a
					href="<%=application.getContextPath()%>/book/search.jsp?sort=title"
					class="no-deco-link">도서명순</a> | <a
					href="<%=application.getContextPath()%>/book/search.jsp?sort=rentalCnt"
					class="no-deco-link">대여회수순</a> | <a
					href="<%=application.getContextPath()%>/book/search.jsp?sort=bookId"
					class="no-deco-link">최신순</a>

			</div>
		</div>
		<table class="default-table">
			<thead>
				<tr class="border-bottom">
					<th style="width: 20%"></th>
					<th>도서명</th>
					<th style="width: 10%">분류</th>
					<th style="width: 10%">대여횟수</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Book one : extractBooks) {
				%>
				<tr class="border-bottom">
					<td class="text-center"><img src="<%=one.image_url()%>"
						style="width: 130px; height: 180px;" /></td>
					<td><a
						href="<%=application.getContextPath()%>/book/view.jsp?bookId=<%=one.book_id()%>"
						class="no-deco-link"> <%=one.title()%>
					</a></td>
					<td class="text-center"><%=one.category_name()%></td>
					<td class="text-center"><%=one.rental_cnt()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<div class="pagination">
			<%
			if (blockStart == 1) {
			%>
			<span style="color: #ddd">&lt;</span>
			<%
			} else {
			%>
			<a
				href="<%=application.getContextPath()%>/book/search.jsp?p=<%=blockStart - 1%>">&lt;</a>
			<%
			}
			%>

			<%
			for (int i = blockStart; i <= blockEnd; i++) {
			%>
			<%
			if (i != p) {
			%>
			<a href="<%=application.getContextPath()%>/book/search.jsp?p=<%=i%>"><%=i%></a>
			<%
			} else {
			%>
			<b><%=i%></b>
			<%
			}
			%>
			<%
			}
			%>

			<%
			if (blockEnd < lastP) {
			%>
			<a
				href="<%=application.getContextPath()%>/books/search.jsp?p=<%=blockEnd + 1%>">&gt;</a>
			<%
			} else {
			%>
			<span style="color: #ddd">&gt;</span>
			<%
			}
			%>
		</div>
	</div>
</body>
</html>






