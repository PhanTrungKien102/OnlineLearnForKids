/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.payment;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author Khangnekk
 */
public class completePaymentController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String creditCardNumRegex = "^4[0-9]{12}(?:[0-9]{3})?$";
        String mmyyRegex = "^(0[1-9]|1[0-2])\\/([0-9]{2})$";
        String ccvRegex = "^[0-9]{3,4}$";

        String creditCardNum = req.getParameter("creditCardNum").replaceAll("\\s", "");
        String mmyyNum = req.getParameter("mmyyNum");
        String ccvNum = req.getParameter("ccvNum");
        String noti1, noti2, noti3;

        if (creditCardNum.matches(creditCardNumRegex)
                && mmyyNum.matches(mmyyRegex)
                && ccvNum.matches(ccvRegex)) {
            req.getRequestDispatcher("./emailAcception.html").forward(req, resp);
        } else if (creditCardNum.isEmpty()
                || mmyyNum.isEmpty()
                || ccvNum.isEmpty()) {
            if (creditCardNum.isEmpty()) {
                noti1 = "Phần này là bắt buộc";
                req.setAttribute("noti1", noti1);
            }
            if (mmyyNum.isEmpty()) {
                noti2 = "Phần này là bắt buộc";
                req.setAttribute("noti2", noti2);
            }
            if (ccvNum.isEmpty()) {
                noti3 = "Phần này là bắt buộc";
                req.setAttribute("noti3", noti3);
            }
        } else {
            if (!creditCardNum.matches(creditCardNumRegex)) {
                noti1 = "Sai định dạng số thẻ";
                req.setAttribute("noti1", noti1);
            }
            if (!mmyyNum.matches(mmyyRegex)) {
                noti2 = "Sai định dạng MM/YY";
                req.setAttribute("noti2", noti2);
            }
            if (!ccvNum.matches(ccvRegex)) {
                noti3 = "Sai định dạng mã ccv";
                req.setAttribute("noti3", noti3);
            }

        }
        req.getRequestDispatcher("./CompletePayment.jsp").forward(req, resp);

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("./CompletePayment.jsp").forward(req, resp);
    }

}
