package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.CategoryDao;
import dao.DaoFactory;
import dao.PlanDao;
import domain.Category;
import domain.Plan;
import domain.User;

@WebServlet("/user/addPlan")
@MultipartConfig(location = "C:/temp")
public class UserAddPlanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// カテゴリリストを取得
			CategoryDao categoryDao = DaoFactory.createCategoryDao();
			List<Category> categories = categoryDao.getAllCategories();
			// カテゴリリストをリクエストスコープにセット
			request.setAttribute("categories", categories);
		} catch (Exception e) {
			throw new ServletException("カテゴリ情報の取得中にエラーが発生しました", e);
		}

		// プラン作成フォームを表示
		request.getRequestDispatcher("/WEB-INF/view/user/addPlan.jsp")
				.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		boolean isError = false;

		// 1. タイトルの取得とバリデーション
		String title = request.getParameter("title");
		request.setAttribute("title", title); // 再表示用
		if (title == null || title.trim().isEmpty()) {
			request.setAttribute("titleError", "タイトルを入力してください。");
			isError = true;
		} else if (title.length() > 50) {
			request.setAttribute("titleError", "タイトルは50文字以内で入力してください。");
			isError = true;
		}

		// 2. 目的地の取得とバリデーション
		String place = request.getParameter("place");
		if (place == null || place.trim().isEmpty()) {
			request.setAttribute("placeError", "目的地を選択してください。");
			isError = true;
		}
		request.setAttribute("place", place); // 再表示用

		// 3. パラメータの取得と初期化
		String[] scheduleTransports = request.getParameterValues("scheduleTransport[]");
		if (scheduleTransports == null) {
			scheduleTransports = new String[0];
		}

		String[] hours = request.getParameterValues("hours[]");
		if (hours == null) {
			hours = new String[0];
		}

		String[] minutes = request.getParameterValues("minutes[]");
		if (minutes == null) {
			minutes = new String[0];
		}

		String[] schedulePlaces = request.getParameterValues("schedulePlace[]");
		if (schedulePlaces == null) {
			schedulePlaces = new String[0];
		}

		String[] scheduleComments = request.getParameterValues("scheduleComment[]");
		if (scheduleComments == null) {
			scheduleComments = new String[0];
		}

		// 4. 画像アップロード処理
		List<String> scheduleImages = new ArrayList<>();

		try {
			Collection<Part> parts = request.getParts();
			for (Part part : parts) {
				if (part.getName().equals("scheduleImage[]")) {
					String type = part.getContentType();
					if (part.getSize() > 0 && type != null) {
						if (type.startsWith("image/")) {
							String fileName = System.currentTimeMillis() + "-" + part.getSubmittedFileName();
							ServletContext ctx = request.getServletContext();
							String path = ctx.getRealPath("/photo");
							part.write(path + "/" + fileName);
							scheduleImages.add("/photo/" + fileName);
						} else {
							request.setAttribute("scheduleImagesError", "画像形式のファイルを選択してください。");
							isError = true;
							scheduleImages.add(""); // プレースホルダーとして空文字を追加
						}
					} else {
						scheduleImages.add(""); // 画像がアップロードされなかった場合のプレースホルダー
					}
				}
			}
		} catch (Exception e) {
			request.setAttribute("scheduleImagesError", "画像のアップロード中にエラーが発生しました。");
			isError = true;
		}

		// 5. 画像の数を schedulePlaces.length に合わせる
		while (scheduleImages.size() < schedulePlaces.length) {
			scheduleImages.add("");
		}

		// 6. スポット名のバリデーション: すべてのスポット名が必須かつ20文字以内
		for (int i = 0; i < schedulePlaces.length; i++) {
			String placeName = schedulePlaces[i];
			if (placeName == null || placeName.trim().isEmpty()) {
				request.setAttribute("schedulePlacesError", "すべてのスポット名を入力してください。");
				isError = true;
				break; // 一つでもエラーがあればループを抜ける
			} else if (placeName.length() > 20) {
				request.setAttribute("schedulePlacesError", "スポット名は20文字以内で入力してください。");
				isError = true;
				break;
			}
		}

		// 7. 移動手段と所要時間のバリデーション
		for (int i = 0; i < schedulePlaces.length; i++) {
			String transport = (i < scheduleTransports.length) ? scheduleTransports[i] : "";
			String hour = (i < hours.length) ? hours[i] : "";
			String minute = (i < minutes.length) ? minutes[i] : "";

			// 所要時間が設定されている場合、移動手段も必須
			if ((!hour.isEmpty() || !minute.isEmpty()) && (transport == null || transport.isEmpty())) {
				request.setAttribute("scheduleTransportsError", "所要時間が設定されている場合、移動手段も必須です。");
				isError = true;
				break; // 一つでもエラーがあればループを抜ける
			}
		}

		// 8. リクエストスコープにセット（再表示用）
		request.setAttribute("scheduleTransports", scheduleTransports);
		request.setAttribute("hours", hours);
		request.setAttribute("minutes", minutes);
		request.setAttribute("schedulePlaces", schedulePlaces);
		request.setAttribute("scheduleComments", scheduleComments);
		request.setAttribute("scheduleImages", scheduleImages);

		// 9. エラーがあれば再表示
		if (isError) {
			request.getRequestDispatcher("/WEB-INF/view/user/addPlan.jsp")
					.forward(request, response);
			return;
		}

		// 10. 文字列連結のループ（schedulePlaces.length を基準）
		StringBuilder scheduleData = new StringBuilder();
		for (int i = 0; i < schedulePlaces.length; i++) {
			// 移動手段と時間を安全に取得
			String transport = (i < scheduleTransports.length && scheduleTransports[i] != null) ? scheduleTransports[i]
					: "";
			String hour = (i < hours.length && hours[i] != null) ? hours[i] : "";
			String minute = (i < minutes.length && minutes[i] != null) ? minutes[i] : "";

			// 時間のフォーマット
			String time = "";
			if (!hour.isEmpty() && !minute.isEmpty()) {
				time = hour + "時間 " + minute + "分";
			} else if (!hour.isEmpty()) {
				time = hour + "時間";
			} else if (!minute.isEmpty()) {
				time = minute + "分";
			}

			// スポット名、コメント、画像を安全に取得
			String spot = schedulePlaces[i];
			String comment = (i < scheduleComments.length && scheduleComments[i] != null) ? scheduleComments[i] : "";
			String image = (i < scheduleImages.size() && scheduleImages.get(i) != null) ? scheduleImages.get(i) : "";

			// 文字列連結
			scheduleData.append("スポット名: ").append(spot)
					.append(" | コメント: ").append(comment)
					.append(" | 写真: ").append(image)
					.append(" | 移動手段: ").append(transport)
					.append(" | 所要時間: ").append(time)
					.append("\n");
		}

		String scheduleText = scheduleData.toString();
		User user = (User) request.getSession().getAttribute("user");

		// 11. Plan オブジェクトの作成とデータベースへの保存
		Plan plan = new Plan();
		plan.setTitle(title);
		plan.setSchedule(scheduleText);
		plan.setPlace(place);
		plan.setUser(user);
		// plan.setCategoryIds(categoryIds); // カテゴリIDリストをセット（必要に応じて）

		try {
			PlanDao planDao = DaoFactory.createPlanDao();
			planDao.insert(plan);
			request.getSession().setAttribute("Plan", plan);
			response.sendRedirect(request.getContextPath() + "/user/addPlanDone");
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
}
