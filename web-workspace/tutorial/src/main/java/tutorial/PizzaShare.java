package tutorial;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/pizza")
public class PizzaShare extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		String query = req.getQueryString();// ?뒷부분 의 전체 문자열을 추출

		System.out.println("query:" + query); // req.getParameter();
		// 없으면 null 이 뜸.
		// 특정이름으로 넘어온 밸류를 확인하려면...? split 을 직접할 필요는 없다.
		// WAS 가 queryString 을 분석해서 Map 형태로 처리를 해두기 때문에.
		req.getParameterMap();
		String slice = req.getParameter("slice"); // 이름만 주고
		String n = req.getParameter("n"); // 전부 String 으로 저장을 하고 있다.

		System.out.println("slice : " + slice + "/ n : " + n);

		resp.setContentType("text/html;charset=UTF-8");
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>피자 나눠 먹기</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h2>피자나눠먹기 - 풀이</h2>");
		out.println("<p>피자를 n 명이서 한 조각 이상씩 먹기 위해서 최소 몇판을 시켜야하는지 알아보는 문제입니다.</p>");
		if (slice == null || n == null) {
			out.print("<p>slice 값과 n값이 반드시 전달되어야 합니다.</p>");
		} else {
			int iSlice = Integer.parseInt(slice);
			int iN = Integer.parseInt(n);

			int answer = iSlice % iN > 0 ? iN / iSlice + 1 : iN / iSlice;
			out.print("<p>n이"+n+"이고 slice가"+slice+"일때"+"정답은" + answer + "입니다.</p>");
		}
	}
}