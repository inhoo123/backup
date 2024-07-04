package controller.study;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.JobDao;
import model.vo.Job;
import model.vo.Student;

@WebServlet("/study/hr-job")
public class HrController extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JobDao jobDao = new JobDao();
		try {
			List<Job> jobs = jobDao.findAll();
			request.setAttribute("jobs", jobs);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		request.getRequestDispatcher("/WEB-INF/view/study/hr-job.jsp").forward(request, response);
	}

}
