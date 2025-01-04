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
 * Servlet implementation class UserPlanShowServlet
 */
@WebServlet("/user/planShow")
public class UserPlanShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// ?id=○○を取得
			int id = Integer.parseInt(request.getParameter("id"));

			// DAOを使い、IDに基づく旅行プランを取得
			// 旅行プラン情報をリクエストスコープに格納
			PlanDao dao = DaoFactory.createPlanDao();
			request.setAttribute("plan", dao.findById(id));

			// フォワード
			request.getRequestDispatcher("/WEB-INF/view/user/planShow.jsp")
					.forward(request, response);
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
}
