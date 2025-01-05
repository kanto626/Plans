package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoFactory;
import dao.PlanDao;
import domain.Plan;
import domain.User;

/**
 * Servlet implementation class UserAddPlanServlet
 */
@WebServlet("/user/addPlan")
public class UserAddPlanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/user/addPlan.jsp")
				.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// パラメータの取得
		String title = request.getParameter("title");
		String detail = request.getParameter("detail");
		String place = request.getParameter("place");
		String category = request.getParameter("category");
		Integer userId = Integer.parseInt(request.getParameter("userId"));

		// データの追加
	
		 Plan plan = new Plan();
		 plan.setTitle(title);
		 plan.setDetail(detail);
		 plan.setPlace(place);
		 plan.setCategory(category); 
		// User オブジェクトを作成し Plan に設定
		    User user = new User();
		    user.setId(userId); // userId を設定
		    plan.setUser(user); // User オブジェクトを Plan に設定
		 try {
			 PlanDao planDao = DaoFactory.createPlanDao();
			 planDao.insert(plan);
			 request.getRequestDispatcher("/WEB-INF/view/addPlan.jsp")
			 .forward(request, response);
			 } catch (Exception e) {
			 throw new ServletException(e);
			 } 
	}

}
