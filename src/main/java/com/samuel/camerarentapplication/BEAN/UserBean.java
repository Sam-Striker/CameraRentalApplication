package com.samuel.camerarentapplication.BEAN;
import com.samuel.camerarentapplication.MODAL.Roles;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


import java.time.LocalDate;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserBean {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String username;
    private String nationalID;
    private String password;
    private String address;
    private String phoneNbr;
    private LocalDate date;
    private Roles role;
    private String infoMessage;
    private String errorMessage;



}


