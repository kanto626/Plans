package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDao;
import dao.DaoFactory;
import dao.PlanDao;
import domain.Category;
import domain.Plan;

/**
 * Servlet implementation class UserPlanEditServlet
 */
@WebServlet("/user/editPlan")
public class UserPlanEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// 前のページURLをセッションに格納
			String previousPage = request.getHeader("Referer");
			if (previousPage != null) {
				request.getSession().setAttribute("previousPage", previousPage);
			}

			// パラメータからプランIDを取得
			int id = Integer.parseInt(request.getParameter("id"));

			// プラン情報を取得
			PlanDao planDao = DaoFactory.createPlanDao();
			Plan plan = planDao.findById(id);

			// カテゴリ情報を取得
			CategoryDao categoryDao = DaoFactory.createCategoryDao();
			List<Category> allCategories = categoryDao.getAllCategories();
			List<Category> categories = categoryDao.getCategoriesByPlanId(id);

			// 選択済みのカテゴリIDをリスト化
			List<Integer> selectedCategoryIds = categories.stream()
					.map(Category::getId)
					.collect(Collectors.toList());

			// 全カテゴリに選択状態を設定
			for (Category category : allCategories) {
				category.setSelected(selectedCategoryIds.contains(category.getId()));
			}

			// リクエストスコープに設定
			request.setAttribute("plan", plan);
			request.setAttribute("allCategories", allCategories);
			request.setAttribute("categories", categories);

			// スケジュールを取得しMapに変換
			if (plan != null) {
				String scheduleText = plan.getSchedule();
				if (scheduleText != null && !scheduleText.isEmpty()) {
					String[] scheduleItems = scheduleText.split("\n");
					List<Map<String, String>> scheduleList = new ArrayList<>();
					for (String item : scheduleItems) {
						Map<String, String> scheduleItem = new HashMap<>();
						String[] parts = item.split(" \\| ");
						for (String part : parts) {
							String[] keyValue = part.split(": ");
							if (keyValue.length == 2) {
								String key = keyValue[0].trim();
								String value = keyValue[1].trim();

								// "所要時間"の特別処理
								if (key.equals("所要時間")) {
									String hours = ""; // 時間部分
									String minutes = ""; // 分部分

									// "時間"が含まれる場合
									if (value.contains("時間")) {
										int hourIndex = value.indexOf("時間");
										hours = value.substring(0, hourIndex).trim(); // "時間"の前を抽出
									}

									// "分"が含まれる場合
									if (value.contains("分")) {
										int minIndex = value.indexOf("分");
										int startIndex = value.contains("時間") ? value.indexOf("時間") + 2 : 0; // "時間"の後からスタート
										minutes = value.substring(startIndex, minIndex).trim(); // "分"の前を抽出
									}

									// 抽出結果をMapに追加（非空チェック）
									if (!hours.isEmpty()) {
										scheduleItem.put("時間", hours);
									}
									if (!minutes.isEmpty()) {
										scheduleItem.put("分", minutes);
									}
								} else {
									// 他のキーと値をそのまま追加
									scheduleItem.put(key, value);
								}
							}
						}
						scheduleList.add(scheduleItem);
					}
					request.setAttribute("scheduleList", scheduleList);
				}
			}

			// フォワード
			request.getRequestDispatcher("/WEB-INF/view/user/editPlan.jsp").forward(request, response);
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
