package controller.posts;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.PostDao;


@WebServlet("/list")
public class PostListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int p = req.getParameter("p") == null ? 1 : Integer.parseInt(req.getParameter("p"));
			int size = 10; // 페이지당 표시할 개수
			int start = size * (p - 1) + 1;
			int end = size * p;
			
			PostDao postDao = new PostDao();
			int count = postDao.countAll();
			int totalPages = count/size + (count%size >0 ? 1: 0); 
			
			req.setAttribute("post", postDao.findAll());
			req.setAttribute("totalPages", totalPages);
			req.setAttribute("currentPage",  p);
			req.getRequestDispatcher("/WEB-INF/view/posts/list.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
