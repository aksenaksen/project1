package com.spring.work2.mapper;


import com.opencsv.bean.CsvToBeanBuilder;
import com.spring.work2.domain.BodyDTO;
import com.spring.work2.domain.CsvDTO;
import com.spring.work2.domain.HealthInfoDTO;
import com.spring.work2.domain.loginDTO;
import com.spring.work2.service.HealthService;

import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;
import org.junit.Ignore;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@ExtendWith(SpringExtension.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/root-context.xml"})
@Log4j2
public class mapperTest {
    @Autowired
    HealthMapper healthMapper;



    @Ignore
    @Test
    public void testgetTime(){
        log.info(healthMapper.getTime());
    }
    @Ignore@Test
    public void testLogin(){
        loginDTO dto = new loginDTO();
        dto.setUsername("John");
        dto.setPassword("5470");
        log.info(healthMapper.findById_PW(dto));
    }
    @Ignore @Test
    public void testSelectAll(){
        healthMapper.selectAll("John");
    }
    @Ignore
    @Test
    public void testDateSelect() {

        HealthInfoDTO dto = new HealthInfoDTO();
        dto.setDate(LocalDate.parse("2023-11-07"));
        dto.setUsername("John");
        healthMapper.selectAllDate(dto);
    }

}
