package com.example.e_library.repository;

import com.example.e_library.model.Perhitungan_OEE;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TransaksiRepository extends CrudRepository<Perhitungan_OEE, Integer> {

    @Query(nativeQuery = true, value = "select count(id_perhitunganOEE) from perhitungan_OEE")
    int getTotalID();

    @Query(nativeQuery = true, value = "select MAX(OEE) from perhitungan_OEE")
    int getMaxOEE();

    @Query(nativeQuery = true, value = "select MIN(OEE) from perhitungan_OEE")
    int getMinOEE();

    @Query(nativeQuery = true, value = "select AVG(OEE) from perhitungan_OEE")
    int getAvgOEE();
}
