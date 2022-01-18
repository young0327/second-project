package kr.project.web;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.project.domain.App;
import kr.project.domain.Board;
import kr.project.domain.Review;
import kr.project.domain.User;
import kr.project.service.AppService;
import kr.project.service.BoardService;
import kr.project.service.ReviewSerivice;
import kr.project.service.UserService;

@RestController
public class RestMainController {

	@Autowired
	UserService userService;
	@Autowired
	BoardService boardService;
	@Autowired
	AppService appService;
	@Autowired
	ReviewSerivice reviewService;
	
	@PostMapping("/user/singUp")
	public void joinAjax(User vo) {
		userService.regist(vo);
	}
	
	@GetMapping("/user/idCheck")
	public int idcheckAjax(String id) {
		int result = userService.idcheckAjax(id);
		return result;
	}
	

	@GetMapping("/user/login")
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

	@GetMapping("/board/list")
	public List<Board> boardListAjax(String cate){
		if(cate.equals("category0")){
			cate = "category";
		}
		List<Board>boardlist= boardService.boardList(cate);
		return boardlist;
	}
	
	@PostMapping("/board") 
	public void boardWrite(Board vo) {
		boardService.boardWrite(vo);
	}
	 
	@GetMapping("/board/bidx") 
	public List<Board> boardread(String bidx) {
		List<Board>boardDT =boardService.boardRead(bidx);
		return boardDT;
	}
	
	@DeleteMapping("/board/bidx")
	public void boardDelete(String bidx) {
		boardService.boardDelete(bidx);
	}
	
	@PatchMapping("/board")
	public void boardModify(String bidx, String title,String content,String category ) {
		boardService.boardModify(bidx,title,content,category);
	}
	
	@GetMapping("/review")
	public List<Review> reviewRead(int appid) {
		List<Review>reviewlist = reviewService.reviewRead(appid);
		return reviewlist;
	}
	
	@GetMapping("/app/monthRate")
	public float monthRating(int appid, int month) {
		float monthRate = reviewService.monthRating(appid,month);
		return monthRate;
	}
	
	@GetMapping("/cate/pay")
	public List<App> catePay(String payData, String payCate){
		List<App> catePayList = appService.catePay(payData,payCate);
		return catePayList;
	}
}
