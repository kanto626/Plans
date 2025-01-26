package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserAddPlanDoneServlet
 */
@WebServlet("/user/addPlanDone")
public class UserAddPlanDoneServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	try {
            // セッションからPlanオブジェクトを取得
//            Plan plan = (Plan) request.getSession().getAttribute("Plan");

//            // カテゴリ名リストを取得
//            List<String> categoryNames = new ArrayList<>();
//            if (plan != null && plan.getCategoryIds() != null) {
//                CategoryDao categoryDao = DaoFactory.createCategoryDao();
//                for (Integer categoryId : plan.getCategoryIds()) {
//                    Category category = categoryDao.getCategoryById(categoryId);
//                    if (category != null) {
//                        categoryNames.add(category.getName());
//                    }
//                }
//            }

            
            // スケジュールテキストをMapに変換
//            List<Map<String, String>> scheduleList = new ArrayList<>();
//            if (plan != null && plan.getSchedule() != null) {
//                String[] scheduleItems = plan.getSchedule().split("\n");
//                for (String item : scheduleItems) {
//                    Map<String, String> scheduleItem = new HashMap<>();
//                    String[] parts = item.split(" \\| ");
//                    for (String part : parts) {
//                        String[] keyValue = part.split(": ");
//                        if (keyValue.length == 2) {
//                            scheduleItem.put(keyValue[0].trim(), keyValue[1].trim());
//                        }
//                    }
//                    scheduleList.add(scheduleItem);
//                }
//            }

            // JSPにデータを渡す
//            request.setAttribute("plan", plan);
//            request.setAttribute("scheduleList", scheduleList);
//            request.setAttribute("categoryNames", categoryNames);
            // JSPにフォワード
            request.getRequestDispatcher("/WEB-INF/view/user/testDone.jsp").forward(request, response);

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
