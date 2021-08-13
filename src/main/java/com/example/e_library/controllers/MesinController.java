package com.example.e_library.controllers;

import com.example.e_library.model.Mesin;
import com.example.e_library.model.departemen;
import com.example.e_library.repository.MesinRepository;
import com.example.e_library.service.DepartemenService;
import com.example.e_library.service.LineProduksiService;
import com.example.e_library.service.MesinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.Date;
import java.util.List;

@Controller
public class MesinController {
    @Autowired
    MesinService mesinService;

    @Autowired
    DepartemenService departemenService;

    @Autowired
    LineProduksiService lineProduksiService;

    @Autowired
    MesinRepository mesinRepository;

    @RequestMapping("/listMesin")
    public String getMesin (Model model){

        List<Mesin> mesinList = mesinRepository.findMesinByStatus();
        model.addAttribute("listMesin", mesinList);

        return "/mesin/listMesin";
    }

    @PostMapping("/addMesin")
    public String addMesin(RedirectAttributes redirectAttributes, @ModelAttribute("mesinObject") @Valid Mesin mesin, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "mesin/addMesin";
        }

        mesinService.saveMesin(mesin);

        return "redirect:/listMesin";
    }

    @RequestMapping ("viewaddMesin")
    public String viewAddMesin(Model model){
        model.addAttribute("mesinObject", new Mesin());
        model.addAttribute("listDepartemen", departemenService.getAllDepartemen());
        model.addAttribute("listLineProduksi", lineProduksiService.getAllLine());
        return "/mesin/addMesin";
    }

    @GetMapping("/viewupdateMesin/{no_mesin}")
    public String viewupdateMesin(@PathVariable(value = "no_mesin") int no_mesin, Model model){

        Mesin mesin = mesinService.getMesinById(no_mesin);
        model.addAttribute("listDepartemen", departemenService.getAllDepartemen());
        model.addAttribute("listLineProduksi", lineProduksiService.getAllLine());

        model.addAttribute("mesinObject", mesin);
        return "/mesin/updateMesin";
    }

    //    #Update
    @PostMapping("/updateMesin/{no_mesin}")
    public String updateMesin(@PathVariable("no_mesin") int no_mesin, Mesin mesin,
                         BindingResult result, Model model) {
        if (result.hasErrors()) {
            mesin.setNo_mesin(no_mesin);
            return "/mesin/viewupdateMesin";
        }

        mesinService.updateMesin(no_mesin, mesin);
        return "redirect:/listMesin";
    }

    @GetMapping("/deleteMesin/{no_mesin}")
    public String deleteMesin(RedirectAttributes redirectAttributes, @PathVariable("no_mesin") int no_mesin) {
        Mesin mesin = mesinService.deleteMesin(no_mesin);

        if (mesin == null) {
            return "mesin/listMesin";
        }

        redirectAttributes.addFlashAttribute("message", "Mesin berhasil dihapus.");
        return "redirect:/listMesin";
    }
}
