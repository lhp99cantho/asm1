package com.example.demo1.Controller;

import com.example.demo1.Entity.Account;
import com.example.demo1.Entity.Employee;
import com.example.demo1.Service.AccountService;
import com.example.demo1.Service.EmployeeService;
import com.example.demo1.Service.Impl.AccountServiceImpl;
import com.example.demo1.Service.Impl.EmployeeServiceImpl;
import com.google.gson.Gson;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;

@WebServlet("/employee")
public class EmployeeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        EmployeeService employeeService = new EmployeeServiceImpl();
        Employee employee = null;
        if(req.getParameter("view") != null) {
            Integer id = Integer.parseInt(req.getParameter("view"));
            employee = employeeService.getEmpById(id);
            req.setAttribute("emp", employee);
        }
        req.getRequestDispatcher("/forms.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        EmployeeService employeeService = new EmployeeServiceImpl();
        AccountService accountService = new AccountServiceImpl();
        String message;
        BufferedReader reader = req.getReader();
        StringBuilder jsonBuilder = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            jsonBuilder.append(line);
        }

        String jsonData = jsonBuilder.toString();

        Gson gson = new Gson();
        Account account = gson.fromJson(jsonData, Account.class);
        Employee employee = gson.fromJson(jsonData, Employee.class);
        employeeService.saveEmployee(employee, account);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EmployeeService employeeService = new EmployeeServiceImpl();
        BufferedReader reader = req.getReader();
        Gson gson = new Gson();
        Integer id = gson.fromJson(reader, Integer.class);
        employeeService.deleteEmpById(id);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EmployeeService employeeService = new EmployeeServiceImpl();
        BufferedReader reader = req.getReader();
        StringBuilder jsonBuilder = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            jsonBuilder.append(line);
        }
        String jsonData = jsonBuilder.toString();

        Gson gson = new Gson();
        Account account = gson.fromJson(jsonData, Account.class);
        Employee employee = gson.fromJson(jsonData, Employee.class);
        employeeService.updateEmployee(employee, account);
    }

}
