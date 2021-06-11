package controllers.menus;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
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
import models.validators.MenuValidator;
import utils.DBUtil;

/**
 * Servlet implementation class MenusCreateServlet
 */
@WebServlet("/menus/create")
public class MenusCreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenusCreateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String _token = request.getParameter("_token");

        if (_token != null && _token.equals(request.getSession().getId())) {
            EntityManager em = DBUtil.createEntityManager();

            Menu m = new Menu();

            m.setUser((User) request.getSession().getAttribute("login_user"));

            Date menu_date = new Date(System.currentTimeMillis());
            String md_str = request.getParameter("menu_date");
            if (md_str != null && !md_str.equals("")) {
                menu_date = Date.valueOf(request.getParameter("menu_date"));
            }
            m.setMenu_date(menu_date);

            m.setMenu_name(request.getParameter("menu_name"));
            m.setIngredient(request.getParameter("ingredient"));
            m.setContent(request.getParameter("content"));

            Timestamp currentTime = new Timestamp(System.currentTimeMillis());
            m.setCreated_at(currentTime);
            m.setUpdated_at(currentTime);
            try {
                String[] mood = request.getParameterValues("mood");
                String mood_str = mood[0];
                for (int i = 1; i < mood.length; i++) {
                    mood_str += ("," + mood[i]);
                }

                m.setMood(mood_str);
            } catch (NullPointerException e) {

            }
            List<String> errors = MenuValidator.validate(m);
            if (errors.size() > 0) {
                em.close();

                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("menu", m);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/menus/new.jsp");
                rd.forward(request, response);
            } else {
                em.getTransaction().begin();
                em.persist(m);
                em.getTransaction().commit();
                em.close();
                request.getSession().setAttribute("flush", "登録が完了しました。");

                response.sendRedirect(request.getContextPath() + "/menus/index");
            }

        }
    }

}
