package com.example.e_library.repository;

import com.example.e_library.model.Perhitungan_OEE;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface PerhitunganOEERepository extends CrudRepository<Perhitungan_OEE, Integer> {
    @Query("select t from Perhitungan_OEE t where t.creadate>= :tglAwal and t.creadate<= :tglAkhir")
    List<Perhitungan_OEE> getPerhitunganOEEByTanggal(Date tglAwal, Date tglAkhir);
}
