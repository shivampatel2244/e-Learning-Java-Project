package Controller;

import DAO.RegistrationDataDB;
import Model.StudData;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="PassUpdateServlet",value = "/PassUpdateServlet")
public class PassUpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String pass = req.getParameter("pass");
        String cp = req.getParameter("cp");

        StudData sd = new StudData(id,pass,cp);
        RegistrationDataDB registrationDataDB = new RegistrationDataDB();
        boolean i = registrationDataDB.updatePasasword(sd);

        if (i) {
            resp.sendRedirect(req.getContextPath() + "/?sp_name=se");
        }
        else
        {
            resp.sendRedirect(req.getContextPath() + "/?sp_name=vp");
        }
    }

}
