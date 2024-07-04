package tutorial;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Index extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String addr=req.getRemoteAddr(); //요청보낸 클라이언트의 IP Address
		System.out.println("Hello service() called from"+addr);

		PrintWriter out =resp.getWriter();
		out.println("환영합니다. 나의 집에 오신 것을.");
		out.println("아직은 뭐가 없어요");
		
		out.close();
	}
}
