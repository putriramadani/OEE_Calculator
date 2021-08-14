package com.example.e_library.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Perhitungan_OEE {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_perhitunganOEE;

    private Integer OEE;

    public Integer getId_perhitunganOEE() {
        return id_perhitunganOEE;
    }

    public void setId_perhitunganOEE(Integer id_perhitunganOEE) {
        this.id_perhitunganOEE = id_perhitunganOEE;
    }

    public Integer getOEE() {
        return OEE;
    }

    public void setOEE(Integer OEE) {
        this.OEE = OEE;
    }

}
