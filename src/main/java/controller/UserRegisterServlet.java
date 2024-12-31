package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

import dao.DaoFactory;
import dao.UserDao;
import dto.User;

/**
 * Servlet implementation class UserRegisterServlet
 */
@WebServlet("/user/register")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/user/register.jsp")
				.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// バリデーション用のフラグ
		boolean isError = false;

		// パラメータの取得 + バリデーション
		String name = request.getParameter("name");
		request.setAttribute("name", name); // 再表示用
		if (name.isBlank()) {
			// エラーメッセージの作成
			request.setAttribute("nameError", "ユーザー名が未入力です。");
			isError = true; // 入力に不備ありと判定
		} else if (name.length() > 15) {
			request.setAttribute("nameError", "15 字以内で入力してください。");
			isError = true;
		}
		// loginIdのバリデーション
		String loginId = request.getParameter("loginId");
		request.setAttribute("loginId", loginId); // 再表示用
		if (loginId == null || loginId.isBlank()) {
			request.setAttribute("loginIdError", "ログインIDが未入力です。");
			isError = true;
		} else if (loginId.length() < 5 || loginId.length() > 30) {
			request.setAttribute("loginIdError", "ログインIDは5〜30文字以内で入力してください。");
			isError = true;
		}
		// loginPassのバリデーション
		String loginPass = request.getParameter("loginPass");
		if (loginPass == null || loginPass.isBlank()) {
			request.setAttribute("loginPassError", "パスワードが未入力です。");
			isError = true;
		} else if (loginPass.length() < 4) {
			request.setAttribute("loginPassError", "パスワードは4文字以上で入力してください。");
			isError = true;
		} else {
			// パスワードをハッシュ化
			loginPass = BCrypt.hashpw(loginPass, BCrypt.gensalt());
		}
		// 入力不備がある場合は、フォームを再表示し、処理を中断
		if (isError == true) {
			request.getRequestDispatcher("/WEB-INF/view/user/register.jsp")
					.forward(request, response);
			return;
		}
		// 入力に不備がなければ、データの追加
		User user = new User();
		user.setName(name);
		user.setLoginId(loginId);
		user.setLoginPass(loginPass);

		try {
			UserDao userDao = DaoFactory.createUserDao();
			userDao.insert(user);
			request.getRequestDispatcher("/WEB-INF/view/user/registerDone.jsp")
					.forward(request, response);
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

}
