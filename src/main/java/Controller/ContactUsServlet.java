package Controller;

import DAO.ContactUsDB;
import Model.ContactUsData;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ContactUsServlet", value = "/ContactUsServlet")
public class ContactUsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int sid = Integer.parseInt(req.getParameter("sid"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String message = req.getParameter("message");

        ContactUsData cd = new ContactUsData(sid,name,email,message);
        ContactUsDB cud = new ContactUsDB();
        boolean i = cud.insertContactUs(cd);

        if(i)
        {
            resp.sendRedirect(req.getContextPath() + "/?sp_name=cu&toast=success");
        }
        else
        {
            resp.sendRedirect(req.getContextPath() + "/?sp_name=cu&toast=success");
        }
    }
}
