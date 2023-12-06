package com.spring.work2.persistence;

import com.spring.work2.domain.BodyDTO;
import com.spring.work2.domain.HealthInfoDTO;
import com.spring.work2.domain.HealthInfoList;
import com.spring.work2.domain.LoginUserDTO;
import com.spring.work2.mapper.HealthMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class HealthRepositoryImpl implements HealthRepository{
    private final HealthMapper mapper;


    public List<HealthInfoList> selectAll(String username){
        return mapper.selectAll(username);
    }

    public List<HealthInfoList> selectAllDate(String username , String date){
        HealthInfoDTO dto = new HealthInfoDTO();

        dto.setUsername(username);
        dto.setDate(LocalDate.parse(date));

        return mapper.selectAllDate(dto);
    }
    public void update(HealthInfoDTO dto){
        mapper.update(dto);
    }
    public void Insert(HealthInfoDTO dto){
        mapper.Insert(dto);
    }

    @Override
    public void updateUser(LoginUserDTO dto) {
        mapper.updateUser(dto);
    }

    @Override
    public void updateBody(BodyDTO dto) {
        mapper.updateBody(dto);
    }
    @Override
    public List<BodyDTO> selectAllBody(String username){
        return mapper.selectAllBody(username);
    }
    @Override
    public void delete(int hid) {
        mapper.delete(hid);
    }
    @Override
    public HealthInfoDTO lastHealth(String username) { return mapper.last(username);}


}
