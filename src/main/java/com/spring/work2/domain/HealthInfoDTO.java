package com.spring.work2.domain;


import lombok.Data;

import java.sql.Date;
import java.time.LocalDate;

@Data
public class HealthInfoDTO {
    private int hid;
    private String username;
    private String HEALTHTYPE;
    private int weight;
    private int count;
    private LocalDate date;
    private Date SqlDate;
    public HealthInfoDTO(addDTO dto) {
        this.hid = dto.getHid();
        this.username = dto.getUsername();
        this.HEALTHTYPE = dto.getHealthtype();
        this.weight = dto.getWeight();
        this.count = dto.getCount();
        if (dto.getDate().isEmpty()) {
            this.date = LocalDate.now();
            this.SqlDate = Date.valueOf(this.date);
        } else {
            this.date = LocalDate.parse(dto.getDate());
            this.SqlDate = Date.valueOf(date);
        }
    }
    public HealthInfoDTO(){};
}
