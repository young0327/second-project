package kr.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.project.domain.Review;

public interface ReviewMapper {

	//앱 아이디 문자열로 바꿀것
	public List<Review> reviewRead(int appid);
	
	public float monthRating(@Param("appid")int appid, @Param("month")int month);
	
	
}
