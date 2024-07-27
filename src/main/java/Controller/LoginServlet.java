package Controller;

import DAO.RegistrationDataDB;
import Model.StudData;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        resp.setContentType("text/html");
        String email = req.getParameter("email");
        String pass = req.getParameter("pass");

        StudData sd = new StudData(email, pass);
        RegistrationDataDB rdb = new RegistrationDataDB();
        boolean valid = rdb.loginStudent(sd);

        if (valid) {
            String em = email;
            Cookie cookie = new Cookie("em",em);
            resp.addCookie(cookie);
            resp.sendRedirect(req.getContextPath() + "/?sp_name=hm&t=s");
        } else {
            resp.sendRedirect(req.getContextPath() + "/Login.jsp?t=nl");
        }
    }
}
