/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.profile;

import controller.auth.BaseAuthenticationController;
import dal.UserDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import model.Account;
import model.User;

/**
 *
 * @author Khangnekk
 */
public class changeUserProfileController extends BaseAuthenticationController {

    protected void doPostProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String regexEmail = "\\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}\\b";
        String regexphoneNum = "(\\+84|0)\\d{9,10}";
        Account acc = (Account) req.getSession().getAttribute("account");
        String username = acc.getUsername();

        UserDBContext uDB = new UserDBContext();
        User currentUser = uDB.getUserByUsername(username);
        int user_id = currentUser.getUser_id();
        String newFullName = req.getParameter("fullName");
        String newParentName = req.getParameter("parentName");
        String newParentEmail = req.getParameter("parentEmail");
        String newPhoneNumber = req.getParameter("phoneNumber");
        boolean newGender = Boolean.parseBoolean(req.getParameter("gender"));
        Date dob = Date.valueOf(req.getParameter("dob"));
        String noti1, noti2, noti3;
        if (!newParentEmail.matches(regexEmail)
                || !newPhoneNumber.matches(regexphoneNum)
                || newPhoneNumber.length() != 10) {
            if (!newParentEmail.matches(regexEmail)) {
                noti1 = "Sai định dạng email";
                req.setAttribute("noti1", noti1);
            }
            if (!newPhoneNumber.matches(regexphoneNum) || newPhoneNumber.length() != 10) {
                noti2 = "Sai định dạng số điện thoại";
                req.setAttribute("noti2", noti2);
            }
//            req.getRequestDispatcher("./changeuserprofile.jsp").forward(req, resp);
        } else {
            User user = new User(user_id, newFullName, dob, newGender, newParentName, newParentEmail, newPhoneNumber, username);
            uDB.update(user);
            req.getSession().setAttribute("user", user);
            noti3 = "Thay dổi thông tin thành công";
            req.setAttribute("noti3", noti3);
        }
        req.getRequestDispatcher("./changeuserprofile.jsp").forward(req, resp);
    }

    protected void doGetProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("./changeuserprofile.jsp").forward(req, resp);
    }

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPostProcess(req, resp);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGetProcess(req, resp);
    }

    public boolean checkInputString(String inputString) {
        return !inputString.isEmpty();
    }

    public boolean isDateValid(Date date) {
        LocalDate currentDate = LocalDate.now();
        LocalDate inputDate = date.toLocalDate();
        return inputDate.isBefore(currentDate) || inputDate.isEqual(currentDate);
    }

    public boolean isValidEmail(String email) {
        // Regular expression để kiểm tra định dạng email
        String regexEmail = "\\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}\\b";

        // Tạo một pattern để so khớp chuỗi đầu vào với regular expression
        Pattern pattern = Pattern.compile(regexEmail);

        // Sử dụng Matcher để kiểm tra chuỗi đầu vào có khớp với pattern hay không
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

    public boolean isVietnamesePhoneNumber(String phoneNumber) {
        String phoneNumberRegex = "^(\\+?84|0)\\d{9,10}$";
        Pattern pattern = Pattern.compile(phoneNumberRegex);

        // Sử dụng Matcher để kiểm tra chuỗi đầu vào có khớp với pattern hay không
        Matcher matcher = pattern.matcher(phoneNumber);
        return matcher.matches();
    }
    
}
