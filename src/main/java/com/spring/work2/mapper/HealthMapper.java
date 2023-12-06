package com.spring.work2.mapper;

import com.spring.work2.domain.*;

import java.util.List;

public interface HealthMapper {
    public String getTime();
    public LoginUserDTO findById_PW(loginDTO dto);

    public LoginUserDTO findById(String username);
    public List<HealthInfoList> selectAll(String username);

    public List<HealthInfoList> selectAllDate(HealthInfoDTO dto);
    public void Insert(HealthInfoDTO dto);
    public void update(HealthInfoDTO dto);

    public HealthInfoDTO last(String username);
    public void register(LoginUserDTO dto);

    public void updateUser(LoginUserDTO dto);
    public void updateBody(BodyDTO dto);
    public void updateBodyFromUser(LoginUserDTO dto);
    public void delete(int hid);

    public List<BodyDTO> selectAllBody(String username);
}
