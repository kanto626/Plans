package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoFactory;
import dao.UserDao;
import domain.User;

/**
 * Servlet implementation class UserLoginServlet
 */
@WebServlet("/user/login")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/user/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean isError = false;

		// フォームから送信されたログインIDとパスワードを取得
		String loginId = request.getParameter("loginId");

		// loginIdのバリデーション
		request.setAttribute("loginId", loginId); // 再表示用
		if (loginId == null || loginId.isBlank()) {
			// エラーメッセージの作成
			request.setAttribute("loginIdError", "ログインIDが未入力です。");
			isError = true;
		} else if (loginId.length() > 30) {
			request.setAttribute("loginIdError", "ログインIDは30文字以内で入力してください。");
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
		}

		// エラーがある場合、再表示
		if (isError == true) {
			request.getRequestDispatcher("/WEB-INF/view/user/login.jsp").forward(request, response);
			return;
		}

		// 入力に不備がなければ、ユーザー情報を取得
		try {
			// Factoryを使いDAOオブジェクトを生成、利用する
			UserDao userDao = DaoFactory.createUserDao();
			User user = userDao.findByLoginIdAndLoginPass(loginId, loginPass);

			if (user != null) {
				// ログイン成功 ⇒ セッションにログインIDを格納
				request.getSession().setAttribute("loginId", user.getLoginId());
				request.getSession().setAttribute("user", user);
				// ログイン後はトップページへリダイレクト
				response.sendRedirect("top");
			} else {
				// ログイン失敗 ⇒ エラーメッセージを表示
				request.setAttribute("error", true);
				request.getRequestDispatcher("/WEB-INF/view/user/login.jsp").forward(request, response);
			}
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
}
