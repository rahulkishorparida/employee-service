package com.example.demo.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/employee")
public class HelloController {

    @GetMapping("/hello")
    public String hello() {
        return " Welcome to Dashboard!!";
    }

    @GetMapping("/hi")
    public String hi() {
        return " Welcome to DevSecOps Dashboard!!";
    }

}