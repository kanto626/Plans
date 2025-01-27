package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

		// パラメータからIDを取得
		int id = Integer.parseInt(request.getParameter("id"));

		try {
			// 削除するプランの取得
			PlanDao planDao = DaoFactory.createPlanDao();
			Plan plan = planDao.findById(id);

			//リクエストスコープに格納
			request.setAttribute("plan", plan);

			// スケジュールテキストをMapに変換
			List<Map<String, String>> scheduleList = new ArrayList<>();

			if (plan != null && plan.getSchedule() != null) {
				String[] scheduleItems = plan.getSchedule().split("\n");
				for (String item : scheduleItems) {
					Map<String, String> scheduleItem = new HashMap<>();
					String[] parts = item.split(" \\| ");
					for (String part : parts) {
						String[] keyValue = part.split(": ");
						if (keyValue.length == 2) {
							scheduleItem.put(keyValue[0].trim(), keyValue[1].trim());
						}
					}
					scheduleList.add(scheduleItem);
				}
			}

			// フォワード
			request.getRequestDispatcher("/WEB-INF/view/user/deletePlan.jsp").forward(request, response);
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

			// セッションに削除完了メッセージを保存
			HttpSession session = request.getSession();
			session.setAttribute("flashMessage", "プランが１件削除されました。");
			// /user/myPlans にリダイレクト
			response.sendRedirect(request.getContextPath() + "/user/myPlans");
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
}