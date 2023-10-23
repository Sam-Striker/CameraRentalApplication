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
    @Column(name = "id")
    private int id;

    @Column(name = "serialNbr", unique = true)
    private String serialNbr;

    @Column(name = "model")
    private String model;

    @Column(name = "lense")
    private String lense;

    @Column(name = "status", columnDefinition = "int default 1")
    private int status;

    @Column(name = "rent_status")
    private String rentStatus;

    @Column(name = "date")
    private LocalDate date;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private Users user;

}
