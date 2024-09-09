package com.springboot.swt.project.Service;

import java.util.List;

import com.springboot.swt.project.entity.Batch;

public interface BatchService {
      Batch newBatch(Batch batch);
      List<Batch> findByCurrentStatus(String currentstatus);
}
