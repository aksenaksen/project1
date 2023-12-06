package com.spring.work2.persistence.config;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MailConfig {
    @Value("${spring.mail.password}")
    private String password;




}
