package DAO;

import Model.StudData;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RegistrationDataDB {
    public boolean Register(StudData data) {
        try {
            Connection con = myDatabase.getConnection();
            PreparedStatement pst = con.prepareStatement("insert into student_registration (sfname, slname, squalifiaction, semail, sgender, sdob, sphone, simage, spassword) values (?,?,?,?,?,?,?,?,?)");
            pst.setString(1, data.getSfname());
            pst.setString(2, data.getSlname());
            pst.setString(3, data.getSqualifiction());
            pst.setString(4, data.getSemail());
            pst.setString(5, data.getSgender());
            pst.setString(6, data.getSdob());
            pst.setString(7, data.getSphone());
            pst.setBytes(8, data.getSimage());
            pst.setString(9, data.getSpassword());

            int success = pst.executeUpdate();
            return success > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean loginStudent(StudData student) {
        try {
            Connection con = myDatabase.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from student_registration where semail = ? and spassword = ?");
            pst.setString(1, student.getSemail());
            pst.setString(2, student.getSpassword());
            ResultSet rs = pst.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateStudent(StudData std) {

        try {
            Connection con = myDatabase.getConnection();
            PreparedStatement pst = con.prepareStatement("update student_registration set sfname = ?,slname = ?,squalifiaction = ?,semail = ?,sgender = ?, sdob = ?,sphone = ? where id = ?");
            pst.setString(1,std.getSfname());
            pst.setString(2, std.getSlname());
            pst.setString(3, std.getSqualifiction());
            pst.setString(4,std.getSemail());
            pst.setString(5,std.getSgender());
            pst.setString(6,std.getSdob());
            pst.setString(7, std.getSphone());
            pst.setString(8, std.getSid());

            return pst.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updatePasasword(StudData std)
    {
        try {
            Connection con = myDatabase.getConnection();

            // Check if the old password matches for the given ID
            PreparedStatement pstCheck = con.prepareStatement("SELECT * FROM student_registration WHERE id=? AND spassword=?");
            pstCheck.setString(1, std.getSid());
            pstCheck.setString(2, std.getSpassword());
            ResultSet rs = pstCheck.executeQuery();

            if (rs.next()) {
                // Old password matches, update to new password
                PreparedStatement pstUpdate = con.prepareStatement("UPDATE admin_profile SET password=? WHERE id=?");
                pstUpdate.setString(1, std.getSnpassword());
                pstUpdate.setString(2, std.getSid());

                return pstUpdate.executeUpdate() > 0;
            } else {
                // Old password does not match
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
