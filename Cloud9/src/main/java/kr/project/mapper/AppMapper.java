package kr.project.mapper;

import java.util.List;

import kr.project.domain.App;
import kr.project.domain.AppImg;

public interface AppMapper {

	public List<App> appSearch(String appname);
	
	public List<App> appInfomation(int appid);
	
	public List<AppImg> appImg(int appid);
}
