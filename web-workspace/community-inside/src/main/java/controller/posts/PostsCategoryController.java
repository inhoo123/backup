package controller.posts;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.PostDao;
import model.vo.Post;

@WebServlet("/list/category")
public class PostsCategoryController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String category = req.getParameter("category");
			PostDao postDao = new PostDao();
			List<Post> posts = postDao.findByCategroyPosts(category);
			req.setAttribute("posts", posts);
			req.setAttribute("category", category);
			
			int p = req.getParameter("p") == null ? 1 : Integer.parseInt(req.getParameter("p"));
			int size = 10; // 페이지당 표시할 개수
			int start = size * (p - 1) + 1;
			int end = size * p;
			
			PostDao postDaos = new PostDao();
			int count = postDao.countAll();
			int totalPages = count/size + (count%size >0 ? 1: 0); 
			
			req.setAttribute("post", postDaos.findAll2(start, end));
			req.setAttribute("totalPages", totalPages);
			req.setAttribute("currentPage",  p);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		req.getRequestDispatcher("/WEB-INF/view/posts/category-list.jsp").forward(req, resp);

	}

}
