package com.example.e_library.service;


import com.example.e_library.model.Perhitungan_OEE;
import com.example.e_library.repository.PerhitunganOEERepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

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
}
