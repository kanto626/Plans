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
		request.getRequestDispatcher("/WEB-INF/view/user/addPlan.jsp")
				.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		boolean isError = false;

		// パラメータの取得とバリデーション
		String title = request.getParameter("title");
		request.setAttribute("title", title); // 再表示用
		if (title == null || title.isBlank()) {
			request.setAttribute("titleError", "タイトルを入力してください");
			isError = true;
		} else if (title.length() > 50) {
			request.setAttribute("titleError", "全角で50字以内、または半角100字以内で入力してください。");
			isError = true;
		}

		String place = request.getParameter("place");
		if (place.isBlank()) {
			request.setAttribute("placeError", "目的地を選択してください");
			isError = true;
		}
		request.setAttribute("place", place); // 再表示用

		String category = request.getParameter("category");
		request.setAttribute("category", category); // 再表示用

		String[] schedulePlaces = request.getParameterValues("schedulePlace[]");
		String[] scheduleComments = request.getParameterValues("scheduleComment[]");

		// 画像ファイル名を格納するリスト
		List<String> scheduleImages = new ArrayList<>();

		// パート情報を取得
		Collection<Part> parts = request.getParts();

		for (Part part : parts) {
			// フォームの name 属性が "scheduleImage[]" であるか確認
			if (part.getName().equals("scheduleImage[]")) {
				String type = part.getContentType();
				// ファイル名が空でない場合に処理を続行
				if (part.getSize() > 0 && type != null) {
					// 画像ファイルか否かのチェック
					if (type.startsWith("image/")) {
						// ファイル名を生成
						String fileName = System.currentTimeMillis() + "-" + part.getSubmittedFileName();

						// 画像アップロード
						ServletContext ctx = request.getServletContext(); // ServletContextを取得
						String path = ctx.getRealPath("/photo"); // 保存先のフォルダパスを取得
						part.write(path + "/" + fileName); // ファイルを保存

						// 画像の相対パスをリストに追加
						scheduleImages.add("/photo/" + fileName);
					} else {
						// 画像以外のファイルが選択された場合、エラーメッセージを設定
						request.setAttribute("scheduleImagesError", "画像形式のファイルを選択してください");
						isError = true;
						scheduleImages.add(""); // プレースホルダーとして空文字を追加
					}
				} else {
					scheduleImages.add(""); // 画像がアップロードされなかった場合のプレースホルダー
				}
			}
		}

		String[] scheduleTransports = request.getParameterValues("scheduleTransport[]");
		String[] hours = request.getParameterValues("hours[]");
		String[] minutes = request.getParameterValues("minutes[]");

		request.setAttribute("schedulePlaces", schedulePlaces);
		request.setAttribute("scheduleComments", scheduleComments);
		request.setAttribute("scheduleImages", scheduleImages);
		request.setAttribute("scheduleTransports", scheduleTransports);
		request.setAttribute("hours", hours);
		request.setAttribute("minutes", minutes);

		// バリデーション: スポット名のチェック
		if (schedulePlaces == null || schedulePlaces[0].isBlank()) {
			request.setAttribute("schedulePlacesError", "スポット名を入力してください。");
			isError = true;
		} else {
			for (int i = 1; i < schedulePlaces.length; i++) {
				if (!schedulePlaces[i].isBlank() && schedulePlaces[i].length() > 30) {
					request.setAttribute("schedulePlaceError", "スポット名は30文字以内で入力してください。");
					isError = true;
					break;
				}
			}
		}

		// バリデーション: スポット名が空の場合に他の入力があるかチェック
		for (int i = 0; i < schedulePlaces.length; i++) {
			if ((schedulePlaces[i] == null || schedulePlaces[i].isBlank()) &&
					((scheduleComments != null && !scheduleComments[i].isBlank()) ||
							!scheduleImages.get(i).isBlank() ||  // 修正: 画像がアップロードされているか確認
							(scheduleTransports != null && !scheduleTransports[i].isBlank()) ||
							(hours != null && !hours[i].isBlank()) ||
							(minutes != null && !minutes[i].isBlank()))) {
				request.setAttribute("schedulePlacesError", "スポット名が未入力の場合、他の項目を入力することはできません。");
				isError = true;
				break;
			}
		}

		// バリデーション: 移動手段が必須
		for (int i = 0; i < hours.length; i++) {
			if ((!hours[i].isEmpty() || !minutes[i].isEmpty()) && (scheduleTransports[i].isEmpty())) {
				request.setAttribute("scheduleTransportsError", "所要時間が設定されている場合、移動手段も必須です。");
				isError = true;
			}
		}

		if (isError) {
			request.getRequestDispatcher("/WEB-INF/view/user/addPlan.jsp")
					.forward(request, response);
			return;
		}

		StringBuilder scheduleData = new StringBuilder();
		for (int i = 0; i < scheduleTransports.length; i++) {
			String time = "";
			if (!hours[i].isEmpty() && !minutes[i].isEmpty()) {
				time = hours[i] + "時間 " + minutes[i] + "分";
			} else if (!hours[i].isEmpty()) {
				time = hours[i] + "時間";
			} else if (!minutes[i].isEmpty()) {
				time = minutes[i] + "分";
			}

			scheduleData.append("スポット名: ").append(schedulePlaces[i])
					.append(" | コメント: ").append(scheduleComments[i] != null ? scheduleComments[i] : "")
					.append(" | 写真: ").append(scheduleImages.get(i)) // 必ずインデックスが一致する
					.append(" | 移動手段: ").append(scheduleTransports[i] != null ? scheduleTransports[i] : "")
					.append(" | 所要時間: ").append(time)
					.append("\n");
		}

		String scheduleText = scheduleData.toString();
		User user = (User) request.getSession().getAttribute("user");

		Plan plan = new Plan();
		plan.setTitle(title);
		plan.setSchedule(scheduleText);
		plan.setPlace(place);
		plan.setCategory(category);
		plan.setUser(user);

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
