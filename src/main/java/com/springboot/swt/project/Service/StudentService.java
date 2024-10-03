package com.springboot.swt.project.Service;

import java.util.List;

import com.springboot.swt.project.entity.Student;
import com.springboot.swt.project.entity.User;

public interface StudentService {

    // Student markAttendance(String rollNo, String batchId);
    List<Student> findByBatch(String batchId);

    List<Student> findByUserId(String userId);

    List<Student> findAllStudent(String name);

    Student getActiveStudent(User temp);

    Student setMarks(String rollNo, String batchId, Integer testNo, Integer marks);

}
