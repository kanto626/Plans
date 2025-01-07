package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DaoFactory;
import dao.PlanDao;
import domain.Plan;
import domain.User;

/**
 * Servlet implementation class UserPlanListServlet
 */
@WebServlet("/user/myPlans")
public class UserMyPlansServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// セッションから 'user' オブジェクトを取得
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");

			// 検索結果ページで遷移する前にセッションに前のページのURLを保存
			session.setAttribute("previousPage", request.getRequestURL().toString());

			// userオブジェクトからuserIdを取得
			Integer userId = user.getId(); // userオブジェクトからuserIdを取得

			// PlanDaoを使って、user_idに基づくプランを取得
			PlanDao plandao = DaoFactory.createPlanDao();
			List<Plan> plans = plandao.findByUserId(userId); // userIdを渡す

			// 取得したプランリストをリクエストスコープに格納
			request.setAttribute("plans", plans);

			// フォワード
			request.getRequestDispatcher("/WEB-INF/view/user/myPlans.jsp").forward(request, response);
		} catch (Exception e) {
			throw new ServletException(e);
		}

	}

}