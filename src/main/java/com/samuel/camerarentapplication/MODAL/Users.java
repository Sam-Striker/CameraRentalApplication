package com.samuel.camerarentapplication.MODAL;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;
import java.util.List;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Users {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "nationalID", unique = true)
    private String nationalID;

    @Column(name = "password")
    private String password;

    @Column(name = "address")
    private String address;

    @Column(name = "phoneNbr")
    private String phoneNbr;

    @Column(name = "date")
    private LocalDate date;

    @ManyToOne
    @JoinColumn(name = "role_id")
    private Roles role;
    @OneToMany(mappedBy = "user", cascade = CascadeType.PERSIST)
    private List<Camera> cameras;

}
