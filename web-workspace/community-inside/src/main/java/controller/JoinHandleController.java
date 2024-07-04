package controller;

import java.io.IOException;
import java.sql.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.UserDao;
import model.vo.User;


@WebServlet("/join-handle")
public class JoinHandleController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String passwordCheck = request.getParameter("password_check");
		String ip = request.getRemoteAddr();
		String code = request.getParameter("code");
		String name = request.getParameter("name");
		UserDao userDao = new UserDao();
		
		if (id.isBlank() || password.isBlank() || passwordCheck.isBlank() || !password.equals(passwordCheck)) {
			response.sendRedirect(request.getContextPath()+"/join");
			return;
		}
		
		boolean result = false;
		try {
			User exist = userDao.findById(id);
			if(exist == null) {
				User one = new User(id,password,new Date(System.currentTimeMillis()), ip,code, name );
				result = userDao.save(one);
			}
		}catch(Exception e) {
			System.out.println(e);
		}	
		if(result) {
			response.sendRedirect(request.getContextPath()+"/index");
		}else {
		response.sendRedirect(request.getContextPath()+"/join");
		}
	}

}
