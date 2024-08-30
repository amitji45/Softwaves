package com.springboot.swt.project.Service;

import com.springboot.swt.project.entity.Batch;
import com.springboot.swt.project.entity.StudentAttendance;
import com.springboot.swt.project.entity.User;

public interface StudentAttendanceService {

	StudentAttendance markAttendance(String rollNo, String batchId);
}
