package kr.project.service;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

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
	
	public String monthRating(@Param("appid")int appid, @Param("month")int month) {
		String monthRate = mapper.monthRating(appid,month);
		return monthRate;
	}
	
	public List<Review>reviewEmoRead(@Param("appid")int appid, @Param("apppn")float apppn){
		List<Review>emoReview = mapper.reviewEmoRead(appid,apppn);
		return emoReview;
	}
	
	public String reviewEmo(@Param("appid")int appid, @Param("emo")float emo) {
		String emoPercent = mapper.reviewEmo(appid, emo);
		return emoPercent;
	}
	
	public String allCn(int appid) {
		String allCount = mapper.allCn(appid);
		return allCount;
	}
	
}
