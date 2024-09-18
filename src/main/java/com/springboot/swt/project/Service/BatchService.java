package com.springboot.swt.project.Service;

import java.util.List;

import com.springboot.swt.project.entity.Batch;

public interface BatchService {
      Batch newBatch(Batch batch);
      List<Batch> findByCurrentStatus(String currentstatus);
	List<Batch> sendAllBatches();
	void deleteBatchByID(String batchId);
	List<Batch> getAllBatches();
	void startBatchByID(String batchId);
}
