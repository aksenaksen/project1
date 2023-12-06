package com.spring.work2.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.opencsv.bean.CsvBindByName;
import com.opencsv.bean.CsvBindByPosition;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class CsvDTO {

    @JsonProperty("mesure_iem_003_value")
    private String FatPer;

    @JsonProperty("mesure_iem_018_value")
    private String BMI;

    @JsonProperty("mvm_prscrptn_cn")
    private String result;
}
