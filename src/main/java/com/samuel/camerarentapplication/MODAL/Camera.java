package com.samuel.camerarentapplication.MODAL;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.io.Serializable;
import java.time.LocalDate;

@Entity
@Getter
@Setter
@ToString
@Table(name = "camera")
public class Camera implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(unique = true)
    private String serialNbr;
    private String model;
    private String lense;
    private int status;
    private String rentStatus;
    private LocalDate date;
    @ManyToOne
    @JoinColumn(name = "user_id")
    private Users user;

}
