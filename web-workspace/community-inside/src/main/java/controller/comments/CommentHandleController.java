package controller.comments;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.CommentDao;
import model.vo.Comment;
import model.vo.User;

@WebServlet("/submit-comment")
public class CommentHandleController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User authUser = (User) request.getSession().getAttribute("authUser");
		try {
			if (authUser != null) {
				String authUserPassword = authUser.getPassword();
				String body = request.getParameter("body");
				int postNo = Integer.parseInt(request.getParameter("postNo"));
				String writerId = authUser.getId();

				CommentDao commentDao = new CommentDao();
				Comment one = new Comment();
				one.setBody(body);
				one.setWritedAt(new Date(System.currentTimeMillis()));
				one.setWriterId(writerId);
				one.setPassword(authUserPassword);
				one.setPostNo(postNo);

				boolean r = commentDao.save(one);
				List<Comment> comments = commentDao.findAllByPostNo(postNo);
				request.setAttribute("comments", comments);
				if (r) {
					response.sendRedirect(request.getContextPath() + "/posts/view?no=" + postNo);
				}
			} else {
				String writerId = request.getParameter("writerId");
				String body = request.getParameter("body");
				String password = request.getParameter("password");
				int postNo = Integer.parseInt(request.getParameter("postNo"));

				CommentDao commentDao = new CommentDao();
				Comment one = new Comment();
				one.setBody(body);
				one.setWritedAt(new Date(System.currentTimeMillis()));
				one.setWriterId(writerId);
				one.setPassword(password);
				one.setPostNo(postNo);

				boolean r = commentDao.save(one);
				List<Comment> comments = commentDao.findAllByPostNo(postNo);
				request.setAttribute("comments", comments);
				if (r) {
					response.sendRedirect(request.getContextPath() + "/posts/view?no=" + postNo);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
