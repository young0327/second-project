package kr.project.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.project.domain.Review;
import kr.project.mapper.ReviewMapper;

@Service
public class ReviewSerivice {

	@Autowired
	ReviewMapper mapper;
	
	public List<Review> reviewRead(int appid){
		List<Review> reviewlist = mapper.reviewRead(appid); 
		return reviewlist;
	}
	
	
}
