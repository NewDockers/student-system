package com.niudada.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.niudada.entity.Student;

public interface StudentDao {

    //插入
    int create(Student pi);

    //删除
    int delete(Map<String, Object> paramMap);

    //修改
    int update(Map<String, Object> paramMap);

    //查询所有
    List<Student> query(Map<String, Object> paramMap);

    //明细查询（只返回一条数据）
    Student detail(Map<String, Object> paramMap);

    //查询总记录条数
    int count(Map<String, Object> paramMap);

    //查询选课的学生
    List<HashMap> querySelectStudent(Map<String, Object> paramMap);

    //按照老师查询学生
    List<Student> queryStudentByTeacher(Map<String, Object> paramMap);
}