package kr.project.mapper;

import java.util.List;

import kr.project.domain.Review;

public interface ReviewMapper {

	
	public List<Review> reviewRead(int appid);
}
