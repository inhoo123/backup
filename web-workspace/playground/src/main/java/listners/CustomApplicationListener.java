package listners;

import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import model.Rank;

public class CustomApplicationListener implements ServletContextListener {

	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("CustomApplicationListener/contextInitialized");

		ServletContext application = sce.getServletContext();
		application.setAttribute("ranks", new ArrayList<Rank>());
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {

		ServletContextListener.super.contextDestroyed(sce);
		System.out.println("CustomApplicationListener/contextDestroyed");
	}

}
