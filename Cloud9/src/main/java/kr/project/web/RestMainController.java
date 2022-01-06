package kr.project.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mysql.fabric.Response;

import kr.project.domain.Board;
import kr.project.domain.User;
import kr.project.service.BoardService;
import kr.project.service.UserService;

@RestController
public class RestMainController {

	@Autowired
	UserService userService;
	@Autowired
	BoardService boardService;
	
	@PostMapping("/joinAjax.do")
	public void joinAjax(User vo) {
		userService.regist(vo);
	}

	@GetMapping("/idcheckAjax.do")
	public int idcheckAjax(String id) {
		int result =userService.idcheckAjax(id);
		return result;
	}
	

	@PostMapping("/login.do")
	public String login(User vo, HttpSession session) {
		User user = userService.login(vo);
		String YN;
		if (user != null) {
			YN="y";
			session.setAttribute("users", user);
		} else {
			YN="n";

		}
		return YN;
	}

	@GetMapping("/boardListAjax.do")
	public String boardListAjax(String cate, HttpSession session){
		System.out.println("넘어와!");
		System.out.println("카테고리:"+cate);
		if(cate.equals("category0")){
			cate = "category";
		}
		List<Board>boardlist= boardService.boardList(cate);
		session.setAttribute("boardlist",boardlist);
		return "community";
	}
}
