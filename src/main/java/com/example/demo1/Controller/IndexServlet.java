package com.example.demo1.Controller;

import com.example.demo1.Entity.Account;
import com.example.demo1.Entity.Employee;
import com.example.demo1.Service.AccountService;
import com.example.demo1.Service.EmployeeService;
import com.example.demo1.Service.Impl.AccountServiceImpl;
import com.example.demo1.Service.Impl.EmployeeServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

@WebServlet("/list")
public class IndexServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        EmployeeService employeeService = new EmployeeServiceImpl();
        List<Employee> list = null;
        if(req.getParameter("search") != null) {
            list = employeeService.findEmpByName(req.getParameter("search"));
        } else {
            list = employeeService.findAllEmp();
        }
        req.setAttribute("listEmp", list);
        req.getRequestDispatcher("/list.jsp").forward(req, res);
    }
}
