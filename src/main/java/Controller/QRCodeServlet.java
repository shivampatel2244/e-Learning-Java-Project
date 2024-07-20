package Controller;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import DAO.RegistrationDataDB;
import Model.StudData;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet(name = "QRCodeServlet", value = "/QRCodeServlet")
public class QRCodeServlet extends HttpServlet {

    private RegistrationDataDB registrationDataDB;

    @Override
    public void init() throws ServletException {
        super.init();
        registrationDataDB = new RegistrationDataDB();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentId = request.getParameter("id");
        if (studentId == null || studentId.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing student ID");
            return;
        }

        StudData studentData = registrationDataDB.getStudentById(studentId);
        if (studentData == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Student not found");
            return;
        }

        try {
            // Create student data string to encode in QR code
            String studentDataString = String.format(
                    "Name: %s %s\nQualification: %s\nEmail: %s\nGender: %s\nDOB: %s\nPhone: %s",
                    studentData.getSfname(), studentData.getSlname(), studentData.getSqualifiction(),
                    studentData.getSemail(), studentData.getSgender(), studentData.getSdob(), studentData.getSphone()
            );

            // Generate QR code
            QRCodeWriter qrCodeWriter = new QRCodeWriter();
            BitMatrix bitMatrix = qrCodeWriter.encode(studentDataString, BarcodeFormat.QR_CODE, 200, 200);

            // Write QR code to response
            ByteArrayOutputStream pngOutputStream = new ByteArrayOutputStream();
            MatrixToImageWriter.writeToStream(bitMatrix, "PNG", pngOutputStream);
            byte[] pngData = pngOutputStream.toByteArray();

            response.setContentType("image/png");
            response.setContentLength(pngData.length);
            OutputStream outputStream = response.getOutputStream();
            outputStream.write(pngData);
            outputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error generating QR code");
        }
    }
}



//package Controller;
//
//import java.io.IOException;
//import java.util.HashMap;
//import java.util.Map;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.google.zxing.BarcodeFormat;
//import com.google.zxing.EncodeHintType;
//import com.google.zxing.MultiFormatWriter;
//import com.google.zxing.WriterException;
//import com.google.zxing.client.j2se.MatrixToImageWriter;
//import com.google.zxing.common.BitMatrix;
//
//@WebServlet("/QRCodeServlet")
//public class QRCodeServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String url = request.getParameter("url");
//        if (url == null || url.trim().isEmpty()) {
//            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "URL is missing");
//            return;
//        }
//
//        try {
//            Map<EncodeHintType, Object> hints = new HashMap<>();
//            hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
//
//            BitMatrix bitMatrix = new MultiFormatWriter().encode(url, BarcodeFormat.QR_CODE, 200, 200, hints);
//
//            response.setContentType("image/png");
//            MatrixToImageWriter.writeToStream(bitMatrix, "PNG", response.getOutputStream());
//        } catch (WriterException e) {
//            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "QR Code generation error: " + e.getMessage());
//        }
//    }
//}
