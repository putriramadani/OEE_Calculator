package com.example.e_library.model;

import com.example.e_library.service.DepartemenService;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import java.util.Date;

@Entity
public class Mesin {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer no_mesin;

    @ManyToOne
    @JoinColumn(name = "id_departemen", nullable = false, insertable = false, updatable = false)
    private departemen departemens;
    private Integer id_departemen;

    @NotBlank(message = "Nama Mesin wajib diisi.")
    private String nama_mesin;

    @ManyToOne
    @JoinColumn(name = "line", nullable = false, insertable = false, updatable = false)
    private LineProduksi lineProduksi;
    private Integer line;

//    @NotEmpty(message = "Tahun Mesin wajib diisi.")
    private Integer tahun_mesin;

    private Integer status;
    private String creaby;
    private Date creadate;
    private String modiby;
    private Date modidate;

    public Integer getNo_mesin() {
        return no_mesin;
    }

    public void setNo_mesin(Integer no_mesin) {
        this.no_mesin = no_mesin;
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

    public String getNama_mesin() {
        return nama_mesin;
    }

    public void setNama_mesin(String nama_mesin) {
        this.nama_mesin = nama_mesin;
    }

    public String getLineProduksi() {
        return lineProduksi.getNama_line();
    }

    public void setLineProduksi(LineProduksi lineProduksi) {
        this.lineProduksi = lineProduksi;
    }

    public Integer getLine() {
        return line;
    }

    public void setLine(Integer line) {
        this.line = line;
    }

    public Integer getTahun_mesin() {
        return tahun_mesin;
    }

    public void setTahun_mesin(Integer tahun_mesin) {
        this.tahun_mesin = tahun_mesin;
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
