package com.spring.work2.persistence;

import com.spring.work2.domain.LoginUserDTO;
import com.spring.work2.domain.loginDTO;

public interface LoginRepository {
    public LoginUserDTO findById_PW(loginDTO dto);

    public LoginUserDTO findById(String username);

    public void register(loginDTO dto);

}
