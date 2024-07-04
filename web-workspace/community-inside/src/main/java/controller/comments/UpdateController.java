package controller.comments;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.CommentDao;
import model.dao.PostDao;
import model.vo.Comment;

@WebServlet("/comment-update")
public class UpdateController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			PostDao postDao = new PostDao();
			CommentDao commentDao = new CommentDao();

			int postNo = (Integer.parseInt(request.getParameter("postNo")));
			int no = (Integer.parseInt(request.getParameter("no")));
			String body = request.getParameter("body");
   
			request.setAttribute("post", postDao.findByNo(postNo));
			request.setAttribute("comment", commentDao.findByNo(no));
			request.getRequestDispatcher("/WEB-INF/view/comments/update.jsp").forward(request, response);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
