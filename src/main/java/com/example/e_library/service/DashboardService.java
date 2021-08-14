package com.example.e_library.service;

import com.example.e_library.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DashboardService {

    @Autowired
    DepartemenRepository departemenRepository;

    @Autowired
    KaryawanRepository karyawanRepository;

    @Autowired
    MesinRepository mesinRepository;

    @Autowired
    LineProduksiRepository lineProduksiRepository;

    @Autowired
    TransaksiRepository transaksiRepository;

    public int findTotalDepartemen() {
        return departemenRepository.getTotalDepartemen();
    }

    public int findTotalMesin() {
        return mesinRepository.getTotalMesin();
    }

    public int findTotalKaryawan() {
        return karyawanRepository.getTotalKaryawan();
    }

    public int findTotalLineProduksi() {
        return lineProduksiRepository.getTotalLineProduksi();
    }

    public int findTotalTransaksi(){
        return transaksiRepository.getTotalID();
    }

    public int findMaxOEE(){
        return transaksiRepository.getMaxOEE();
    }

    public int findMinOEE(){
        return transaksiRepository.getMinOEE();
    }

    public int findAvgOEE(){
        return transaksiRepository.getAvgOEE();
    }

}
