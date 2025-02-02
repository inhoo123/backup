package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.PostDao;
import model.vo.Post;

@WebServlet("/update-handle")
public class UpdateHandleController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			PostDao postDao = new PostDao();
			int no = Integer.parseInt(request.getParameter("no"));
			Post post = postDao.findByNo(no);
			String title = request.getParameter("title");
			String body = request.getParameter("body");
			// (int no, String writerId, String title, String body, Date writedAt, int
			// readCnt) //
			
			Post one = new Post(post.getNo(), post.getCategory(), title, body, post.getWriterId(), post.getWritedAt(),
					post.getViewCount(), 0, 0);

			boolean r = postDao.update(one);
			if (r) {
				response.sendRedirect(request.getContextPath() + "/posts/view?no=" + no);
			} else {
				response.sendRedirect(request.getContextPath() + "/error");
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
