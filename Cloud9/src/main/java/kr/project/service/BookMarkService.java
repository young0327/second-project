package kr.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.project.domain.App;
import kr.project.mapper.BookMarkMapper;

@Service
public class BookMarkService {

	@Autowired
	BookMarkMapper mapper;
	
	public String bookMarkRead (String appid, String id) {
		String readCount = mapper.bookMarkRead (appid,id);
				return readCount;
	}
	
	public void bookMarkEnroll(String appid,String id) {
		mapper.bookMarkEnroll(appid,id);
		}
	

	public void bookMarkDelete(String appid, String id) {
		mapper.bookMarkDelete(appid,id);
	}
	
	
}
