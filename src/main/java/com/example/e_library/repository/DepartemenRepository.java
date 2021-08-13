package com.example.e_library.repository;

import com.example.e_library.model.departemen;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DepartemenRepository extends CrudRepository<departemen, Integer> {
    @Query("SELECT a FROM departemen a WHERE a.status = 1")
    List<departemen> findDepartemenByStatus();
}
