package com.spring.work2.controller;


import com.spring.work2.domain.*;
import com.spring.work2.domain.entity.GraphEntity;
import com.spring.work2.service.HealthService;
import com.spring.work2.service.LoginService;
import lombok.RequiredArgsConstructor;

import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/health")
@RequiredArgsConstructor
@Log4j2
public class MainController {
    private final HealthService service;
    private final LoginService loginService;

    @GetMapping("/main")
    public String main(Model model,HttpServletRequest request){
        int howLong=0;
        try{
            howLong=service.lastHealth(request.getSession().getAttribute("ID").toString());
        }
        catch (NullPointerException  e){
            howLong=0;
        }

        System.out.println("how long is------------"+howLong);
        model.addAttribute("Long",howLong);
        return "/main";
    }
    @GetMapping("/list")
    public String healthlist(Model model, @SessionAttribute(value = "ID", required = false) String id,@RequestParam(value = "date",required = false,defaultValue = "") String date){
        if (date == null || date.isEmpty()){
            model.addAttribute("dtoList",service.selectAll(id));
        }
        else{
            log.info(date);
            model.addAttribute("dtoList",service.selectAllDate(id,date));
        }
        return "/health";
    }
    @DeleteMapping("/delete")
    @ResponseBody
    public ResponseEntity<ModifyDTO> delete(@RequestBody ModifyDTO dto){
        service.delete(dto);
        HttpHeaders header= new HttpHeaders();
        header.add("Content-Type","application/json;charset=UTF-8");
        return new ResponseEntity<>(dto,header, HttpStatus.OK);
    }


    @PutMapping("/modify")
    @ResponseBody
    public ResponseEntity<ModifyDTO> modify(@RequestBody ModifyDTO dto){
        HealthInfoDTO dto1 = new HealthInfoDTO();
        dto1.setHid(dto.getHid());
        log.info(dto);
        dto1.setWeight(dto.getWeight());
        dto1.setHEALTHTYPE(dto.getType());
        dto1.setCount(dto.getCnt());
        service.update(dto1);
        HttpHeaders header= new HttpHeaders();
        header.add("Content-Type","application/json;charset=UTF-8");
        return new ResponseEntity<>(dto,header, HttpStatus.OK);
    }
    @PostMapping("/register")
    public String register(addDTO dto,HttpServletRequest req){
        log.info(dto);
        HealthInfoDTO tmpDTO=new HealthInfoDTO(dto);
        log.info(dto);
        service.Insert(tmpDTO,req);
        return "redirect:/health/list";
    }

    @GetMapping("/mypage")
    public String mypage(HttpServletRequest req, Model model){

        LoginUserDTO dto=loginService.findById(req.getSession().getAttribute("ID").toString());
        model.addAttribute("dto",dto);
        return "/mypage";
    }
    @PostMapping("/mypage")
    public String mypagepost(LoginUserDTO dto){
        System.out.println("mypage post");
        service.updateBody(dto);
        service.updateUser(dto);
        return "redirect:/health/main";
    }

    @GetMapping("/update")
    public String updatepage(){

        return "/update";
    }
    @PostMapping("/update")
    public String updatepage(BodyDTO dto,HttpServletRequest req){

        log.info(dto);
        String username=req.getSession().getAttribute("ID").toString();
        dto.setUsername(username);
        dto.setDate(LocalDate.now());
        service.updateBody(dto);
        return "redirect:/health/main";


    }
    @GetMapping("graph")
    public String graph(Model model, HttpServletRequest req,@RequestParam(defaultValue = "day",required = false,value = "day") String param){

        HttpSession session = req.getSession();
        List<BodyDTO> dtoList=null;

        if(service.selectAll(session.getAttribute("ID").toString()).size()==0){
            return "redirect:/main";
        }


//        year
        if(param.equals("year")){
            dtoList=service.selectAllBodyYear(session.getAttribute("ID").toString());
            sendDTO(dtoList,model);

        } else if (param.equals("month")) {
            dtoList=service.selectAllBodyMonth(session.getAttribute("ID").toString());
            sendDTO(dtoList,model);
        }
        else if(param.equals("day")){
            dtoList=service.selectAllBody(session.getAttribute("ID").toString());
            sendDTO(dtoList,model);
        }
//      month
        System.out.println(dtoList.toString());
        return "/graph";
    }


    public void sendDTO(List<BodyDTO> dtoList, Model model){
        List<String> weightList=new ArrayList<>();
        List<String> FatList=new ArrayList<>();
        List<String> MuscleList=new ArrayList<>();
        List<String> DateList=new ArrayList<>();

        for (BodyDTO data : dtoList){
            weightList.add(String.valueOf(data.getWeight()));
            FatList.add(String.valueOf(data.getFat()));
            MuscleList.add(String.valueOf(data.getMuscle_mass()));
            DateList.add(data.getDate().toString());
        }
        System.out.println(DateList.get(0));
        model.addAttribute("weightList",weightList);
        model.addAttribute("FatList",FatList);
        model.addAttribute("MuscleList",MuscleList);
        model.addAttribute("DateList",DateList);
        System.out.println(weightList.size()+" "+DateList.size());
    }

    @PutMapping("/graph/logic")
    @ResponseBody
    public ResponseEntity<CsvDTO> putgraph(@RequestBody(required = false) GraphEntity entity){
        log.info("put mapping logic graph");
        log.info("entity="+entity);

        CsvDTO tmp=service.choice_type(entity.getCurrent_fat());
        log.info(tmp);
        HttpHeaders header= new HttpHeaders();
        header.add("Content-Type","application/json;charset=UTF-8");
        return new ResponseEntity<>(tmp,header, HttpStatus.OK);
    }

}
