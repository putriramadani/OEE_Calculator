package com.example.e_library.controllers;

import com.example.e_library.model.Karyawan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

    @GetMapping("/")
    public String signIn(Model model) {
        model.addAttribute("user", new Karyawan());

        return "layout/login";
    }
}
