package com.example.e_library.repository;

import com.example.e_library.model.Mesin;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MesinRepository extends CrudRepository<Mesin, Integer> {
    @Query("SELECT a FROM Mesin a WHERE a.status = 1")
    List<Mesin> findMesinByStatus();
}
