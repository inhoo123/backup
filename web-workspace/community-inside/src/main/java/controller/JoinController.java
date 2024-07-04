package controller;

import java.io.IOException;
import java.util.Random;
import java.util.UUID;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/join")
public class JoinController extends HttpServlet{

	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	    String generatedString = UUID.randomUUID().toString().substring(0, 8);
	    request.setAttribute("generatedString", generatedString);

		
		request.getRequestDispatcher("/WEB-INF/view/join.jsp").forward(request, response);

		}
	
}
