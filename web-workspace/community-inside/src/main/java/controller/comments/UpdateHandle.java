package controller.comments;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.CommentDao;
import model.dao.PostDao;
import model.vo.Comment;
import model.vo.Post;

@WebServlet("/comment-update-handle")
public class UpdateHandle extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// 게시글 NO
			PostDao postDao = new PostDao();
			int postNo = (Integer.parseInt(req.getParameter("postNo")));
			String body = req.getParameter("body");
			int no = (Integer.parseInt(req.getParameter("no")));

			req.setAttribute("post", postDao.findByNo(postNo));

			Comment one = new Comment();
			one.setNo(no);
			one.setBody(body);

			CommentDao commentDao = new CommentDao();
			req.setAttribute("comment", commentDao.update(one));

			boolean r;
			r = commentDao.update(one);
			if (r) {
				resp.sendRedirect(req.getContextPath() + "/posts/view?no=" + postNo);
			} else {

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
