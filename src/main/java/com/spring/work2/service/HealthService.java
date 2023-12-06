package com.spring.work2.service;

import com.spring.work2.domain.*;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public interface HealthService {
    List<HealthInfoList> selectAll(String username);
    List<HealthInfoList> selectAllDate(String username, String date);

    void update(HealthInfoDTO dto);

    void delete(ModifyDTO dto);

    void Insert(HealthInfoDTO dto, HttpServletRequest req);
    public void updateUser(LoginUserDTO dto);
    public void updateBody(BodyDTO dto);
    public void updateBody(LoginUserDTO dto);
    public List<BodyDTO> selectAllBody(String username);
    public List<BodyDTO> selectAllBodyMonth(String username);
    public int lastHealth(String username);
    public List<BodyDTO> selectAllBodyYear(String username);

    CsvDTO choice_type(double bmi);

    List<CsvDTO> getList();
}
