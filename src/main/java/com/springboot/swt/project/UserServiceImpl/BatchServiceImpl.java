package com.springboot.swt.project.UserServiceImpl;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.swt.project.UserService.BatchService;
import com.springboot.swt.project.entity.Batch;
import com.springboot.swt.project.repo.BatchRepo;

@Service
public class BatchServiceImpl implements BatchService {
	@Autowired
	private BatchRepo batchrepo;

	private String generateUserId(Batch batch) {
		StringBuilder id = new StringBuilder();
		LocalDate local = LocalDate.now();
		id = id.append(("" + local.getYear()).substring(2));
		id = id.append("-");
		id = id.append(batchrepo.count() + 1);
		return id.toString();
	}

	@Override
	public Batch newBatch(Batch batch) {
		batch.setBatchId(generateUserId(batch));

		return batchrepo.save(batch);
	}

}
