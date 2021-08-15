package com.example.e_library.model;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.Date;

@Entity
public class Perhitungan_OEE {
    @Id

    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private Integer idPerhitunganOEE;

    @ManyToOne
    @JoinColumn(name = "no_mesin", nullable = false, insertable = false, updatable = false)
    private Mesin mesin;
    private Integer no_mesin;

    private String operator;

    private Date tanggal;

    private Integer shift;

    private Integer cycleTime;

    private Integer panjangShift;

    private Integer waktuBreakPendek;

    private Integer waktuBreakMakan;

    private Integer downtimeSetup;

    private Integer downtimeBreakdown;

    private Integer totalProduksiShift;

    private Integer totalProduksiReject;

    private Integer performance;


    private Integer availbility;

    private Integer quality;

    private Integer OEE;

    private String creaby;

    private Date creadate;

    public Integer getIdPerhitunganOEE() {
        return idPerhitunganOEE;
    }

    public void setIdPerhitunganOEE(Integer idPerhitunganOEE) {
        this.idPerhitunganOEE = idPerhitunganOEE;
    }

    public Mesin getMesin() {
        return mesin;
    }

    public void setMesin(Mesin mesin) {
        this.mesin = mesin;
    }

    public Integer getNo_mesin() {
        return no_mesin;
    }

    public void setNo_mesin(Integer no_mesin) {
        this.no_mesin = no_mesin;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public Date getTanggal() {
        return tanggal;
    }

    public void setTanggal(Date tanggal) {
        this.tanggal = tanggal;
    }

    public Integer getShift() {
        return shift;
    }

    public void setShift(Integer shift) {
        this.shift = shift;
    }

    public Integer getCycleTime() {
        return cycleTime;
    }

    public void setCycleTime(Integer cycleTime) {
        this.cycleTime = cycleTime;
    }

    public Integer getPanjangShift() {
        return panjangShift;
    }

    public Integer getAvailbility() {
        return availbility;
    }

    public void setAvailbility(Integer availbility) {
        this.availbility = availbility;
    }

    public void setPanjangShift(Integer panjangShift) {
        this.panjangShift = panjangShift;
    }

    public Integer getWaktuBreakPendek() {
        return waktuBreakPendek;
    }

    public void setWaktuBreakPendek(Integer waktuBreakPendek) {
        this.waktuBreakPendek = waktuBreakPendek;
    }

    public Integer getWaktuBreakMakan() {
        return waktuBreakMakan;
    }

    public void setWaktuBreakMakan(Integer waktuBreakMakan) {
        this.waktuBreakMakan = waktuBreakMakan;
    }

    public Integer getDowntimeSetup() {
        return downtimeSetup;
    }

    public void setDowntimeSetup(Integer downtimeSetup) {
        this.downtimeSetup = downtimeSetup;
    }

    public Integer getDowntimeBreakdown() {
        return downtimeBreakdown;
    }

    public void setDowntimeBreakdown(Integer downtimeBreakdown) {
        this.downtimeBreakdown = downtimeBreakdown;
    }

    public Integer getTotalProduksiShift() {
        return totalProduksiShift;
    }

    public void setTotalProduksiShift(Integer totalProduksiShift) {
        this.totalProduksiShift = totalProduksiShift;
    }

    public Integer getTotalProduksiReject() {
        return totalProduksiReject;
    }

    public void setTotalProduksiReject(Integer totalProduksiReject) {
        this.totalProduksiReject = totalProduksiReject;
    }

    public Integer getPerformance() {
        return performance;
    }

    public void setPerformance(Integer performance) {
        this.performance = performance;
    }

    public Integer getQuality() {
        return quality;
    }

    public void setQuality(Integer quality) {
        this.quality = quality;
    }

    public Integer getOEE() {
        return OEE;
    }

    public void setOEE(Integer OEE) {
        this.OEE = OEE;
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
}
