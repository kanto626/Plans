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

import dao.DaoFactory;
import dao.PlanDao;
import domain.Plan;
import domain.User;

@WebServlet("/user/addPlan")
@MultipartConfig(location = "C:/temp")
public class UserAddPlanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// プラン作成フォームを表示
		request.getRequestDispatcher("/WEB-INF/view/user/addPlan.jsp")
				.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
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

		// 再表示用データの設定
		request.setAttribute("title", title);
		request.setAttribute("place", place);
		request.setAttribute("schedulePlaces", schedulePlaces);
		request.setAttribute("scheduleComments", scheduleComments);
		request.setAttribute("scheduleTransports", scheduleTransports);
		request.setAttribute("hours", hours);
		request.setAttribute("minutes", minutes);

		// タイトルと目的地のバリデーション
		if (title == null || title.trim().isEmpty()) {
			request.setAttribute("titleError", "タイトルを入力してください。");
			isError = true;
		}
		if (place == null || place.trim().isEmpty()) {
			request.setAttribute("placeError", "目的地を選択してください。");
			isError = true;
		}

		// 追加されたスケジュールごとにバリデーション
		// エラーメッセージを格納するリストを作成
		List<String> errors = new ArrayList<>();
		for (int i = 0; i < schedulePlaces.length; i++) {
			String spotName = schedulePlaces[i];
			String comment = (i < scheduleComments.length) ? scheduleComments[i] : "";
			String transport = (i < scheduleTransports.length) ? scheduleTransports[i] : "";
			String hour = (i < hours.length) ? hours[i] : "";
			String minute = (i < minutes.length) ? minutes[i] : "";

			// スポット名のバリデーション
			if (spotName == null || spotName.trim().isEmpty()) {
				errors.add("スポット名を入力してください。 (" + (i + 1) + "番目)");
			} else if (spotName.length() > 20) {
				errors.add("スポット名は20文字以内で入力してください。 (" + (i + 1) + "番目)");
			}

			// コメントのバリデーション
			if (comment.length() > 50) {
				errors.add("コメントは50文字以内で入力してください。 (" + (i + 1) + "番目)");
			}

			// 時間と移動手段の関連チェック
			if ((!hour.isEmpty() || !minute.isEmpty()) && (transport == null || transport.trim().isEmpty())) {
				errors.add("所要時間を入力した場合は移動手段を指定してください。 (" + (i + 1) + "番目)");
			}
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
						System.out.println("Saved image path: " + path + "/" + fileName);
						System.out.println("Accessible URL: /photo/" + fileName);

					} else {
						scheduleImages.add(""); // 画像がない場合のプレースホルダー
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			errors.add("画像のアップロードに失敗しました。");
		}

		// エラーがある場合の共通処理
		if (!errors.isEmpty() || isError) {
			request.setAttribute("errors", errors);
			request.setAttribute("title", title);
			request.setAttribute("place", place);
			request.setAttribute("schedulePlaces", schedulePlaces);
			request.setAttribute("scheduleComments", scheduleComments);
			request.setAttribute("scheduleImages", scheduleImages);
			request.setAttribute("scheduleTransports", scheduleTransports);
			request.setAttribute("hours", hours);
			request.setAttribute("minutes", minutes);
			request.getRequestDispatcher("/WEB-INF/view/user/addPlan.jsp").forward(request, response);
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
			planDao.insert(plan);
			request.getSession().setAttribute("Plan", plan);
			response.sendRedirect(request.getContextPath() + "/user/addPlanDone");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("addError", "プランの登録に失敗しました。");
			request.getRequestDispatcher("/WEB-INF/view/user/addPlan.jsp").forward(request, response);
		}
	}
}