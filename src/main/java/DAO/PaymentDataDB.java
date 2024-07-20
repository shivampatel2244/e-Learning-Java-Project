package DAO;


import Model.PaymentData;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class PaymentDataDB {
    public boolean Payment(PaymentData paymentData)
    {
        try
        {
            Connection con = myDatabase.getConnection();
            PreparedStatement pst = con.prepareStatement("insert into student_payment (sid, cid, cname,camount, cardno, chname, chmonth, chyear, cvv) values (?,?,?,?,?,?,?,?,?)");
            pst.setString(1,paymentData.getSid());
            pst.setString(2, paymentData.getCid());
            pst.setString(3, paymentData.getCname());
            pst.setString(4, paymentData.getCamount());
            pst.setString(5, paymentData.getCardno());
            pst.setString(6, paymentData.getChname());
            pst.setString(7, paymentData.getChmonth());
            pst.setString(8, paymentData.getChyear());
            pst.setString(9, paymentData.getCvv());

            int success = pst.executeUpdate();
            return success > 0;
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return false;
        }
    }
}
