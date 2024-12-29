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
		try {
			//フォームから送信されたログインIDとパスワードを取得
			String loginId = request.getParameter("loginId");
			String loginPass = request.getParameter("loginPass");
			//Factoryを使いDAOオブジェクトを生成、利用する
			UserDao userDao = DaoFactory.createUserDao();
			User user =
					//loginIdとloginPassを使ってユーザー情報を検索
					userDao.findByLoginIdAndLoginPass(loginId, loginPass);
			if (user != null) {
				//ログイン成功⇒セッションにログインIDを格納
				request.getSession().setAttribute("loginId",
						user.getLoginId());
				//ログイン後はトップページへリダイレクト
				response.sendRedirect("userTop");
			} else {
				request.setAttribute("error", true);
				request.getRequestDispatcher("/WEB-INF/view/user/login.jsp")
						.forward(request, response);
			}
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

}
