package com.example.demo1.Service.Impl;

import com.example.demo1.Entity.Account;
import com.example.demo1.Entity.Employee;
import com.example.demo1.Service.BaseService;
import com.example.demo1.Service.EmployeeService;
import com.example.demo1.Utils.HibernateUtils;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.io.Serializable;
import java.util.List;

public class EmployeeServiceImpl extends BaseService<Employee> implements EmployeeService {
    public boolean saveEmployee(Employee employee, Account account) {
        try(Session session = HibernateUtils.getSessionFactory().openSession()) {
            Transaction transaction = session.beginTransaction();
            Integer id = (Integer) session.save(employee);
            Employee dbEmployee = session.find(Employee.class, id);
            account.setEmployee(dbEmployee);
            session.save(account);
            transaction.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateEmployee(Employee employee, Account account) {
        try(Session session = HibernateUtils.getSessionFactory().openSession()) {
            Transaction transaction = session.beginTransaction();
            Employee dbEmp = (Employee) session.merge(employee);
            account.setEmployee(dbEmp);
            session.merge(account);
            transaction.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public Employee getEmpById(Integer id) {
        return getById(id, Employee.class);
    }
    public boolean deleteEmpById(Integer id) {
        return deleteById(id, Employee.class);
    }

    public List<Employee> findEmpByName(String name) {
        List<Employee> rsEmp = null;
        try (Session session = HibernateUtils.getSessionFactory().openSession()){
            String hql = "FROM Employee u WHERE u.firstName = :name";
            Query<Employee> query = session.createQuery(hql, Employee.class);
            query.setParameter("name", name);
            rsEmp = query.getResultList();
            return rsEmp;
        } catch (Exception e) {
            e.printStackTrace();
            return rsEmp;
        }
    }

    public List<Employee> findAllEmp() {
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            List<Employee> rsEmp = null;
            String hql = "FROM Employee";
            Query<Employee> query = session.createQuery(hql, Employee.class);
            rsEmp = query.getResultList();
            return rsEmp;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
