package kr.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.project.domain.App;
import kr.project.domain.AppImg;
import kr.project.domain.WordCloud;

public interface AppMapper {

	public List<App> appSearch(String appname);
	
	public List<App> appInfomation(String appid);
	
	public List<AppImg> appImg(String appid);
	
	public List<App> cateSearch(String cate);
	
	public List<App> catePay(@Param("payD")String payD,@Param("payCate")String payCate);

	public List<App> bookMarkImg(String id);
	
}
