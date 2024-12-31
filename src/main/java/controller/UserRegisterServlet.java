package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		// パラメータの取得
		String name = request.getParameter("name");
		String loginId = request.getParameter("loginId");
		String loginPass = request.getParameter("loginPass");
		// データの追加
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
