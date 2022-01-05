package kr.project.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.project.domain.User;
import kr.project.service.UserService;

@RestController
public class RestMainController {

	@Autowired
	UserService service;
	
	@PostMapping("/joinAjax.do")
	public void joinAjax(User vo) {
		service.regist(vo);
	}

	@GetMapping("/idcheckAjax.do")
	public int idcheckAjax(String id) {
		int result = service.idcheckAjax(id);
		return result;
	}
	

	@PostMapping("/login.do")
	public String login(User vo, HttpSession session) {
		User user = service.login(vo);
		String YN;
		if (user != null) {
			YN="y";
			session.setAttribute("users", user);
		} else {
			YN="n";

		}
		return YN;
	}

}
