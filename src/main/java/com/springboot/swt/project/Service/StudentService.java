package com.springboot.swt.project.Service;

import com.springboot.swt.project.entity.Student;

public interface StudentService {

	Student markAttendance(String rollNo, String batchId);
}
