package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDao;
import dao.DaoFactory;
import domain.Admin;

/**
 * Servlet implementation class AdminLoginServlet
 */
@WebServlet("/admin/login")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/admin/login.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// フォームから送信されたログインIDとパスワードを取得
			String adminId = request.getParameter("adminId");
			String adminPass = request.getParameter("adminPass");

			// Factoryを使いDAOオブジェクトを生成、利用する
			AdminDao adminDao = DaoFactory.createAdminDao();
			Admin admin =
					//loginIdとloginPassを使って管理者情報を検索
					adminDao.findByLoginIdAndLoginPass(adminId, adminPass);

			if (admin != null) {
				// ログイン成功⇒セッションに管理者IDを格納
				request.getSession().setAttribute("adminId", admin.getLoginId());
				// 管理者用ページ(ユーザーリスト)へリダイレクト
				response.sendRedirect("users");
			} else {
				request.setAttribute("error", true);
				request.getRequestDispatcher("/WEB-INF/view/admin/login.jsp")
						.forward(request, response);
			}
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
}
