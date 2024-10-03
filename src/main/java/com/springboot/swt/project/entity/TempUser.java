package com.springboot.swt.project.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "temp_user")
public class TempUser {


    @Id
    @Column(nullable = false, unique = true)
    private String email;

    @Column
    private String otp;

    // Default constructor
    public TempUser() {
    }

    // Constructor with fields
    public TempUser(String email, String otp) {
        this.email = email;
        this.otp = otp;

    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getOtp() {
        return otp;
    }

    public void setOtp(String otp) {
        this.otp = otp;
    }

    @Override
    public String toString() {
        return "TempUser [email=" + email + ", otp=" + otp + "]";
    }


}

