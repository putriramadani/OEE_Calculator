package com.example.e_library.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotBlank;
import java.util.Date;

@Entity
public class LineProduksi {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_line;

    @NotBlank(message = "Nama Line wajib diisi.")
    private String nama_line;

    private String deskripsi;

    private Integer status;

    private String creaby;

    private Date creadate;

    private String modiby;

    private Date modidate;

    public Date getModidate() {
        return modidate;
    }

    public void setModidate(Date modidate) {
        this.modidate = modidate;
    }

    public Integer getId_line() {
        return id_line;
    }

    public void setId_line(Integer id_line) {
        this.id_line = id_line;
    }

    public String getNama_line() {
        return nama_line;
    }

    public void setNama_line(String nama_line) {
        this.nama_line = nama_line;
    }

    public String getDeskripsi() {
        return deskripsi;
    }

    public void setDeskripsi(String deskripsi) {
        this.deskripsi = deskripsi;
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
}
