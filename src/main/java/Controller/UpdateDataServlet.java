package Controller;

import DAO.RegistrationDataDB;
import Model.StudData;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "UpdateDataServlet", value = "/UpdateDataServlet")
public class UpdateDataServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String sfname = req.getParameter("sfname");
        String slname = req.getParameter("slname");
        String squalification = req.getParameter("squalification");
        String semail = req.getParameter("semail");
        String sgender = req.getParameter("sgender");
        String sdob = req.getParameter("sdob");
        String sphone = req.getParameter("sphone");

        StudData sd = new StudData(sfname,slname,squalification,semail,sgender,sdob,sphone,id);
        RegistrationDataDB registrationDataDB = new RegistrationDataDB();
        boolean i = registrationDataDB.updateStudent(sd);

        if(i)
        {
            resp.sendRedirect(req.getContextPath() + "/?sp_name=vp");
        }
        else
        {
            resp.sendRedirect(req.getContextPath() + "/?sp_name=vp");
        }
    }
}
