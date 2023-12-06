package com.spring.work2.service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.work2.domain.*;
import com.spring.work2.persistence.HealthRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Random;

@Service
@RequiredArgsConstructor
public class HealthServiceImpl implements HealthService{
    private final HealthRepository repository;
    @Override
    public List<HealthInfoList> selectAll(String username) {
        return repository.selectAll(username);

    }

    @Override
    public List<HealthInfoList> selectAllDate(String username, String date) {
        return repository.selectAllDate(username,date);
    }

    @Override
    public void update(HealthInfoDTO dto) {
        repository.update(dto);
        return;
    }

    @Override
    public void delete(ModifyDTO dto) {
        repository.delete(dto.getHid());
    }

    @Override
    public void Insert(HealthInfoDTO dto, HttpServletRequest req) {
        HttpSession session=req.getSession();
        String username=session.getAttribute("ID").toString();
        dto.setUsername(username);
        repository.Insert(dto);
    }

    @Override
    public void updateUser(LoginUserDTO dto) {
        repository.updateUser(dto);
    }

    @Override
    public void updateBody(LoginUserDTO dto) {
        BodyDTO new_dto= new BodyDTO();
        new_dto.setUsername(dto.getUsername());
        new_dto.setDate(LocalDate.now());
        new_dto.setFat(dto.getFat());
        new_dto.setMuscle_mass(dto.getMuscle_mass());
        new_dto.setWeight(dto.getWeight());
        repository.updateBody(new_dto);
    }
    @Override
    public void updateBody(BodyDTO dto){
        repository.updateBody(dto);
    };
    @Override
    public List<BodyDTO> selectAllBody(String username){

        List<BodyDTO> dtoList = repository.selectAllBody(username);
        dtoList.sort(Comparator.comparing(BodyDTO::getDate));
        return dtoList;
    }
    @Override
    public List<BodyDTO> selectAllBodyMonth(String username){
        List<BodyDTO> dtoList = repository.selectAllBody(username);
        List<BodyDTO> monthList=new ArrayList<>();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM");
        dtoList.sort(Comparator.comparing(BodyDTO::getDate));
        LocalDate PrevDate=null;
        int max=0;
        int max_index=-1;
        for(int i=0;i<dtoList.size();i++){
            if (PrevDate==null){
                PrevDate=dtoList.get(i).getDate();
            }
            LocalDate date= dtoList.get(i).getDate();
            if (PrevDate.getYear() == date.getYear() && PrevDate.getMonth() == date.getMonth()){
//같은년 같은 달끼리 처리하는로직
                int mass=dtoList.get(i).getMuscle_mass();
                if (mass>max){
                    System.out.println(date.getMonth());
                    max=mass;
                    max_index=i;
                }
            }
            else{
                System.out.println(PrevDate.getMonth()+" "+date.getMonth());
                monthList.add(dtoList.get(max_index));
                max_index=i;
                max=0;
                PrevDate=date;
            }
            if(i==dtoList.size()-1){
                monthList.add(dtoList.get(max_index));
            }
        }
        return monthList;
    }

    @Override
    public List<BodyDTO> selectAllBodyYear(String username) {
        List<BodyDTO> dtoList = repository.selectAllBody(username);
        List<BodyDTO> yearList=new ArrayList<>();

        dtoList.sort(Comparator.comparing(BodyDTO::getDate));
        LocalDate PrevDate=null;
        int max=0;
        int max_index=-1;
        for(int i=0;i<dtoList.size();i++){
            if (PrevDate==null){
                PrevDate=dtoList.get(i).getDate();
            }
            LocalDate date= dtoList.get(i).getDate();
            if (PrevDate.getYear() == date.getYear()){
//같은년 같은 달끼리 처리하는로직
                int mass=dtoList.get(i).getMuscle_mass();
                if (mass>max){
                    System.out.println(date.getMonth());
                    max=mass;
                    max_index=i;
                }
            }
            else{
                System.out.println(PrevDate.getMonth()+" "+date.getMonth());
                yearList.add(dtoList.get(max_index));
                max_index=i;
                max=0;
                PrevDate=date;
            }
            if(i==dtoList.size()-1){
                yearList.add(dtoList.get(max_index));
            }
        }
        return yearList;
    }
    @Override
    public int lastHealth(String username){
        HealthInfoDTO dto=repository.lastHealth(username);
        LocalDate date=dto.getDate();
        LocalDate DateNow=LocalDate.now();
        long diffrence = ChronoUnit.DAYS.between(date, DateNow);
        return (int)diffrence;
    }
    @Override
    public CsvDTO choice_type(double bmi){
        List<CsvDTO> list=getList();
        List<CsvDTO> listH=new ArrayList<>();
        for(CsvDTO tmp: list){
            if(Double.parseDouble(tmp.getBMI())-bmi<=1.5 && Double.parseDouble(tmp.getBMI())-bmi>=-1.5){
//                System.out.println(tmp.getBMI()+" "+bmi);
                listH.add(tmp);
            }
        }
        Random random = new Random();
        if(listH.size()==0){
            int randomIndex = random.nextInt(list.size());
            return list.get(randomIndex);
        }
        int randomIndex = random.nextInt(listH.size());
        return listH.get(randomIndex);
    }

    @Override
    public List<CsvDTO> getList() {
        String filePath = "C:\\Users\\교육생16\\Desktop\\web\\work2\\src\\main\\java\\com\\spring\\work2\\persistence\\data.json";
        ObjectMapper objectMapper = new ObjectMapper();
        List<CsvDTO> new_dtoList=new ArrayList<>();

        try {

            List<CsvDTO> dataList = objectMapper.readValue(new File(filePath), new TypeReference<List<CsvDTO>>() {});


            for (CsvDTO myData : dataList) {

                if(myData.getResult().isEmpty()){
                    continue;
                }
                new_dtoList.add(myData);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return new_dtoList;
    }
}
