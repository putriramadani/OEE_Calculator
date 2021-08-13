package com.example.e_library.service;

import com.example.e_library.model.LineProduksi;
import com.example.e_library.repository.LineProduksiRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class LineProduksiService {
    @Autowired
    LineProduksiRepository lineProduksiRepository;

    public List<LineProduksi> getAllLine() {
//        return (List<MDepartemen>) DepartemenRepository.findAll();
        return  (List<LineProduksi>) lineProduksiRepository.findLinePoduksiByStatus();
    }

    public void saveLineProduksi(LineProduksi Lineproduksi) {
        Lineproduksi.setStatus(1);
        Lineproduksi.setCreaby("Admin");
        Lineproduksi.setModiby("Admin");
        lineProduksiRepository.save(Lineproduksi);
    }

    public LineProduksi getLineProduksiById(Integer id) {
        return lineProduksiRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid Departemen Id:" + id));
    }

    public LineProduksi updatedLineProduksi(int id, LineProduksi Lineproduksi) {
        LineProduksi emp = lineProduksiRepository.findById(id).orElse(null);
        Date modidate = new Date();

        if (emp == null) return null;
        emp.setNama_line(Lineproduksi.getNama_line());
        emp.setDeskripsi(Lineproduksi.getDeskripsi());
        emp.setModidate(modidate);
        lineProduksiRepository.save(emp);

        return emp;
    }

    public LineProduksi deletedLineProduksi(int id) {
        LineProduksi emp = lineProduksiRepository.findById(id).orElse(null);

        if (emp == null) return null;

        Date modidate = new Date();

        emp.setStatus(0);
        emp.setModidate(modidate);
        lineProduksiRepository.save(emp);


        return emp;
    }
}
