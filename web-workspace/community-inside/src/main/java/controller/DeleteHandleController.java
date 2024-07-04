package controller;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.PostDao;
import model.vo.Post;
import model.vo.User;

@WebServlet("/delete-handle")
public class DeleteHandleController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		User authUser = (User) request.getSession().getAttribute("authUser");
		String authUserId = authUser.getId();
		int no = Integer.parseInt(request.getParameter("no"));

		PostDao postDao = new PostDao();
		
		Post found;
		
		try {
			found = postDao.findByNo(no);
			
		boolean result;
		
		
		
		if(found == null || found.getWriterId() == null || !found.getWriterId().equals(authUserId)) {
			result= false;
			
		}else {
			
			result = postDao.deleteByNo(no);
		
			
		}
		
		//=============================================================
		if(result) {
			response.sendRedirect(request.getContextPath() + "/list");
		}else {
			response.sendRedirect(request.getContextPath() + "/index");
	}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
}
}
