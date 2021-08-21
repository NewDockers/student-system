package com.niudada.service;

import com.github.pagehelper.PageHelper;
import com.niudada.dao.NoticeDao;
import com.niudada.entity.Notice;
import com.niudada.utils.BeanMapUtils;
import com.niudada.utils.MapParameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class NoticeService {
    @Autowired
    private NoticeDao noticeDao;

    //添加
    public int create(Notice notice) {
//添加日期
        notice.setDate(new Date());

        return noticeDao.create(notice);
    }

    //删除
    public int delete(Integer id) {
        return noticeDao.delete(MapParameter.getInstance().addId(id).getMap());
    }

    //批量删除
    public int delete(String ids) {
        int count = 0;
        for (String str : ids.split(",")) {
            count = noticeDao.delete(MapParameter.getInstance().addId(Integer.parseInt(str)).getMap());
        }
        return count;
    }

    //修改
    public int update(Notice notice) {
        return noticeDao.update(notice);
    }

    //查询
    public List<Notice> query(Notice notice) {
        if (notice != null && notice.getPage() != null) {
            PageHelper.startPage(notice.getPage(), notice.getLimit());
        }
        return noticeDao.query(BeanMapUtils.beanToMap(notice));
    }

    //根据id查询
    public Notice detail(Integer id) {
        return noticeDao.detail(MapParameter.getInstance().addId(id).getMap());
    }

    //查询总记录数
    public int count(Notice notice) {
        return noticeDao.count(BeanMapUtils.beanToMap(notice));
    }

}
