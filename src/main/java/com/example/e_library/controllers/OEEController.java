package com.example.e_library.controllers;

import com.example.e_library.model.Perhitungan_OEE;
import com.example.e_library.repository.KaryawanRepository;
import com.example.e_library.service.KaryawanService;
import com.example.e_library.service.MesinService;
import com.example.e_library.service.PerhitunganOEEService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;

@Controller
public class OEEController {
    @Autowired
    PerhitunganOEEService perhitunganOEEService;

    @Autowired
    MesinService mesinService;

    @Autowired
    KaryawanRepository karyawanRepository;

    @RequestMapping("/listOEE")
    public String getOEE (Model model){

        List<Perhitungan_OEE> OEEList = perhitunganOEEService.getAllPerhitunganOEE();
        model.addAttribute("listOEE", OEEList);

        return "/OEE/listOEE";
    }

    @PostMapping("/addOEE")
    public String addOEE(RedirectAttributes redirectAttributes, @ModelAttribute("OEEObject") @Valid Perhitungan_OEE OEE, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "OEE/addOEE";
        }

        perhitunganOEEService.saveOEE(OEE);

        return "redirect:/listOEE";
    }



    @RequestMapping ("viewaddOEE")
    public String viewAddOEE(Model model){
        model.addAttribute("OEEObject", new Perhitungan_OEE());
        model.addAttribute("listMesin", mesinService.getAllMesin());
        model.addAttribute("listKaryawan", karyawanRepository.findKaryawanByStatus());
        return "OEE/addOEE";
    }
}
