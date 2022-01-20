package kr.project.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.project.domain.App;
import kr.project.domain.Review;
import kr.project.mapper.ReviewMapper;

@Service
public class ReviewService {

	@Autowired
	ReviewMapper mapper;
	
	public List<Review> reviewRead(int appid){
		List<Review> reviewlist = mapper.reviewRead(appid); 
		return reviewlist;
	}
	
	public float monthRating(int appid, int month) {
		float monthRate = mapper.monthRating(appid,month);
		return monthRate;
	}
	
	public List<Review>reviewEmoRead(int appid,float apppn){
		List<Review>emoReview = mapper.reviewEmoRead(appid,apppn);
		return emoReview;
	}
}
