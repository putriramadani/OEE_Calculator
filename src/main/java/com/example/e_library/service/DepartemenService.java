package com.example.e_library.service;

import com.example.e_library.model.departemen;
import com.example.e_library.repository.DepartemenRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class DepartemenService {
    @Autowired
    DepartemenRepository departemenRepository;

    public List<departemen> getAllDepartemen() {
//        return (List<MDepartemen>) DepartemenRepository.findAll();
        return  (List<departemen>) departemenRepository.findDepartemenByStatus();
    }

    public void saveDepartemen(departemen Departemen) {
        Departemen.setStatus(1);
        Departemen.setCreaby("Admin");
        Departemen.setModiby("Admin");
        departemenRepository.save(Departemen);
    }

    public departemen getDepartemenById(Integer id) {
        return departemenRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid Departemen Id:" + id));
    }

    public departemen updatedDepartemen(int id, departemen Departemen) {
        departemen emp = departemenRepository.findById(id).orElse(null);
        Date modidate = new Date();

        if (emp == null) return null;
        emp.setNama_departemen(Departemen.getNama_departemen());
        emp.setModidate(modidate);
        departemenRepository.save(emp);

        return emp;
    }

    public departemen deletedDepartemen(int id) {
        departemen emp = departemenRepository.findById(id).orElse(null);

        if (emp == null) return null;

        Date modidate = new Date();

        emp.setStatus(0);
        emp.setModidate(modidate);
        departemenRepository.save(emp);


        return emp;
    }
}
