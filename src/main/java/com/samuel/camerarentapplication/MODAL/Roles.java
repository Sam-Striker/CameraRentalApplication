package com.samuel.camerarentapplication.MODAL;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "roles")
public class Roles {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "role_id")
    private int role_id;

    @Column(name = "role_name", unique = true)
    private String role_name;

    @OneToMany(mappedBy = "role")
    private List<Users> users;
}
