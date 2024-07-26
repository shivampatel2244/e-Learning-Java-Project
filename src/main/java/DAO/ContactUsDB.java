package DAO;

import Model.ContactUsData;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ContactUsDB {
    public boolean insertContactUs(ContactUsData contactUs)
    {
        try
        {
            Connection con = myDatabase.getConnection();
            PreparedStatement pst = con.prepareStatement("insert into student_query (stud_id, stud_name, stud_email, stud_message) values (?,?,?,?)");
            pst.setInt(1, contactUs.getStud_id());
            pst.setString(2, contactUs.getStud_name());
            pst.setString(3,contactUs.getStud_email());
            pst.setString(4,contactUs.getStud_message());

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
