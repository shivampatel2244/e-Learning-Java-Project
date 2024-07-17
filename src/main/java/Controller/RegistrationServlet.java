package Controller;

import DAO.RegistrationDataDB;
import Model.StudData;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

@WebServlet(name = "RegistrationServlet", value = "/RegistrationServlet")
@MultipartConfig(maxFileSize = 104857600) // 100MB
public class RegistrationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fname = req.getParameter("fname");
        String lname = req.getParameter("lname");
        String email = req.getParameter("email");
        String gender = req.getParameter("gender");
        String mobile = req.getParameter("mobile");
        String qualification = req.getParameter("qualification");
        String dob = req.getParameter("dob");
        String pass = req.getParameter("pass");

        Part image = req.getPart("image");
        InputStream inputStream = image.getInputStream();
        byte[] dp = readBytesFromInputStream(inputStream);

        StudData data = new StudData(fname,lname,qualification,email,gender,dob,mobile,dp,pass);
        RegistrationDataDB rd = new RegistrationDataDB();
        boolean insert = rd.Register(data);

        if(insert)
        {
            resp.sendRedirect(req.getContextPath() + "/Login.jsp?s=r");
        }
        else
        {
            resp.sendRedirect(req.getContextPath() + "/RegistrationPage.jsp?s=nr");
        }

    }

    private byte[] readBytesFromInputStream(InputStream inputStream) throws IOException {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        int bytesRead;
        byte[] data = new byte[1024];
        while ((bytesRead = inputStream.read(data, 0, data.length)) != -1) {
            buffer.write(data, 0, bytesRead);
        }
        return buffer.toByteArray();
    }
}

