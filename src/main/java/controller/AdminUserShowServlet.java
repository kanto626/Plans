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
 * Servlet implementation class AdminUserShowServlet
 */
@WebServlet("/admin/userShow")
public class AdminUserShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// ユーザーIDを取得
			String userIdStr = request.getParameter("id");

			// ユーザーIDを整数に変換
			int userId = Integer.parseInt(userIdStr);

			// PlanDaoを使って、user_idに基づくプランを取得
			PlanDao plandao = DaoFactory.createPlanDao();
			List<Plan> plans = plandao.findByUserId(userId); // userIdを渡す

			// ユーザー情報をリクエストスコープに格納
			request.setAttribute("plans", plans);

			// フォワード
			request.getRequestDispatcher("/WEB-INF/view/admin/userShow.jsp").forward(request, response);
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
