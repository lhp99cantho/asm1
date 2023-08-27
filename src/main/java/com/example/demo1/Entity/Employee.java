package com.example.demo1.Entity;

import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Employee {
    @Id
    @Column(name = "employee_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    protected Integer employeeId;

    @NotNull
    @Column(name = "first_name", nullable = false)
    protected String firstName;

    @NotNull
    @Column(name = "last_name", nullable = false)
    protected String lastName;

    @NotNull
    @Column(name = "gender", nullable = false)
    protected Integer gender;

    @NotNull
    @Column(name = "date_of_birth", nullable = false)
    protected Date dob;

    @NotNull
    @Column(name = "phone", columnDefinition = "varchar(20)", nullable = false)
    protected String phone;

    protected String address;

    @NotNull
    @Column(name = "department_name", nullable = false)
    protected String departmentName;

    @Column(name = "remark", columnDefinition = "varchar(1000)")
    protected String remark;

    @OneToOne(mappedBy = "employee", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.EAGER)
    protected Account account;
}
