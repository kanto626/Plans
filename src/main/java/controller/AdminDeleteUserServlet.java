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
 * Servlet implementation class AdminDeleteUserServlet
 */
@WebServlet("/admin/deleteUser")
public class AdminDeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// Get パラメータの取得
			String strId = request.getParameter("id");
			Integer id = Integer.parseInt(strId);

			UserDao userDao = DaoFactory.createUserDao();
			User user = userDao.findById(id);

			if (user == null) {
				// ユーザーが見つからない場合のエラーメッセージ
				request.setAttribute("error", "指定されたIDのユーザーが存在しません。");
				request.getRequestDispatcher("/WEB-INF/view/admin/error.jsp").forward(request, response);
				return;
			}

			// 削除ページの表示
			request.setAttribute("user", user);
			request.getRequestDispatcher("/WEB-INF/view/admin/deleteUser.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException("削除ページの表示中にエラーが発生しました。", e);
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

		// 削除メソッドの引数用にUserオブジェクトを作成
		User user = new User();
		user.setId(id);
		try {
			// データの削除
			UserDao userDao = DaoFactory.createUserDao();
			userDao.delete(user);

			// 削除完了ページの表示
			request.getRequestDispatcher("/WEB-INF/view/admin/deleteUserDone.jsp")
					.forward(request, response);
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

}
