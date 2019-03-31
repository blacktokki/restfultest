package com.example.restfultest.controller;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.*;
import com.example.restfultest.entity.Demo;
 
@RestController
public class CommonController {
    ArrayList<Demo> demos=new ArrayList<Demo>();
	
    @GetMapping("/demo")
    public ArrayList<Demo> demo(){
        return this.demos;
    }
    @GetMapping("/demo/{idx}")
    public Demo demoFind(@PathVariable("idx") int idx){
        return this.demos.get(idx);
    }
 
    @PostMapping("/demo")
    public void demo(@ModelAttribute("Demo") Demo demo){
        demo.setIdx(this.demos.size());
    	this.demos.add(demo);
    }
    
    @PutMapping("/demo/{idx}")
	public void demo(@ModelAttribute("Demo") Demo demo,@PathVariable("idx") int idx){
		this.demos.get(idx).setName(demo.getName());
		this.demos.get(idx).setPassword(demo.getPassword());
	}
    @DeleteMapping("/demo/{idx}")
	public void demo(@PathVariable("idx") int idx){
		this.demos.get(idx).setName(null);
		this.demos.get(idx).setPassword(null);
	}

    
    /*
    @RequestMapping("/abcd2")
    public @ResponseBody String abcd2() throws Exception {
        return "abcd2";
    }*/

 
}