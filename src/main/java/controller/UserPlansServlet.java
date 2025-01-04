package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoFactory;
import dao.PlanDao;

/**
 * Servlet implementation class UserPlansServlet
 */
@WebServlet("/user/plans")
public class UserPlansServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			//プランリストを取得(DAOに依頼)
			PlanDao dao = DaoFactory.createPlanDao();

			//プランリストをリクエストスコープに格納
			request.setAttribute("plans", dao.findAll());
			//フォワード
			request.getRequestDispatcher("/WEB-INF/view/user/plans.jsp")
					.forward(request, response);
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

}
