package com.example.e_library.repository;

import com.example.e_library.model.LineProduksi;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface LineProduksiRepository extends CrudRepository <LineProduksi, Integer> {
    @Query("SELECT l FROM LineProduksi l WHERE l.status = 1")
    List<LineProduksi> findLinePoduksiByStatus();

    @Query(nativeQuery = true, value = "select count(id_line) from line_produksi")
    int getTotalLineProduksi();
}
