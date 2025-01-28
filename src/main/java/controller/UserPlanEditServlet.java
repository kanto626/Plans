package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.DaoFactory;
import dao.PlanDao;
import domain.Plan;
import domain.User;

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


			// リクエストスコープに設定
			request.setAttribute("plan", plan);

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
		// バリデーション用のフラグ
		boolean isError = false;

		// 入力値の取得
		String title = request.getParameter("title");
		String place = request.getParameter("place");
		String[] schedulePlaces = request.getParameterValues("schedulePlace[]");
		String[] scheduleComments = request.getParameterValues("scheduleComment[]");
		String[] scheduleTransports = request.getParameterValues("scheduleTransport[]");
		String[] hours = request.getParameterValues("hours[]");
		String[] minutes = request.getParameterValues("minutes[]");

		// null チェック: null の場合は空の配列を代入
		if (schedulePlaces == null)
			schedulePlaces = new String[0];
		if (scheduleComments == null)
			scheduleComments = new String[0];
		if (scheduleTransports == null)
			scheduleTransports = new String[0];
		if (hours == null)
			hours = new String[0];
		if (minutes == null)
			minutes = new String[0];

		// タイトルと目的地のバリデーション
		if (title == null || title.trim().isEmpty()) {
			request.setAttribute("titleError", "タイトルを入力してください。");
			isError = true;
		}
		if (place == null || place.trim().isEmpty()) {
			request.setAttribute("placeError", "目的地を選択してください。");
			isError = true;
		}

		// スケジュールの画像アップロード処理
		List<String> scheduleImages = new ArrayList<>();
		try {
			Collection<Part> parts = request.getParts();
			for (Part part : parts) {
				if ("scheduleImage[]".equals(part.getName())) {
					String type = part.getContentType();
					if (type != null && type.startsWith("image/")) {
						String fileName = System.currentTimeMillis() + "-" + part.getSubmittedFileName();
						ServletContext ctx = request.getServletContext();
						String path = ctx.getRealPath("/photo");
						part.write(path + "/" + fileName);
						scheduleImages.add("/photo/" + fileName);
					} else {
						scheduleImages.add(""); // 画像がない場合のプレースホルダー
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("scheduleImagesError", "画像のアップロードに失敗しました。");
			isError = true;
		}

		// エラーがあれば再表示
		if (isError) {
			request.getRequestDispatcher("/WEB-INF/view/user/editPlan.jsp").forward(request, response);
			return;
		}

		// スケジュール文字列結合
		StringBuilder scheduleBuilder = new StringBuilder();
		for (int i = 0; i < schedulePlaces.length; i++) {
			String placeName = schedulePlaces[i];
			String comment = (i < scheduleComments.length) ? scheduleComments[i] : "";
			String transport = (i < scheduleTransports.length) ? scheduleTransports[i] : "";
			String hour = (i < hours.length) ? hours[i] : "";
			String minute = (i < minutes.length) ? minutes[i] : "";
			String image = (i < scheduleImages.size()) ? scheduleImages.get(i) : "";

			// 時間のフォーマット
			String time = "";
			if (!hour.isEmpty() && !minute.isEmpty()) {
				time = hour + "時間 " + minute + "分";
			} else if (!hour.isEmpty()) {
				time = hour + "時間";
			} else if (!minute.isEmpty()) {
				time = minute + "分";
			}

			// スケジュール文字列を構築
			scheduleBuilder
					.append("スポット名: ").append(placeName)
					.append(" | コメント: ").append(comment)
					.append(" | 写真: ").append(image)
					.append(" | 移動手段: ").append(transport)
					.append(" | 所要時間: ").append(time).append("\n");
		}

		// データベース保存
		String schedule = scheduleBuilder.toString();

		try {
			User user = (User) request.getSession().getAttribute("user");
			Plan plan = new Plan();
			plan.setTitle(title);
			plan.setPlace(place);
			plan.setSchedule(schedule);
			plan.setUser(user);

			PlanDao planDao = DaoFactory.createPlanDao();
			planDao.update(plan);

			request.getRequestDispatcher("/WEB-INF/view/user/myPlans.jsp")
					.forward(request, response);
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
}