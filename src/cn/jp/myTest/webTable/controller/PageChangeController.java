package cn.jp.myTest.webTable.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageChangeController {
	    
    @RequestMapping("/toWebTable")
    public String showWebTable(){
        return "webTable"; 
    }
}
