package com.niudada.dao;

import com.niudada.entity.Notice;

import java.util.List;
import java.util.Map;

public interface NoticeDao {

    int create(Notice pi);

    //删除
    int delete(Map<String, Object> paramMap);

    //修改
    int update(Notice notice);

    //查询所有
    List<Notice> query(Map<String, Object> paramMap);

    //明细查询（只返回一条数据）
    Notice detail(Map<String, Object> paramMap);

    //查询总记录条数
    int count(Map<String, Object> paramMap);
}
