package com.example.e_library.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {
    @GetMapping("/index")
    public String getIndex() {
        return "index";
    }
}
