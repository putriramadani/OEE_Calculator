package com.example.e_library.controllers;

import com.example.e_library.model.Karyawan;
import com.example.e_library.model.Mesin;
import com.example.e_library.repository.KaryawanRepository;
import com.example.e_library.service.DepartemenService;
import com.example.e_library.service.KaryawanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;

@Controller
public class KaryawanController {
    @Autowired
    KaryawanService karyawanService;

    @Autowired
    DepartemenService departemenService;

    @Autowired
    KaryawanRepository karyawanRepository;

    @RequestMapping("/listKaryawan")
    public String getKaryawan (Model model){

        List<Karyawan> karyawanList = karyawanRepository.findKaryawanByStatus();
        model.addAttribute("listKaryawan", karyawanList);

        return "/karyawan/listKaryawan";
    }

    @PostMapping("/addKaryawan")
    public String addKaryawan(RedirectAttributes redirectAttributes, @ModelAttribute("karyawanObject") @Valid Karyawan karyawan, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "karyawan/addKaryawan";
        }

        karyawanService.saveKaryawan(karyawan);

        return "redirect:/listKaryawan";
    }

    @RequestMapping ("/viewaddKaryawan")
    public String viewAddKaryawan(Model model){
        model.addAttribute("karyawanObject", new Karyawan());
        model.addAttribute("listDepartemen", departemenService.getAllDepartemen());
        return "karyawan/addKaryawan";
    }

    @GetMapping("/viewupdateKaryawan/{NIK}")
    public String viewupdateKaryawan(@PathVariable(value = "NIK") String NIK, Model model){

        Karyawan karyawan = karyawanService.getKaryawanById(NIK);
        model.addAttribute("listDepartemen", departemenService.getAllDepartemen());

        model.addAttribute("karyawanObject", karyawan);
        return "/karyawan/updateKaryawan";
    }

    //    #Update
    @PostMapping("/updateKaryawan/{NIK}")
    public String updateKaryawan(@PathVariable("NIK") String NIK, Karyawan karyawan,
                              BindingResult result, Model model) {
        if (result.hasErrors()) {
            karyawan.setNIK(NIK);
            return "/karyawan/viewupdateKaryawan";
        }

        karyawanService.updateKaryawan(NIK, karyawan);
        return "redirect:/listKaryawan";
    }

    @GetMapping("/deleteKaryawan/{NIK}")
    public String deleteKaryawan(RedirectAttributes redirectAttributes, @PathVariable("NIK") String NIK) {
        Karyawan karyawan = karyawanService.deleteKaryawan(NIK);

        if (karyawan == null) {
            return "karyawan/listKaryawan";
        }

        redirectAttributes.addFlashAttribute("message", "Karyawan berhasil dihapus.");
        return "redirect:/listKaryawan";
    }
}
