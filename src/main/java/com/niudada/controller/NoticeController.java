package com.niudada.controller;

import com.niudada.entity.Notice;
import com.niudada.service.NoticeService;
import com.niudada.utils.MapControl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/notice")
public class NoticeController {

    private final String LIST = "notice/list";
    private final String ADD = "notice/add";
    private final String UPDATE = "notice/update";
    private final String LOOK = "notice/look";

    @Autowired
    private NoticeService noticeService;

    //跳转添加页面
    @GetMapping("/add")
    public String add() {
        return ADD;
    }

    //添加操作
    @PostMapping("/create")
    @ResponseBody
    public Map<String, Object> create(Notice notice, HttpSession session) {
        notice.setAuth("1");
        int result = noticeService.create(notice);
        if (result <= 0) {
            //新增失败
            return MapControl.getInstance().error().getMap();
        }
        return MapControl.getInstance().success().getMap();
    }

    //根据id删除
    @PostMapping("/delete/{id}")
    @ResponseBody
    public Map<String, Object> delete(@PathVariable("id") Integer id) {
        int result = noticeService.delete(id);
        if (result <= 0) {
            return MapControl.getInstance().error().getMap();
        }
        return MapControl.getInstance().success().getMap();
    }

    //批量删除
    @PostMapping("/delete")
    @ResponseBody
    public Map<String, Object> delete(String ids) {
        int result = noticeService.delete(ids);
        if (result <= 0) {
            return MapControl.getInstance().error().getMap();
        }
        return MapControl.getInstance().success().getMap();
    }

    //修改操作
    @PostMapping("/update")
    @ResponseBody
    public Map<String, Object> update(@RequestBody Notice notice) {
        System.out.println(notice);
        int result = noticeService.update(notice);
        if (result <= 0) {
            //新增失败
            return MapControl.getInstance().error().getMap();
        }
        return MapControl.getInstance().success().getMap();
    }

    //根据id查询，跳转修改页面
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable Integer id, ModelMap modelMap) {
        //查询要修改的老师
        Notice notice = noticeService.detail(id);
        modelMap.addAttribute("notice", notice);
        return UPDATE;
    } //根据id查询，跳转修改页面
    @GetMapping("/look/{id}")
    public String look(@PathVariable Integer id, ModelMap modelMap) {
        //查询要修改的老师
        Notice notice = noticeService.detail(id);
        modelMap.addAttribute("notice", notice);
        return LOOK;
    }

    //查询所有
    @PostMapping("/query")
    @ResponseBody
    public Map<String, Object> query(@RequestBody Notice notice) {
        List<Notice> list = noticeService.query(notice);
        Integer count = noticeService.count(notice);
        return MapControl.getInstance().success().put("data", list).put("count", count).getMap();
    }

    //跳转列表页面
    @GetMapping("/list")
    public String list() {
        return LIST;
    }
}
