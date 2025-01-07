package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoFactory;
import dao.PlanDao;
import domain.Plan;

/**
 * Servlet implementation class UserSearchPlanServlet
 */
@WebServlet("/user/searchPlan")
public class UserSearchPlanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserSearchPlanServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/user/searchPlan.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// 県名を取得
			String prefecture = request.getParameter("prefecture");

			// PlanDaoを使って、県に基づくプランを取得
			PlanDao plandao = DaoFactory.createPlanDao();
			List<Plan> plans = plandao.findByPrefecture(prefecture);

			// 取得したプランリストをリクエストスコープに格納
			request.setAttribute("plans", plans);
			request.setAttribute("selectedPrefecture", prefecture);

			// フォワード
			request.getRequestDispatcher("/WEB-INF/view/user/plans.jsp").forward(request, response);
		} catch (Exception e) {
			throw new ServletException(e);
		}

	}

}
