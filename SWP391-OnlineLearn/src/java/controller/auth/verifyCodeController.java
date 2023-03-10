/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.auth;

import controller.payment.*;
import dal.AccountDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.Account;

/**
 *
 * @author Khangnekk
 */
public class verifyCodeController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }
    
    void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String verifyCode = req.getParameter("confirm").trim();
        
        HttpSession verifyPremium = req.getSession();
        String Code = String.valueOf(verifyPremium.getAttribute("verifyCode"));
        
        req.setAttribute("tk", "Thank you!");
        
        if(verifyCode.equals(Code)){
            req.setAttribute("alertTitle", "Thank you!");
            AccountDBContext accdb = new AccountDBContext();
            Account acc = (Account) req.getSession().getAttribute("newAccount");
            accdb.signup(acc.getUsername(), acc.getPassword());
            
            req.getRequestDispatcher("./verifySuccessful.jsp").forward(req, resp);
        }else{
            req.setAttribute("alertTitle", "Sorry!");
            req.getRequestDispatcher("./verifyFail.jsp").forward(req, resp);
//            req.getRequestDispatcher("afterVerifyCode.jsp").forward(req, resp);
        }
    }
    
}
