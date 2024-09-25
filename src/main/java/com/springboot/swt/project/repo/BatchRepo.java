package com.springboot.swt.project.repo;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.springboot.swt.project.entity.Batch;
import com.springboot.swt.project.entity.User;

public interface BatchRepo extends JpaRepository<Batch, String> {
	 
	Optional<Batch> findById(String batchId);
	List<Batch> findByCurrentStatus(String currentStatus);
	public Batch findByBatchId(String batchId);

}
