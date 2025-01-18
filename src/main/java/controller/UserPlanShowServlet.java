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

import dao.DaoFactory;
import dao.PlanDao;
import domain.Plan;

/**
 * Servlet implementation class UserPlanShowServlet
 */
@WebServlet("/user/planShow")
public class UserPlanShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// 直前のページURLをセッションに格納
			String previousPage = request.getHeader("Referer");
			if (previousPage != null) {
				request.getSession().setAttribute("previousPage", previousPage);
			}
			// ?id=○○を取得
			int id = Integer.parseInt(request.getParameter("id"));

			// DAOを使い、IDに基づく旅行プランを取得
			// 旅行プラン情報をリクエストスコープに格納
			PlanDao dao = DaoFactory.createPlanDao();
			Plan plan = dao.findById(id);
			request.setAttribute("plan", plan);

			// スケジュールテキストをMapに変換
			if (plan != null) {
				String scheduleText = plan.getSchedule(); // スケジュールテキストを取得
				if (scheduleText != null && !scheduleText.isEmpty()) {
					String[] scheduleItems = scheduleText.split("\n"); // 各行を改行文字で分割
					// 各行を Map に変換したものをリストに格納
					List<Map<String, String>> scheduleList = new ArrayList<>();
					for (String item : scheduleItems) {
						Map<String, String> scheduleItem = new HashMap<>();
						String[] parts = item.split(" \\| "); // 行を項目ごとに分割
						for (String part : parts) {
							String[] keyValue = part.split(": "); // 項目を": " を基準にキーと値に分割
							if (keyValue.length == 2) { // 無効な形式（例：キーや値が欠けている場合）を除外
								scheduleItem.put(keyValue[0].trim(), keyValue[1].trim());
							}
						}
						// 1行分のデータを scheduleItem に格納し、それを scheduleList に追加
						scheduleList.add(scheduleItem);
					}
					request.setAttribute("scheduleList", scheduleList); // 変換結果をリクエストスコープに格納
				}
			}

			// セッションからUserオブジェクトを取得
			// User user = (User) request.getSession().getAttribute("user");
			// request.setAttribute("user", user);
			// フォワード
			request.getRequestDispatcher("/WEB-INF/view/user/planShow.jsp")
					.forward(request, response);
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
}
