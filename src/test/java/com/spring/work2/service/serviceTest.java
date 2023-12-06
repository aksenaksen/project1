package com.spring.work2.service;


import com.spring.work2.domain.BodyDTO;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;

@ExtendWith(SpringExtension.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/root-context.xml"})
@Log4j2
public class serviceTest {
    @Autowired
    HealthService service;


    @Test
    public void MonthTest(){
        List<BodyDTO> dto=service.selectAllBodyMonth("John");
        log.info(dto);
    }

}
