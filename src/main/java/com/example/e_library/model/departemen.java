package com.example.e_library.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotBlank;
import java.util.Date;

@Entity
public class departemen {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_departemen;

    @NotBlank(message = "Nama Departemen wajib diisi.")
    private String nama_departemen;

    private Integer status;

    private String creaby;

    private Date creadate;

    private String modiby;

    private Date modidate;

    public Integer getId_departemen() {
        return id_departemen;
    }

    public void setId_departemen(Integer id_departemen) {
        this.id_departemen = id_departemen;
    }

    public String getNama_departemen() {
        return nama_departemen;
    }

    public void setNama_departemen(String nama_departemen) {
        this.nama_departemen = nama_departemen;
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
