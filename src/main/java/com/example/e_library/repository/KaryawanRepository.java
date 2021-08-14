package com.example.e_library.repository;

import com.example.e_library.model.Karyawan;
import com.example.e_library.model.Mesin;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface KaryawanRepository extends CrudRepository<Karyawan, Integer> {
    @Query("SELECT a FROM Karyawan a WHERE a.status = 1")
    List<Karyawan> findKaryawanByStatus();

    @Query("FROM Karyawan a where a.NIK=:NIK")
    Karyawan findKaryawanByNik (String NIK);

    @Query(nativeQuery = true, value = "select count(NIK) from karyawan")
    int getTotalKaryawan();

    @Query("select p from Karyawan p where p.email= :email")
    Optional<Karyawan> findByEmail(String email);
}
