package com.niudada.controller;

import com.niudada.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/job")
public class JobController {

    @Autowired
    private JobService jobService;




}
