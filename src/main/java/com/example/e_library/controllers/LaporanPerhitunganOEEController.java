package com.example.e_library.controllers;

import com.example.e_library.model.Perhitungan_OEE;
import com.example.e_library.service.PerhitunganOEEService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class LaporanPerhitunganOEEController {

    @Autowired
    PerhitunganOEEService perhitunganOEEService;

    @RequestMapping("/staff/listrans")
    public String getPerhitunganOEE(Model model){
        List<Perhitungan_OEE> perhitunganOEEList = perhitunganOEEService.getAllPerhitunganOEE();
        model.addAttribute("listPerhitunganOEE", perhitunganOEEList);



        return "staff/listrans";
    }

    @RequestMapping("/staff/listperhitunganoeebydate")
    public String getPerhitunganOEEByDate(Model model, @RequestParam("tglAwal") String tglAwal,
                                          @RequestParam("tglAkhir") String tglAkhir) throws ParseException {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

        Date tglAwal1= formatter.parse(tglAwal);
        Date tglAkhir1= formatter.parse(tglAkhir);
        List<Perhitungan_OEE> perhitunganOEEList = perhitunganOEEService.getTransPerhitunganOEEByDate(tglAwal1, tglAkhir1);
        model.addAttribute("listPerhitunganOEE", perhitunganOEEList);



        return "staff/listrans";
    }
}
