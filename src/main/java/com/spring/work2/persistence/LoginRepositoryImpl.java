package com.spring.work2.persistence;


import com.spring.work2.domain.LoginUserDTO;
import com.spring.work2.domain.loginDTO;
import com.spring.work2.mapper.HealthMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Repository;
import org.springframework.test.context.ContextConfiguration;
@Log4j2
@Repository
@RequiredArgsConstructor
public class LoginRepositoryImpl implements LoginRepository{
    private final HealthMapper healthMapper;
    @Override
    public LoginUserDTO findById_PW(loginDTO dto) {return healthMapper.findById_PW(dto);}

    @Override
    public LoginUserDTO findById(String username){
        return healthMapper.findById(username);
    }

    @Override
    public void register(loginDTO dto) {
        LoginUserDTO dto1=new LoginUserDTO();
        dto1.setUsername(dto.getUsername());
        dto1.setPassword(dto.getPassword());
        dto1.setWeight(0);
        dto1.setHeight(0);
        dto1.setMuscle_mass(10);
        dto1.setFat(0);
        log.info(dto1.toString());
        healthMapper.register(dto1);
    }

    ;
}
