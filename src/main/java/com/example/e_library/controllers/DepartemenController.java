package com.example.e_library.controllers;

import com.example.e_library.model.departemen;
import com.example.e_library.service.DepartemenService;
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
public class DepartemenController {
    @Autowired
    DepartemenService departemenService;


    @RequestMapping("/listdepartementh")
    public String getdepartemen(Model model) {
        List<departemen> DepartemenList = departemenService.getAllDepartemen();
        model.addAttribute("listDepartemen", DepartemenList);
        return "departemen/listdepartementh";
    }

    @PostMapping("/adddepartementh")
    public String addDepartemen(RedirectAttributes redirectAttributes, @ModelAttribute("departemenObject") @Valid departemen Departemen, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "departemen/adddepartementh";
        }

        Date creadate = new Date();
        Date modidate = new Date();
        Departemen.setCreadate(creadate);
        Departemen.setModidate(modidate);
        departemenService.saveDepartemen(Departemen);

        return "redirect:/listdepartementh";
    }

    @RequestMapping("/viewadddepartementh")
    public String viewAdddepartemen(Model model) {
        model.addAttribute("departemenObject", new departemen());
        return "departemen/adddepartementh";
    }

    @RequestMapping("/vieweditdepartementh/{id}")
    public String viewEditDepartemen(@PathVariable("id") Integer id, Model model) {
        departemen Departemen = departemenService.getDepartemenById(id);
        model.addAttribute("departemenObject", Departemen);
        return "departemen/editdepartementh";
    }

    @PostMapping("/editdepartementh/{id}")
    public String editDepartemen(RedirectAttributes redirectAttributes, @PathVariable("id") int id,
                             @ModelAttribute("departemenObject") @Valid departemen Departemen, BindingResult result) {
        if (result.hasErrors()) {
            Departemen.setId_departemen(id);
            return "departemen/editdepartementh";
        }

        departemen emp = departemenService.updatedDepartemen(id, Departemen);
        if (emp == null) {
            return "departemen/editdepartementh";
        }

        redirectAttributes.addFlashAttribute("message", "Departemen berhasil diubah.");
        return "redirect:/listdepartementh";
    }

    @GetMapping("/deletedepartementh/{id}")
    public String deleteDepartemen(RedirectAttributes redirectAttributes, @PathVariable("id") int id) {
        departemen emp = departemenService.deletedDepartemen(id);

        if (emp == null) {
            return "departemen/listdepartementh";
        }

        redirectAttributes.addFlashAttribute("message", "Departemen berhasil dihapus.");
        return "redirect:/listdepartementh";
    }
}
