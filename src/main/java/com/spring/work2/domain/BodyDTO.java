package com.spring.work2.domain;

import lombok.Data;

import java.time.LocalDate;


@Data
public class BodyDTO {
    private int cid;
    private LocalDate date;
    private String username;
    private int weight;
    private int fat;
    private int muscle_mass;



}
