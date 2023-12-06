package com.spring.work2.persistence;

import com.spring.work2.domain.BodyDTO;
import com.spring.work2.domain.HealthInfoDTO;
import com.spring.work2.domain.HealthInfoList;
import com.spring.work2.domain.LoginUserDTO;

import java.util.List;

public interface HealthRepository {
    public List<HealthInfoList> selectAll(String username);

    public List<HealthInfoList> selectAllDate(String username , String date);
    public void update(HealthInfoDTO dto);

    public void Insert(HealthInfoDTO dto);

    public void updateUser(LoginUserDTO dto);
    public void updateBody(BodyDTO dto);
    public List<BodyDTO> selectAllBody(String username);
    public HealthInfoDTO lastHealth(String username);

    void delete(int hid);
}
