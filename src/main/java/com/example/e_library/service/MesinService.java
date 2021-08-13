package com.example.e_library.service;

import com.example.e_library.model.Mesin;
import com.example.e_library.model.departemen;
import com.example.e_library.repository.MesinRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class MesinService {
    @Autowired
    MesinRepository mesinRepository;

    public List<Mesin> getAllMesin(){
        List<Mesin> mesinList = (List<Mesin>) mesinRepository.findAll();
        return mesinList;
    }

    public List<Mesin> saveMesin(Mesin mesin){
        mesin.setStatus(1);
        mesin.setCreadate(new Date());
        mesin.setModidate(new Date());
        mesin.setCreaby("Admin");
        mesin.setModiby("Admin");
        mesinRepository.save(mesin);
        return getAllMesin();
    }

    public Mesin getMesinById(int no_mesin){
        Optional<Mesin> optional = mesinRepository.findById(no_mesin);
        Mesin mesin = null;
        if(optional.isPresent()){
            mesin = optional.get();
        }else  {
            throw  new RuntimeException("Mesin not found" + no_mesin);
        }
        return mesin;
    }

    public int updateMesin(int no_mesin, Mesin mesin){
        Mesin mesin1 = mesinRepository.findById(no_mesin)
                .orElseThrow(() -> new IllegalArgumentException("Invalid merk Id:" + no_mesin));

        mesin1.setNama_mesin(mesin.getNama_mesin());
        mesin1.setId_departemen(mesin.getId_departemen());
        mesin1.setLine(mesin.getLine());
        mesin1.setTahun_mesin(mesin.getTahun_mesin());
        mesin1.setModidate(new Date());
        mesin1.setModiby("Admin");

        mesinRepository.save(mesin1);

        return 1;
    }

    public Mesin deleteMesin(int no_mesin) {
        Mesin mesin = mesinRepository.findById(no_mesin).orElse(null);

        if (mesin == null) return null;

        Date modidate = new Date();

        mesin.setStatus(0);
        mesin.setModidate(modidate);
        mesinRepository.save(mesin);

        return mesin;
    }
}
