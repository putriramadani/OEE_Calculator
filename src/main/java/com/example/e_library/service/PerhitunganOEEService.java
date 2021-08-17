package com.example.e_library.service;


import com.example.e_library.model.Perhitungan_OEE;
import com.example.e_library.repository.PerhitunganOEERepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.Convert;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class PerhitunganOEEService {

    @Autowired
    PerhitunganOEERepository perhitunganOEERepository;


    public List<Perhitungan_OEE> getAllPerhitunganOEE(){
        List<Perhitungan_OEE> perhitunganOEEList = (List<Perhitungan_OEE>)
                perhitunganOEERepository.findAll();
        return perhitunganOEEList;
    }

    public List<Perhitungan_OEE> getTransPerhitunganOEEByDate(Date tglAwal, Date tglAkhir){
        List<Perhitungan_OEE> perhitunganOEEList = (List<Perhitungan_OEE>)
                perhitunganOEERepository.getPerhitunganOEEByTanggal(tglAwal, tglAkhir);
        return perhitunganOEEList;
    }

    public List<Perhitungan_OEE> saveOEE(Perhitungan_OEE oee){
        Date now = new Date();
        oee.setTanggal(now);
        oee.setCreaby(oee.getOperator());
        oee.setCreadate(now);
        perhitunganOEERepository.save(oee);
        return getAllPerhitunganOEE();
    }

    public Perhitungan_OEE getOEEById(int id){
        Optional<Perhitungan_OEE> optional = perhitunganOEERepository.findById(id);
        Perhitungan_OEE oee = null;
        if(optional.isPresent()){
            oee = optional.get();
        }else  {
            throw  new RuntimeException("OEE not found" + id);
        }
        return oee;
    }


}
