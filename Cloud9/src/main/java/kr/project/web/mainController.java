package kr.project.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.project.domain.Board;
import kr.project.domain.User;
import kr.project.service.BoardService;
import kr.project.service.UserService;

@Controller	
public class mainController {

	@Autowired
	UserService service;
	@Autowired
	BoardService boardService;
	
	@RequestMapping("/main")
	public String main() { // http://127.0.0.1:8081/web/1
		return "main";
	}	


	
	@RequestMapping("/register.do")
	public String register() {
		return "register";
	}
	
	
	
	@RequestMapping("/community.do")
	public String community(HttpServletRequest req, Model model) {
		String cate = req.getQueryString();
		System.out.println(cate);
		if(cate.contains("category0")){
			cate = "category";
			System.out.println(cate);
		}
		List<Board>boardlist= boardService.boardList(cate);
		model.addAttribute("boardlist",boardlist);
		return "community";
	}
	
}
