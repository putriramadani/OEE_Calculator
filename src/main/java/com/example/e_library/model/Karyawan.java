package com.example.e_library.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.Date;

@Entity
public class Karyawan {

    @Id
    @NotBlank(message = "NIK wajib diisi.")
    private String NIK;

    @NotBlank(message = "Password wajib diisi.")
    private String password;

    @ManyToOne
    @JoinColumn(name = "id_departemen", nullable = false, insertable = false, updatable = false)
    private departemen departemens;
    private Integer id_departemen;

    @NotBlank(message = "Nama Karyawan wajib diisi.")
    private String nama_karyawan;

    @NotBlank(message = "Email wajib diisi.")
    private String email;

    @NotBlank(message = "Alamat wajib diisi.")
    private String alamat;

    @NotBlank(message = "Telepon wajib diisi.")
    private String telepon;

    @Column (name = "tanggal_lahir")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date tanggal_lahir;

    private Integer role;

    private Integer status;
    private String creaby;
    private Date creadate;
    private String modiby;
    private Date modidate;

    public String getNIK() {
        return NIK;
    }

    public void setNIK(String NIK) {
        this.NIK = NIK;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDepartemens() {
        return departemens.getNama_departemen();
    }

    public void setDepartemens(departemen departemens) {
        this.departemens = departemens;
    }

    public Integer getId_departemen() {
        return id_departemen;
    }

    public void setId_departemen(Integer id_departemen) {
        this.id_departemen = id_departemen;
    }

    public String getNama_karyawan() {
        return nama_karyawan;
    }

    public void setNama_karyawan(String nama_karyawan) {
        this.nama_karyawan = nama_karyawan;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAlamat() {
        return alamat;
    }

    public void setAlamat(String alamat) {
        this.alamat = alamat;
    }

    public String getTelepon() {
        return telepon;
    }

    public void setTelepon(String telepon) {
        this.telepon = telepon;
    }

    public Date getTanggal_lahir() {
        return tanggal_lahir;
    }

    public void setTanggal_lahir(Date tanggal_lahir) {
        this.tanggal_lahir = tanggal_lahir;
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getCreaby() {
        return creaby;
    }

    public void setCreaby(String creaby) {
        this.creaby = creaby;
    }

    public Date getCreadate() {
        return creadate;
    }

    public void setCreadate(Date creadate) {
        this.creadate = creadate;
    }

    public String getModiby() {
        return modiby;
    }

    public void setModiby(String modiby) {
        this.modiby = modiby;
    }

    public Date getModidate() {
        return modidate;
    }

    public void setModidate(Date modidate) {
        this.modidate = modidate;
    }
}
