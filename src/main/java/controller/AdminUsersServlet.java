package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoFactory;
import dao.UserDao;
import dto.User;

/**
 * Servlet implementation class ListUserServlet
 */
@WebServlet("/admin/users")
public class AdminUsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// DAO によるデータ取得
			UserDao userDao = DaoFactory.createUserDao();
			List<User> userList = userDao.findAll();
			// JSP へフォワード
			request.setAttribute("userList", userList);
			request.getRequestDispatcher("/WEB-INF/view/admin/users.jsp")
					.forward(request, response);
		} catch (Exception e) {
			throw new ServletException(e);
		}

	}

}
