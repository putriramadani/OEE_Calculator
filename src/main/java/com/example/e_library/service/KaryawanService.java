package com.example.e_library.service;

import com.example.e_library.model.Karyawan;
import com.example.e_library.model.Mesin;
import com.example.e_library.model.departemen;
import com.example.e_library.repository.KaryawanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class KaryawanService {
    @Autowired
    KaryawanRepository karyawanRepository;

    public List<Karyawan> getAllKaryawan(){
        List<Karyawan> karyawanList = (List<Karyawan>) karyawanRepository.findAll();
        return karyawanList;
    }

    public List<Karyawan> saveKaryawan(Karyawan karyawan){
        karyawan.setStatus(1);
        karyawan.setCreadate(new Date());
        karyawan.setModidate(new Date());
        karyawan.setCreaby("Admin");
        karyawan.setModiby("Admin");
        karyawanRepository.save(karyawan);
        return getAllKaryawan();
    }

    public Karyawan getKaryawanById(String NIK) {
        return karyawanRepository.findKaryawanByNik(NIK);
    }

    public Karyawan updateKaryawan(String NIK, Karyawan karyawan){
        Karyawan karyawan1 = karyawanRepository.findKaryawanByNik(NIK);

        karyawan1.setPassword(karyawan.getPassword());
        karyawan1.setId_departemen(karyawan.getId_departemen());
        karyawan1.setNama_karyawan(karyawan.getNama_karyawan());
        karyawan1.setEmail(karyawan.getEmail());
        karyawan1.setAlamat(karyawan.getAlamat());
        karyawan1.setTelepon(karyawan.getTelepon());
        // Foto
        karyawan1.setTanggal_lahir(karyawan.getTanggal_lahir());
        karyawan1.setRole(karyawan.getRole());
        karyawan1.setModidate(new Date());
        karyawan1.setModiby("Admin");

        karyawanRepository.save(karyawan1);

        return karyawan1;
    }

    public Karyawan deleteKaryawan(String NIK) {
        Karyawan karyawan = karyawanRepository.findKaryawanByNik(NIK);

        if (karyawan == null) return null;

        Date modidate = new Date();

        karyawan.setStatus(0);
        karyawan.setModidate(modidate);
        karyawanRepository.save(karyawan);

        return karyawan;
    }

    public Optional<Karyawan> findByEmail(String email){
        return karyawanRepository.findByEmail(email);
    }

    public int checkLogin(String email, String password){
        Optional<Karyawan> optionalKaryawan = karyawanRepository.findByEmail(email);

        if(optionalKaryawan.isPresent() && optionalKaryawan.get().getPassword().equals(password)
                && optionalKaryawan.get().getRole() == 1 && optionalKaryawan.get().getStatus().equals(1)){
            System.out.println(optionalKaryawan.get().getRole());
            return 1;
        } else if (optionalKaryawan.isPresent() && optionalKaryawan.get().getPassword().equals(password)
                && optionalKaryawan.get().getRole() == 2 && optionalKaryawan.get().getStatus().equals(1)){
            System.out.println(optionalKaryawan.get().getRole());
            return 2;
        }
        return 0;
    }
}
