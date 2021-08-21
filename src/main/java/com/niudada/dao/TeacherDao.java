package com.niudada.dao;

import java.util.List;
import java.util.Map;

import com.niudada.entity.Teacher;

public interface TeacherDao {

    //插入
    int create(Teacher pi);

    //删除
    int delete(Map<String, Object> paramMap);

    //修改
    int update(Map<String, Object> paramMap);

    //查询所有
    List<Teacher> query(Map<String, Object> paramMap);

    //明细查询（只返回一条数据）
    Teacher detail(Map<String, Object> paramMap);

    //查询总记录条数
    int count(Map<String, Object> paramMap);
}