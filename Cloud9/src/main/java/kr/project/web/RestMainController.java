package kr.project.web;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
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
import kr.project.domain.WordCloud;
import kr.project.service.AppService;
import kr.project.service.BoardService;
import kr.project.service.BookMarkService;
import kr.project.service.ReviewService;
import kr.project.service.UserService;
import kr.project.service.WordCloudService;

@RestController
public class RestMainController {

	@Autowired
	UserService userService;
	@Autowired
	BoardService boardService;
	@Autowired
	AppService appService;
	@Autowired
	ReviewService reviewService;
	@Autowired
	WordCloudService wordCloudService;
	@Autowired
	BookMarkService bookMarkService;
	
	//appid 모두 String으로 변경
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
			YN= user.getId();
			session.setAttribute("users", user);
		} else {
			YN="n";

		}
		return YN;
	}

	@GetMapping("/board/list")
	public List<Board> boardListAjax(String cate){
		List<Board>boardlist= boardService.boardList(cate);
		return boardlist;
	}
	
	@PostMapping("/board") 
	public void boardWrite(Board vo) {
		System.out.println(vo);
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
	public List<Review> reviewRead(String appid) {
		List<Review>reviewlist = reviewService.reviewRead(appid);
		return reviewlist;
	}
	
	@GetMapping("/review/monthRate")
	public String monthRating(@Param("appid")String appid, @Param("month")int month) {
		String monthRate = reviewService.monthRating(appid,month);
		return monthRate;
	}
	
	@GetMapping("/cate/pay")
	public List<App> catePay(String payD,String payCate){
		List<App> catePayList = appService.catePay(payD,payCate);
		return catePayList;
	}

	@GetMapping("/review/emo")
	public List<Review> reviewEmoRead(@Param("appid")String appid,  @Param("apppn")float apppn) {
		List<Review>emoReview = reviewService.reviewEmoRead(appid,apppn);
		return emoReview;
	}
	
	@GetMapping("/review/per")
	public HashMap<String, String> reviewEmo (@Param("appid")String appid, @Param("emo")float emo) {
		String allCount = reviewService.allCn(appid);
		String emoCount = reviewService.reviewEmo(appid,emo);
		HashMap<String, String> emoMap = new HashMap<String, String>();
		emoMap.put("allCount",allCount);
		emoMap.put("emoCount",emoCount);
		return emoMap;
	}
	
	@GetMapping("/wordcloud")
	public List<WordCloud> wordCount(String appid){
		List<WordCloud> wordList = wordCloudService.wordCount(appid);
		return wordList;
	}
	
	@GetMapping("/compare/list")
	public List<App> compareApp(String cate){
		List<App>cateList = appService.cateSearch(cate);
		return cateList;
	}
	
	@GetMapping("/compare/app")
	public List<App> pickedApp(String appname){
		List<App>appinfo = appService.appSearch(appname);
		return appinfo;
	}
	
	@GetMapping("/compare/review")
	public HashMap<String, String> compareEmo (@Param("appid")String appid, @Param("emo")float emo) {
		System.out.println(appid);
		System.out.println(emo);
		String allCount = reviewService.allCn(appid);
		String emoCount = reviewService.reviewEmo(appid,emo);
		HashMap<String, String> emoMap = new HashMap<String, String>();
		emoMap.put("allCount",allCount);
		emoMap.put("emoCount",emoCount);
		return emoMap;
	}
	
	@GetMapping("/bookmark/list")
	public String bookMarkRead (String appid, String id) {
	String readCount = bookMarkService.bookMarkRead (appid,id);
	return readCount;
	}
	
	@PostMapping("bookmark/enroll")
	public String bookMarkEnroll(String appid,String id) {
		String YNN="";
		if(id !="") {
		 YNN="Y";
	bookMarkService.bookMarkEnroll(appid,id);
	}else {
		 YNN="N";
	}
	return YNN;
	}
	
	@DeleteMapping("bookmark/cancel")
	public void bookMarkDelete(String appid,String id) {
		System.out.println(appid+"/"+id);
		System.out.println(bookMarkService.bookMarkDelete(appid, id));
	}
	
	@GetMapping("/bookmark/img")
	public List<App>bookMarkImg(String id){
		List<App>bookMarklist = appService.bookMarkImg(id);
		return bookMarklist;
	}
	
}
