package com.spring.work2.service;

import com.spring.work2.domain.LoginUserDTO;
import com.spring.work2.domain.loginDTO;

public interface LoginService {
    public LoginUserDTO login(loginDTO dto);

    public LoginUserDTO findById(String username);

    public void register(loginDTO dto);

}
