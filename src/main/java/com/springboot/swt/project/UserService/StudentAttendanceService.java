package com.springboot.swt.project.UserService;

import com.springboot.swt.project.entity.Batch;
import com.springboot.swt.project.entity.StudentAttendance;
import com.springboot.swt.project.entity.User;

public interface StudentAttendanceService {

	StudentAttendance markAttendance(Integer Id);
}
