package com.springboot.swt.project.ServiceImpl;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.swt.project.Service.BatchService;
import com.springboot.swt.project.entity.Batch;
import com.springboot.swt.project.entity.Student;
import com.springboot.swt.project.entity.User;
import com.springboot.swt.project.repo.BatchRepo;
import com.springboot.swt.project.repo.StudentRepo;
import com.springboot.swt.project.repo.UserRepo;

@Service
public class BatchServiceImpl implements BatchService {
    @Autowired
    private BatchRepo batchrepo;
    @Autowired
    private StudentRepo studentrepo;
    @Autowired
    private UserRepo userRepo;

    private String generateUserId(Batch batch) {
        StringBuilder id = new StringBuilder();
        LocalDate local = LocalDate.now();
        id = id.append(("" + local.getYear()).substring(2));

        Random rand = new Random();
        id = id.append(String.format("%04d", rand.nextInt(10000)));
        return id.toString();
    }

    @Override
    public Batch newBatch(Batch batch) {
        batch.setBatchId(generateUserId(batch));
        return batchrepo.save(batch);
    }

    @Override
    public List<Batch> getAllBatches() {
        return batchrepo.findByCurrentStatus("Enroll");
    }

    @Override
    public void startBatchByID(String batchId) {
        Optional<Batch> optional = batchrepo.findById(batchId);
        if (!optional.isEmpty()) {
            Batch batch = optional.get();
            batch.setCurrentStatus("Active");
            batch.setStartDate(Date.valueOf(LocalDate.now()));
            batchrepo.save(batch);
            Integer rollNo = 0;
            List<Student> studentList = studentrepo.findByBatch(batch);
            for (Student student : studentList) {
                student.setRollNo("" + (++rollNo));
                User user = student.getUser();
                user.setBatch(batch.getBatchTopic());
                userRepo.save(user);
                studentrepo.save(student);
            }
        }
    }

    public void endBatchByID(String batchId) {
        Optional<Batch> optional = batchrepo.findById(batchId);

        if (!optional.isEmpty()) {
            Batch batch = optional.get();
            batch.setCurrentStatus("Completed");
            batch.setEndDate(Date.valueOf(LocalDate.now()));
            batchrepo.save(batch);
        }
    }

    @Override
    public List<Batch> findByCurrentStatus(String currentstatus) {

        return batchrepo.findByCurrentStatus(currentstatus);
    }

    @Override
    public List<Batch> sendAllBatches() {
        return batchrepo.findAll();
    }

    @Override
    public void deleteBatchByID(String batchId) {
        batchrepo.delete(batchrepo.findById(batchId).get());
    }

}
