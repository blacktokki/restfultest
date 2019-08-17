package com.example.restfultest.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@Controller
public class WebController {
  
  @RequestMapping("/")
  public String root_test() throws Exception{
      
	  return "main";
	  
	  
  }

}