package com.example.e_library.controllers;

import com.example.e_library.service.DashboardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class DashboardController {

    @Autowired
    DashboardService dashboardService;

    @GetMapping("/index")
    public String getIndex() {
        return "index";
    }

    @GetMapping("admin/dashboard")
    public String getAdminDashboard(Model model, HttpServletRequest request) {

        model.addAttribute("total_departemen", dashboardService.findTotalDepartemen());
        model.addAttribute("total_mesin", dashboardService.findTotalMesin());
        model.addAttribute("total_karyawan", dashboardService.findTotalKaryawan());
        model.addAttribute("total_line", dashboardService.findTotalLineProduksi());

        return "dashboard/dashboard-admin";
    }

    @GetMapping("staff/dashboard")
    public String getStaffDashboard() {
        return "dashboard/dashboard-staff";
    }

}
