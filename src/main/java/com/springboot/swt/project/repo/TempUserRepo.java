
package com.springboot.swt.project.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.springboot.swt.project.entity.TempUser;

@Repository
public interface TempUserRepo extends JpaRepository<TempUser, String> {

    TempUser findByEmail(String email);

    void deleteByEmail(String email);
}
