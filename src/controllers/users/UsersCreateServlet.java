package controllers.users;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.User;
import models.validators.UserValidator;
import utils.DBUtil;
import utils.EncryptUtil;

/**
 * Servlet implementation class EmployeesCreateServlet
 */
@WebServlet("/users/create")
public class UsersCreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsersCreateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        User u = new User();

        u.setName(request.getParameter("name"));
        u.setPassword(request.getParameter("password"));

        Timestamp currentTime = new Timestamp(System.currentTimeMillis());
        u.setCreated_at(currentTime);
        u.setUpdated_at(currentTime);
        u.setDelete_flag(0);

        List<String> errors = UserValidator.validate(u, true, true);
        if (errors.size() > 0) {
            em.close();

            request.setAttribute("_token", request.getSession().getId());
            request.setAttribute("user", u);
            request.setAttribute("errors", errors);

            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/users/new.jsp");
            rd.forward(request, response);
        } else {
            u.setPassword(
                    EncryptUtil.getPasswordEncrypt(
                            request.getParameter("password"),
                            (String) this.getServletContext().getAttribute("pepper")));

            em.getTransaction().begin();
            em.persist(u);
            em.getTransaction().commit();
            request.getSession().setAttribute("flush", "ユーザー登録が完了しました。");
            em.close();
            response.sendRedirect(request.getContextPath() + "/");

        }
    }

}
