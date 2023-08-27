package com.example.demo1.Entity;

import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.UniqueElements;

import javax.persistence.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "account_id")
    protected Integer accountId;

    @NotNull
    @Column(name = "account", nullable = false, unique = true)
    protected String account;

    @NotNull
    @Column(name = "email", nullable = false, unique = true)
    protected String email;

    @NotNull
    @Column(name = "password", nullable = false)
    protected String password;

    protected Integer status;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "employee_id")
    protected Employee employee;
}
