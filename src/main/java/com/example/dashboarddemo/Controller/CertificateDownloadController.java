//package com.example.dashboarddemo.Controller;
//
//import com.itextpdf.text.Document;
//import com.itextpdf.text.DocumentException;
//import com.itextpdf.text.Paragraph;
//import com.itextpdf.text.pdf.PdfWriter;
//import org.springframework.http.HttpHeaders;
//import org.springframework.http.MediaType;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import java.io.ByteArrayOutputStream;
//import java.io.IOException;
//import java.util.Date;
//
//@Controller
//public class CertificateDownloadController {
//
//    @GetMapping("/downloadCertificate")
//    public ResponseEntity<byte[]> downloadCertificate(
//           // @RequestParam("name") String name,
//            //@RequestParam("startDate") String startDate,
//            //@RequestParam("endDate"
//    		 String endDate) {
//
//        String issueDate = new Date().toString(); // Format as needed
//        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
//
//        try {
//            Document document = new Document();
//            PdfWriter.getInstance(document, byteArrayOutputStream);
//            document.open();
//            document.add(new Paragraph("M Square Institute"));
//            document.add(new Paragraph("Certificate of Completion"));
//          //  document.add(new Paragraph("This is to certify that " + name + " has successfully completed the Full Stack Development course from " + startDate + " to " + endDate + "."));
//            document.add(new Paragraph("Issued on: " + issueDate));
//            document.close();
//        } catch (DocumentException e) {
//            e.printStackTrace();
//        }
//
//        // Prepare the response as byte array
//        byte[] pdfBytes = byteArrayOutputStream.toByteArray();
//        HttpHeaders headers = new HttpHeaders();
//        headers.setContentType(MediaType.APPLICATION_PDF);
//        headers.setContentDispositionFormData("attachment", "Certificate_" + ".pdf");
//        headers.setContentLength(pdfBytes.length);
//
//        return ResponseEntity.ok()
//                .headers(headers)
//                .body(pdfBytes);
//    }
//}
