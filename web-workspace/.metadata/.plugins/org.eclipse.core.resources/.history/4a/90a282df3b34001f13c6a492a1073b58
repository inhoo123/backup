package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.PostDao;
import model.vo.Post;

@WebServlet("/index")
public class IndexController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			// =======================카테고리=======================================

//			PostDao postDao = new PostDao();
//			Post categorys = (Post) postDao.findByCategroyPosts(category);
//			request.setAttribute("categorys", categorys);
			// =======================================================================
				request.getRequestDispatcher("/WEB-INF/view/index.jsp").forward(request, response);
			

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
