package com.spring.work2.persistence;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.opencsv.*;
import com.opencsv.bean.CsvToBean;
import com.opencsv.bean.CsvToBeanBuilder;
import com.opencsv.exceptions.CsvValidationException;
import com.spring.work2.domain.CsvDTO;
import lombok.extern.log4j.Log4j2;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import java.io.*;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

@Log4j2
public class CsvParser {
    public List<CsvDTO> getList() {
        String filePath = "C:\\Users\\교육생16\\Desktop\\web\\work2\\src\\main\\java\\com\\spring\\work2\\persistence\\data.json";
        // ObjectMapper 생성
        // ObjectMapper 생성
        ObjectMapper objectMapper = new ObjectMapper();
        List<CsvDTO> new_dtoList=new ArrayList<>();

        try {
            // JSON 파일을 List<MyData>로 읽어오기
            List<CsvDTO> dataList = objectMapper.readValue(new File(filePath), new TypeReference<List<CsvDTO>>() {});

            // 읽어온 데이터 사용
            for (CsvDTO myData : dataList) {
                // 추가 필드가 있다면 추가로 출력
                if(myData.getResult().isEmpty()){
                    continue;
                }
                new_dtoList.add(myData);
            }
            log.info(new_dtoList);

        } catch (IOException e) {
            e.printStackTrace();
        }
        return new_dtoList;
    }
}
