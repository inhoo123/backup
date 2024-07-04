package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.dao.PostDao;

@WebServlet("/search/view")
public class SearchController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String q =request.getParameter("q");
		try {
		PostDao postDao = new PostDao();
		request.setAttribute("post", postDao.findAll());
		if (q == null) {
			request.getRequestDispatcher("/WEB-INF/view/search-error.jsp").forward(request, response);
		} else {
				System.out.println(postDao.findByTitleLikeOrBodysLike(q).size());
				request.setAttribute("foundPosts", postDao.findByTitleLikeOrBodysLike(q));

				request.getRequestDispatcher("/WEB-INF/view/posts/search-result.jsp").forward(request, response);

		}
			} catch (Exception e) {
				e.printStackTrace();
			}

	}
}
