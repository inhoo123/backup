package controller.posts;

import java.io.IOException;
import java.sql.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.PostDao;
import model.vo.Post;
import model.vo.User;

@WebServlet("/write-handle")
public class PostWriteHandleController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		try {
			
			User authUser = (User) request.getSession().getAttribute("authUser");

			//로그인 안되있으면 로그인으로 보냄
			if (authUser == null) {
				response.sendRedirect(request.getContextPath() + "/login");
				return;
			}
			
			String category = request.getParameter("category");
			String title = request.getParameter("title");
			String body = request.getParameter("body");
			String writerId = authUser.getId();
			PostDao postDao = new PostDao();
			Post one = new Post(0, category, title, body, writerId, new Date(System.currentTimeMillis()), 0, 0, 0);
			System.out.println(one);
			
			
			boolean r = postDao.save(one);
			
			if (r) {
				response.sendRedirect(request.getContextPath()+"/list");
			} else {
				response.sendRedirect(request.getContextPath()+ "/write");
			}
				

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
