package com.example.demo1.Controller;

import com.example.demo1.Entity.Account;
import com.example.demo1.Service.AccountService;
import com.example.demo1.Service.Impl.AccountServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.getRequestDispatcher("/login.jsp").forward(req, res);
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        AccountService accountService = new AccountServiceImpl();
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String error;

        Account db = accountService.getAccountByUsername(username);
        if (db.getAccount().equals(username)) {
            if (db.getPassword().equals(password)) {
                HttpSession session = req.getSession();
                session.setAttribute("user", username);
            }
            res.sendRedirect("/list");
        } else {
            error = "Username or password is incorrect";
            req.setAttribute("error", error);
            req.getRequestDispatcher("/login").forward(req, res);
        }
    }
}
