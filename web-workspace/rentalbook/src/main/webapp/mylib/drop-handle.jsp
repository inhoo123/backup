<%@page import="rentalbook.dao.FavoriteDao"%>
<%@page import="rentalbook.vo.Favorite"%>
<%@page import="rentalbook.vo.Feed"%>
<%@page import="java.util.List"%>
<%@page import="rentalbook.dao.FeedDao"%>
<%@page import="rentalbook.vo.User"%>
<%@page import="rentalbook.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 

String pwd = request.getParameter("u_pwd");

UserDao userDao = new UserDao();
String userId = (String) session.getAttribute("auth_user_id");

User found = userDao.findByUserId(userId);
if (!found.password().equals(pwd)) {
	response.sendRedirect(application.getContextPath() + "/mylib/drop.jsp?error=true");

} else {
	FeedDao feedDao = new FeedDao();
    
    
	List<Feed> feeds = feedDao.findByWriterId(userId);
	if (feeds.size() > 0) {
		for (Feed one : feeds) {
	boolean t = feedDao.setNullToWriterIdByNo(one.no());
		}
	}
	
    FavoriteDao favoriteDao = new FavoriteDao();
    List<Favorite>favorites=favoriteDao.findByUserId(userId);
    for(Favorite one : favorites){
     favoriteDao.deleteByUserId(userId);	
    }
    
	boolean r = userDao.deleteByUserId(userId);
	
	// 거의 실패할 가능성이 없기에 r 값을 확인하지 않을 것임.
	if(r) {
		response.sendRedirect(application.getContextPath()+"/member/logout.jsp");
	}else {
		response.sendRedirect(application.getContextPath()+"/mylib/drop.jsp?error=true");
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>