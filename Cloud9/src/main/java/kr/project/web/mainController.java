package kr.project.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.project.domain.User;
import kr.project.service.UserService;

@Controller	
public class mainController {

	@Autowired
	UserService service;
	
	@RequestMapping("/main")
	public String main() { // http://127.0.0.1:8081/web/1
		return "main";
	}	


	
	@RequestMapping("/register.do")
	public String register() {
		return "register";
	}
	
	@RequestMapping("/community.do")
	public String community() {
		System.out.println("할로");
		return "community";
	}
}
