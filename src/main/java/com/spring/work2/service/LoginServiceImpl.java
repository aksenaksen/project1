package com.spring.work2.service;

import com.spring.work2.domain.LoginUserDTO;
import com.spring.work2.domain.loginDTO;
import com.spring.work2.persistence.LoginRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;


@Service
@RequiredArgsConstructor
public class LoginServiceImpl implements LoginService{
    private final LoginRepository repository;
    @Override
    public LoginUserDTO login(loginDTO dto) {
        return repository.findById_PW(dto);
    }
    @Override
    public void register(loginDTO dto){
        repository.register(dto);
    }

    @Override
    public LoginUserDTO findById(String username){
        return repository.findById(username);
    };
}
