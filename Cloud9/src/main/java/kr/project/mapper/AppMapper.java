package kr.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.project.domain.App;
import kr.project.domain.AppImg;

public interface AppMapper {

	public List<App> appSearch(String appname);
	
	public List<App> appInfomation(int appid);
	
	public List<AppImg> appImg(int appid);
	
	public List<App> cateSearch(String cate);
	
	public List<App> catePay(@Param("payData")String payData,@Param("payCate")String payCate);
}
