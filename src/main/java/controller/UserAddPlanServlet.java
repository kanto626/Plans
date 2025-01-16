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
		String place = request.getParameter("place");
		String category = request.getParameter("category");

		// スケジュールの項目を取得
		String[] schedulePlaces = request.getParameterValues("schedulePlace[]");
		String[] scheduleComments = request.getParameterValues("scheduleComment[]");
		String[] scheduleImages = request.getParameterValues("scheduleImage[]");
		String[] scheduleTransports = request.getParameterValues("scheduleTransport[]");
		String[] scheduleTimes = request.getParameterValues("scheduleTime[]");

		// スケジュールデータを結合して1つのテキストにする
		StringBuilder scheduleData = new StringBuilder();

		for (int i = 0; i < schedulePlaces.length; i++) {
			// append()は、StringBuilderに文字列を追加するメソッド
			scheduleData.append("スポット名: ").append(schedulePlaces[i])
					.append(" | コメント: ").append(scheduleComments[i] != null ? scheduleComments[i] : "")
					.append(" | 写真: ").append(scheduleImages[i] != null ? scheduleImages[i] : "")
					.append(" | 移動手段: ").append(scheduleTransports[i] != null ? scheduleTransports[i] : "")
					.append(" | 時間: ").append(scheduleTimes[i] != null ? scheduleTimes[i] : "")
					.append("\n"); // 次のスポットを区切る
		}

		// 1つの文字列としてデータベースに保存
		String scheduleText = scheduleData.toString();

		// ユーザー情報をセッションから取得
		User user = (User) request.getSession().getAttribute("user");

		// データの追加
		Plan plan = new Plan();
		plan.setTitle(title);
		plan.setSchedule(scheduleText);
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
