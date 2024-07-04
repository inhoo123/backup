package controller.study;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.vo.Student;

@WebServlet("/study/about-core")
public class AboutCore2Controller extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean result = Math.random() > 0.5;
		
		
		request.setAttribute("result", result);
		
		request.setAttribute("code", (int)(Math.random()*3));
		
		String[] cates= new String[] {"일반행정","통계","문화"};
		request.setAttribute("category", cates);
		request.setAttribute("categoryLength", cates.length);
		
		List<Student> students =
				List.of(
						new Student("22-70002801", "길형민", "항공정비", 21),
						new Student("22-123444", "박원화", "항공정비", 20),
						new Student("22-1244412", "김도훈", "항공정비", 22)
						);
		request.setAttribute("students", students);
		
		
		request.getRequestDispatcher("/WEB-INF/view/study/about-core.jsp").forward(request, response);
	}

}
