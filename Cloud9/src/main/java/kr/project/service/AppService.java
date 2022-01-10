package kr.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.project.domain.App;
import kr.project.mapper.AppMapper;

@Service
public class AppService {

	@Autowired
	AppMapper mapper;
	
	public List<App> appSearch(String appname){
		List<App>applist = mapper.appSearch(appname);
		return applist;
	}
}
