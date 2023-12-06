package com.spring.work2.domain;

import lombok.Data;

@Data
public class LoginUserDTO {
    private String username;
    private String password;
    private int weight;
    private int height;
    private int fat;
    private int muscle_mass;
}
