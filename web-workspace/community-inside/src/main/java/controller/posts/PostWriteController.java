package controller.posts;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.vo.User;
@WebServlet("/write")
public class PostWriteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<User> user = new ArrayList<>();
		request.setAttribute("user", user);
		User authUser = (User) request.getSession().getAttribute("authUser");
		if(authUser != null) {
			request.getRequestDispatcher("/WEB-INF/view/posts/write.jsp").forward(request, response);
		}else {
			response.sendRedirect(request.getContextPath()+ "/login");
		}
			
	}
}
