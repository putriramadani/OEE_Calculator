package com.example.e_library.controllers;

import com.example.e_library.model.Karyawan;
import com.example.e_library.service.KaryawanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

@Controller
public class LoginController {
    @Autowired
    KaryawanService karyawanService;

    @GetMapping("/")
    public String signIn(Model model) {
        model.addAttribute("user", new Karyawan());

        return "karyawan/login";
    }

    @PostMapping("/checklogin")
    public String checkLogin(ModelMap model, @RequestParam("email") String email,
                             @RequestParam("password") String password,
                             HttpSession session){

        if(karyawanService.checkLogin(email, password) == 1){
            System.out.println("Login berhasil");
            Optional<Karyawan> optionalKaryawan = karyawanService.findByEmail(email);
            String nama = optionalKaryawan.get().getNama_karyawan();
            String id_kry = optionalKaryawan.get().getNIK();
            session.setAttribute("nama", nama);
            session.setAttribute("id", id_kry);

            return "redirect:/admin/dashboard";

        } else if(karyawanService.checkLogin(email, password) == 2) {
            System.out.println("Login berhasil");
            Optional<Karyawan> optionalKaryawan = karyawanService.findByEmail(email);
            String nama = optionalKaryawan.get().getNama_karyawan();
            String id_kry = optionalKaryawan.get().getNIK();
            session.setAttribute("nama", nama);
            session.setAttribute("id", id_kry);

            return "redirect:/staff/dashboard";

        } else {
            System.out.println("Login gagal");
            model.addAttribute("Error","Email atau password salah");
        }

        return "karyawan/login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("nama");
        session.removeAttribute("id");
        return "redirect:/";
    }
}
