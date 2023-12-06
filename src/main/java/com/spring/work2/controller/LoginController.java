package com.spring.work2.controller;


import com.spring.work2.domain.LoginUserDTO;
import com.spring.work2.domain.loginDTO;
import com.spring.work2.service.LoginService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@Log4j2
@RequiredArgsConstructor
public class LoginController {
    private final LoginService service;
    @GetMapping("/login")
    public String login(){
        return "login";
    }
    @PostMapping("/login")
    public String loginAuth(@ModelAttribute loginDTO dto, HttpServletResponse res, HttpServletRequest request){
        LoginUserDTO L_dto = service.login(dto);
        if (L_dto == null){
            return "redirect:/login";
        }

        HttpSession session=request.getSession(true);
        log.info(session);
        session.setAttribute("ID",dto.getUsername());
        System.out.println("ID"+session.getAttribute("ID"));


        return "redirect:health/main";
    }
    @PostMapping("/logout")
    public String logout(HttpServletRequest request){
        HttpSession session=request.getSession(true);
        log.info(session);
        session.removeAttribute("ID");
        System.out.println("ID"+session.getAttribute("ID"));
        return "redirect:login";
    }
    @PostMapping("/register")
    public String register(loginDTO dto){
        log.info(dto);
        service.register(dto);
        return "redirect:/login";
    }

    @PostMapping("/checkID")
    @ResponseBody
    public ResponseEntity<Boolean> check(@RequestBody Map<String, String> requestData){
        HttpHeaders header= new HttpHeaders();
        String ID = requestData.get("ID");
        log.info(ID);
        log.info("here");
        header.add("Content-Type","application/json;charset=UTF-8");
        if (service.findById(ID)==null){
            return new ResponseEntity<>(true,header, HttpStatus.OK);
        }
        return new ResponseEntity<>(false,header, HttpStatus.OK);
    }

}
