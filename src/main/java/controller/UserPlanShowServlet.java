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

import dao.CategoryDao;
import dao.DaoFactory;
import dao.PlanDao;
import domain.Category;
import domain.Plan;

@WebServlet("/user/planShow")
public class UserPlanShowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // 前のページURLをセッションに格納
            String previousPage = request.getHeader("Referer");
            if (previousPage != null) {
                request.getSession().setAttribute("previousPage", previousPage);
            }

            // パラメータからIDを取得
            int id = Integer.parseInt(request.getParameter("id"));
            System.out.println("Plan ID: " + id); // デバッグログ

            // プランを取得
            PlanDao planDao = DaoFactory.createPlanDao();
            Plan plan = planDao.findById(id);
            if (plan != null) {
                System.out.println("Plan found: " + plan.getTitle());
            } else {
                System.out.println("No plan found for ID: " + id);
            }
            request.setAttribute("plan", plan);

            // カテゴリ名リストを取得
            List<String> categoryNames = new ArrayList<>();
            if (plan != null && plan.getCategoryIds() != null) {
                CategoryDao categoryDao = DaoFactory.createCategoryDao();
                for (Integer categoryId : plan.getCategoryIds()) {
                    System.out.println("Fetching category for ID: " + categoryId); // デバッグログ
                    Category category = categoryDao.getCategoryById(categoryId);
                    if (category != null) {
                        System.out.println("Category found: " + category.getName());
                        categoryNames.add(category.getName());
                    } else {
                        System.out.println("No category found for ID: " + categoryId);
                    }
                }
            }
            request.setAttribute("categoryNames", categoryNames);

            // スケジュールを取得しMapに変換
            if (plan != null) {
                String scheduleText = plan.getSchedule();
                if (scheduleText != null && !scheduleText.isEmpty()) {
                    System.out.println("Processing schedule text...");
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
                    request.setAttribute("scheduleList", scheduleList);
                }
            }

            // フォワード
            request.getRequestDispatcher("/WEB-INF/view/user/planShow.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace(); // デバッグログ
            throw new ServletException(e);
        }
    }
}
