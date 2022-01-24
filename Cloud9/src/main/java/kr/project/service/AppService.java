package kr.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.project.domain.App;
import kr.project.domain.AppImg;
import kr.project.mapper.AppMapper;

@Service
public class AppService {

	@Autowired
	AppMapper mapper;
	
	public List<App> appSearch(String appname){
		List<App>applist = mapper.appSearch(appname);
		return applist;
	}
	
	public List<App> appInfomation(String appid){
		List<App>appinfo = mapper.appInfomation(appid);
		return appinfo;
	}
	public List<AppImg> appImg(String appid){
		List<AppImg>appimg= mapper.appImg(appid);
		return appimg; 
	}
	
	public List<App>cateSearch(String cate){
		List<App>cateList = mapper.cateSearch(cate);
		return cateList;
	}
	
	public List<App>catePay(String payD, String payCate){
		List<App>catePayList = mapper.catePay(payD,payCate);
		return catePayList;
	}
	
}
