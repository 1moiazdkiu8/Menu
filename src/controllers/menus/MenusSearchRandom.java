package controllers.menus;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Menu;
import models.User;
import utils.DBUtil;

/**
 * Servlet implementation class MenusSearchRandom
 */
@WebServlet("/menus/search/random")
public class MenusSearchRandom extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenusSearchRandom() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        User login_user = (User) request.getSession().getAttribute("login_user");
        try {
            String[] checked_mood = request.getParameterValues("mood");
            String mood_str = checked_mood[0];
            for (int i = 1; i < checked_mood.length; i++) {
                mood_str += ("," + checked_mood[i]);
            }
            List<Menu> today_options = em.createNamedQuery("searchMenus", Menu.class)
                    .setParameter("user", login_user)
                    .setParameter("mood", "%" + mood_str + "%")
                    .getResultList();
            em.close();
            try {
                Collections.shuffle(today_options);
                ArrayList<Menu> result_list = new ArrayList<Menu>(today_options);
                Menu result = result_list.get(0);

                request.setAttribute("checked", mood_str);
                request.setAttribute("result", result);
                request.setAttribute("today_options", today_options);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/menus/searchRandom.jsp");
                rd.forward(request, response);
            } catch (IndexOutOfBoundsException e) {
                String error_message = "選択された気分のメニュー登録がありません。";
                request.setAttribute("error_message", error_message);
                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/topPage/index.jsp");
                rd.forward(request, response);
            }
        } catch (NullPointerException e) {
            String error_message = "****気分を選択してください****";
            request.setAttribute("error_message", error_message);
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/topPage/index.jsp");
            rd.forward(request, response);
        }
    }
}
