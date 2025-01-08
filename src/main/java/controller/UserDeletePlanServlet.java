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

/**
 * Servlet implementation class UserDeletePlanServlet
 */
@WebServlet("/user/deletePlan")
public class UserDeletePlanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Get パラメータの取得
		String strId = request.getParameter("id");
		Integer id = Integer.parseInt(strId);
		try {
			// 削除するプランの取得
			PlanDao planDao = DaoFactory.createPlanDao();
			Plan plan = planDao.findById(id);
			// 削除ページの表示
			request.setAttribute("plan", plan);
			request.getRequestDispatcher("/WEB-INF/view/user/deletePlan.jsp")
					.forward(request, response);
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Get パラメータの取得
		String strId = request.getParameter("id");
		Integer id = Integer.parseInt(strId);
		// 削除メソッドの引数用にPlan オブジェクトを作成
		Plan plan = new Plan();
		plan.setId(id);
		try {
			// データの削除
			PlanDao planDao = DaoFactory.createPlanDao();
			planDao.delete(plan);
			// 削除完了ページの表示
			request.getRequestDispatcher("/WEB-INF/view/user/deletePlanDone.jsp")
					.forward(request, response);
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

}
