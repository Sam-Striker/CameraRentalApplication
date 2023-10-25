package com.samuel.camerarentapplication.BEAN;

import com.samuel.camerarentapplication.MODAL.Users;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Setter
@Getter
public class CameraBean {
    private int id;
    private String serialNbr;
    private String model;
    private String lense;
    private int status;
    private String rentStatus;
    private LocalDate date;
    private Users user;
    private String infoMessage;
    private String errorMessage;
    public CameraBean() {
    }
}
