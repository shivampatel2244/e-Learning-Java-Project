package Controller;

import DAO.PaymentDataDB;
import Model.PaymentData;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "PaymentServlet", value = "/PaymentServlet")
public class PaymentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sid = req.getParameter("sid");
        String cid = req.getParameter("cid");
        String cname = req.getParameter("cname");
        String ca = req.getParameter("ca");
        String cardno = req.getParameter("cardno");
        String chname = req.getParameter("chname");
        String chmonth = req.getParameter("chmonth");
        String chyear = req.getParameter("chyear");
        String cvv = req.getParameter("cvv");

        PaymentData pd = new PaymentData(sid, cid, cname,ca, cardno, chname, chmonth, chyear, cvv);
        PaymentDataDB pdb = new PaymentDataDB();
        boolean success = pdb.Payment(pd);

        Connection conn = null;
        PreparedStatement pstmt = null;

        String url = "jdbc:mysql://localhost:3306/elearning";
        String username = "root";
        String password = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);

            if (success) {
                String sql = "INSERT INTO user_courses (user_id, course_id) VALUES (?, ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, sid);
                pstmt.setString(2, cid);
                pstmt.executeUpdate();
                resp.sendRedirect(req.getContextPath() + "/?sp_name=ph");
            } else {
                resp.sendRedirect(req.getContextPath() + "/?sp_name=pc");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
