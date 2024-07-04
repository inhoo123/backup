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
public class UpdateHandleController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		String title = request.getParameter("title");
		String body = request.getParameter("body");
		int no = Integer.parseInt(request.getParameter("no"));
		// (int no, String writerId, String title, String body, Date writedAt, int readCnt) // 
		Post one = new Post(no, null, title, body, null, null, 0, 0, 0);
		
		PostDao postDao = new PostDao();
		
		boolean r;
			r = postDao.update(one);
		if (r) {
			response.sendRedirect(request.getContextPath()+"/view?no="+no);	
		} else {
			
	}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
}
}
