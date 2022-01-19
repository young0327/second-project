package kr.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.project.domain.Deep;
import kr.project.mapper.DeepMapper;

@Service
public class DeepService {

	@Autowired
	DeepMapper mapper;
	
	public List<Deep> emoList(String appid){
		List<Deep>emoResult =mapper.emoList(appid);
		return emoResult;
	}
	
	
}
