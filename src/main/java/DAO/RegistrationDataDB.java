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

    public StudData getStudentById(String id) {
        StudData studData = null;
        try {
            Connection con = myDatabase.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from student_registration where id = ?");
            pst.setString(1, id);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                String sfname = rs.getString("sfname");
                String slname = rs.getString("slname");
                String squalifiction = rs.getString("squalifiaction");
                String semail = rs.getString("semail");
                String sgender = rs.getString("sgender");
                String sdob = rs.getString("sdob");
                String sphone = rs.getString("sphone");
                byte[] simage = rs.getBytes("simage");
                String spassword = rs.getString("spassword");
                studData = new StudData(sfname, slname, squalifiction, semail, sgender, sdob, sphone, simage, spassword);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return studData;
    }
}
