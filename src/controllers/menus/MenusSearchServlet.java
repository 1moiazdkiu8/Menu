package controllers.menus;

import java.io.IOException;
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
 * Servlet implementation class MenusSearchServlet
 */
@WebServlet("/menus/search")
public class MenusSearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenusSearchServlet() {
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
        int page;
        try {
            page = Integer.parseInt(request.getParameter("page"));
        } catch (NumberFormatException e) {
            page = 1;
        }
        try {
            String[] checked_mood = request.getParameterValues("mood");
            String mood_str = checked_mood[0];
            for (int i = 1; i < checked_mood.length; i++) {
                mood_str += ("," + checked_mood[i]);
            }

            List<Menu> today_options = em.createNamedQuery("searchMenus", Menu.class)
                    .setParameter("user", login_user)
                    .setParameter("mood", "%" + mood_str + "%")
                    .setFirstResult(15 * (page - 1))
                    .setMaxResults(15)
                    .getResultList();

            long menus_count = (long) em.createNamedQuery("searchMenusCount", Long.class)
                    .setParameter("user", login_user)
                    .setParameter("mood", "%" + mood_str + "%")
                    .getSingleResult();
            em.close();
            request.setAttribute("checked", mood_str);
            request.setAttribute("today_options", today_options);
            request.setAttribute("today_options", today_options);
            request.setAttribute("menus_count", menus_count);
            request.setAttribute("page", page);

            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/menus/search.jsp");
            rd.forward(request, response);

        } catch (NullPointerException e) {
            String error_message = "****気分を選択してください****";
            request.setAttribute("error_message",error_message);
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/topPage/index.jsp");
            rd.forward(request, response);

        }
    }

}