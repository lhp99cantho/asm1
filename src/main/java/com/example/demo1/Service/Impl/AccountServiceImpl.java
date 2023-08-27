package com.example.demo1.Service.Impl;

import com.example.demo1.Entity.Account;
import com.example.demo1.Entity.Employee;
import com.example.demo1.Service.AccountService;
import com.example.demo1.Service.BaseService;
import com.example.demo1.Utils.HibernateUtils;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.io.Serializable;
import java.util.List;

public class AccountServiceImpl extends BaseService<Account> implements AccountService {
    public boolean saveOrUpdateAccount(Account account) {
        return saveOrUpdate(account);
    }

    public Account getAccountById(Integer id) {
        return getById(id, Account.class);
    }

    public boolean deleteAccountById(Integer id) {
        return deleteById(id, Account.class);
    }

    public Account getAccountByUsername(String username) {
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            Account account = null;
            String hql = "FROM Account a WHERE a.account = :username";
            Query<Account> query = session.createQuery(hql, Account.class);
            query.setParameter("username", username);
            account = query.getSingleResult();
            return account;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
