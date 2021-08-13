package com.example.e_library.controllers;

import com.example.e_library.model.LineProduksi;
import com.example.e_library.service.LineProduksiService;
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
public class LineProduksiController {
    @Autowired
    LineProduksiService lineProduksiService;



    @RequestMapping("/listlineproduksith")
    public String getlineproduksi(Model model) {
        List<LineProduksi> lineprodList = lineProduksiService.getAllLine();
        //List<lineproduksi> lineproduksiList = lineProduksiService.getAllLineProduksi();
        model.addAttribute("listLineproduksi", lineprodList);
        return "lineproduksi/listlineproduksith";
    }

    @PostMapping("/addlineproduksith")
    public String addLineproduksi(RedirectAttributes redirectAttributes, @ModelAttribute("lineproduksiObject") @Valid LineProduksi lineProduksi, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "lineproduksi/addlineproduksith";
        }

        Date creadate = new Date();
        Date modidate = new Date();
        lineProduksi.setCreadate(creadate);
        lineProduksi.setModidate(modidate);

        lineProduksiService.saveLineProduksi(lineProduksi);

        return "redirect:/listlineproduksith";
    }

    @RequestMapping("/viewaddlineproduksith")
    public String viewAddlineproduksi(Model model) {
        model.addAttribute("lineObject", new LineProduksi() {
        });
        return "lineproduksi/addlineproduksith";
    }

    @RequestMapping("/vieweditlineproduksith/{id}")
    public String viewEditLineproduksi(@PathVariable("id") Integer id, Model model) {
        LineProduksi Lineproduksi = lineProduksiService.getLineProduksiById(id);
        model.addAttribute("lineproduksiObject", Lineproduksi);
        return "lineproduksi/editlineproduksith";
    }

    @PostMapping("/editlineproduksith/{id}")
    public String editLineproduksi(RedirectAttributes redirectAttributes, @PathVariable("id") int id,
                                 @ModelAttribute("lineproduksiObject") @Valid LineProduksi Lineproduksi, BindingResult result) {
        if (result.hasErrors()) {
            Lineproduksi.setId_line(id);
            return "lineproduksi/editlineproduksith";
        }

        LineProduksi emp = lineProduksiService.updatedLineProduksi(id, Lineproduksi);
        if (emp == null) {
            return "lineproduksi/editlineproduksith";
        }

        redirectAttributes.addFlashAttribute("message", "Line Produksi berhasil diubah.");
        return "redirect:/listlineproduksith";
    }

    @GetMapping("/deletelineproduksith/{id}")
    public String deleteLineproduski(RedirectAttributes redirectAttributes, @PathVariable("id") int id) {
        LineProduksi emp = lineProduksiService.deletedLineProduksi(id);

        if (emp == null) {
            return "lineproduksi/listlineproduksith";
        }

        redirectAttributes.addFlashAttribute("message", "Line Produksi berhasil dihapus.");
        return "redirect:/listlineproduksith";
    }
}
