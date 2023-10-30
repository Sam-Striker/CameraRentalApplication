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
    @Column(unique = true)
    private String nationalID;
    private String username;
    private String password;
    private String address;
    private String phoneNbr;
    private LocalDate date;
    @ManyToOne
    @JoinColumn(name = "role_id")
    private Roles role;
    @OneToMany(mappedBy = "user", cascade = CascadeType.PERSIST)
    private List<Camera> cameras;

}
