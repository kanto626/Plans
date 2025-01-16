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
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/user/addPlan.jsp")
				.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// パラメータの取得
		String title = request.getParameter("title");
		String schedule = request.getParameter("schedule");
		String place = request.getParameter("place");
		String category = request.getParameter("category");

		// ユーザー情報をセッションから取得
		User user = (User) request.getSession().getAttribute("user");

		// データの追加
		Plan plan = new Plan();
		plan.setTitle(title);
		plan.setSchedule(schedule);
		plan.setPlace(place);
		plan.setCategory(category);
		plan.setUser(user); // User オブジェクトを Plan に設定

		try {
			// データベースに旅行プランを保存
			PlanDao planDao = DaoFactory.createPlanDao();
			planDao.insert(plan);

			// 保存後、登録したプランの情報をリクエストスコープにセット
			request.setAttribute("plan", plan);

			// 登録完了ページに遷移
			request.getRequestDispatcher("/WEB-INF/view/user/addPlanDone.jsp")
					.forward(request, response);
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
}
