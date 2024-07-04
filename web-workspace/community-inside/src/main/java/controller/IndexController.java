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
			int p = request.getParameter("p") == null ? 1 : Integer.parseInt(request.getParameter("p"));
			int size = 10; // 페이지당 표시할 개수
			int start = size * (p - 1) + 1;
			int end = size * p;
			
			PostDao postDao = new PostDao();
			int count = postDao.countAll();
			int totalPages = count/size + (count%size >0 ? 1: 0); 
			
		
			request.setAttribute("post", postDao.findAll3(start, end));
			request.setAttribute("totalPages", totalPages);
			request.setAttribute("currentPage",  p);
			request.getRequestDispatcher("/WEB-INF/view/index.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
