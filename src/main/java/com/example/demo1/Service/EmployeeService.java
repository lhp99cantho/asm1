package com.example.demo1.Service;

import com.example.demo1.Entity.Account;
import com.example.demo1.Entity.Employee;

import java.io.Serializable;
import java.util.List;

public interface EmployeeService {
    boolean saveEmployee(Employee employee, Account account);

    Employee getEmpById(Integer id);

    boolean deleteEmpById(Integer id);

    boolean updateEmployee(Employee employee, Account account);

    List<Employee> findEmpByName(String employeeName);

    List<Employee> findAllEmp();
}
