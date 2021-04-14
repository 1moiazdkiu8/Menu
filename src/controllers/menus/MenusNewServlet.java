package controllers.menus;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Menu;

/**
 * Servlet implementation class MenusNewServlet
 */
@WebServlet("/menus/new")
public class MenusNewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenusNewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("_token", request.getSession().getId());

        Menu m = new Menu();
        m.setMenu_date(new Date(System.currentTimeMillis()));
        request.setAttribute("menu", m);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/menus/new.jsp");
        rd.forward(request, response);
    }

}
