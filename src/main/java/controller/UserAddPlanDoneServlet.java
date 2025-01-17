package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoFactory;
import dao.PlanDao;
import domain.Plan;
import domain.User;

/**
 * Servlet implementation class UserAddPlanDoneServlet
 */
@WebServlet("/user/addPlanDone")
public class UserAddPlanDoneServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // セッションからログインユーザーを取得
            User user = (User) request.getSession().getAttribute("user");

            // PlanDaoを使用してユーザーIDに基づくプランを取得
            PlanDao planDao = DaoFactory.createPlanDao();
            List<Plan> plans = planDao.findByUserId(user.getId());

            // プランが存在する場合、最初のプランを取得（もし複数あれば適宜調整）
            Plan plan = plans.isEmpty() ? null : plans.get(0); 

            // プランが見つかった場合、スケジュールテキストをMapに変換
            if (plan != null) {
                String scheduleText = plan.getSchedule();
                String[] scheduleItems = scheduleText.split("\n");

                List<Map<String, String>> scheduleList = new ArrayList<>();
                for (String item : scheduleItems) {
                    Map<String, String> scheduleItem = new HashMap<>();
                    String[] parts = item.split(" \\| ");
                    for (String part : parts) {
                        String[] keyValue = part.split(": ");
                        if (keyValue.length == 2) {
                            scheduleItem.put(keyValue[0].trim(), keyValue[1].trim());
                        }
                    }
                    scheduleList.add(scheduleItem);
                }

                // JSPにデータを渡す
                request.setAttribute("plan", plan);
                request.setAttribute("scheduleList", scheduleList);
            }

            // JSPに転送
            request.getRequestDispatcher("/WEB-INF/view/user/addPlanDone.jsp").forward(request, response);

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
