package com.example.demo1.Service;

import com.example.demo1.Entity.Account;

import java.io.Serializable;

public interface AccountService {
    boolean saveOrUpdateAccount(Account account);
    Account getAccountById(Integer id);
    boolean deleteAccountById(Integer id);

    Account getAccountByUsername(String username);

}
