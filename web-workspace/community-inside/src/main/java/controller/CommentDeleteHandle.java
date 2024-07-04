package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.CommentDao;
import model.dao.PostDao;
import model.vo.Comment;
import model.vo.Post;
import model.vo.User;

@WebServlet("/commentdelete-handle")
public class CommentDeleteHandle extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User authUser = (User) request.getSession().getAttribute("authUser");
		String authUserPassword = authUser.getPassword();
		int no = Integer.parseInt(request.getParameter("no"));
		CommentDao commentDao = new CommentDao();
		
		Comment found;
		
		try {	
			found = commentDao.findByNo(no);
		boolean result;
		
		
		
		if(found == null || found.getPassword() == null || !found.getPassword().equals(authUserPassword)) {
			result= false;
			
		}else {
			
			result = commentDao.deleteByNo(no);
		
			
		}
		
		//=============================================================
		if(result) {
			response.sendRedirect(request.getContextPath() + "/list");
		}else {
			response.sendRedirect(request.getContextPath() + "/error");
	}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
