package kr.project.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.project.domain.App;
import kr.project.domain.AppImg;
import kr.project.domain.Board;
import kr.project.domain.User;
import kr.project.domain.WordCloud;
import kr.project.service.AppService;
import kr.project.service.BoardService;
import kr.project.service.UserService;
import kr.project.service.WordCloudService;

@Controller	
public class mainController {

	@Autowired
	UserService service;
	@Autowired
	BoardService boardService;
	@Autowired
	AppService appService;
	@Autowired
	WordCloudService wordcloudService;
	
	@RequestMapping("/main")
	public String main() { // http://127.0.0.1:8081/web/1
		return "main";
	}	

	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "main";
	}
	
	
	@RequestMapping("/register.do")
	public String register() {
		return "register";
	}
	
	
	
	@RequestMapping(value="/community.do", method=RequestMethod.GET)
	public String community(HttpServletRequest req, Model model) {
		String cate = req.getQueryString();
		if(cate.contains("category0")){
			cate = "0";
		}
		List<Board>boardlist= boardService.boardList(cate);
		model.addAttribute("boardlist",boardlist);
		return "community";
	}
	
	@RequestMapping("/search.do")
	public String appSearch(String appname,Model model){
			if(appname.equals("")) {
			return "search";
		}else {
			List<App>applist = appService.appSearch(appname);
			model.addAttribute("applist",applist);
			model.addAttribute("searchName",appname);
			return "search";
		}
	}
	
	@RequestMapping("/detail.do")
	public String detail(String appid, Model model) {
		List<AppImg>appimg = appService.appImg(appid);
		List<App>appinfo = appService.appInfomation(appid);
		for(int i=0; i<appinfo.size();i++) {
			appinfo.get(i).setAppinfo(appinfo.get(i).getAppinfo().replace("\n", "<br>"));
		}
		model.addAttribute("appinfo", appinfo);
		model.addAttribute("appimg",appimg);
		return "detail";
	}
	
	@RequestMapping("/category.do")
	public String category(HttpServletRequest req, Model model) {
		String cate = req.getQueryString();
		List<App> cateList = appService.cateSearch(cate);
		model.addAttribute("cateList",cateList);
		return "category";
	}
	
	@RequestMapping("/compare.do")
	public String compare() {
		return "comparing";
	}
}
