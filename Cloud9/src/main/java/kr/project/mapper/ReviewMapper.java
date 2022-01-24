package kr.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.project.domain.App;
import kr.project.domain.Review;

public interface ReviewMapper {

	//앱 아이디 문자열로 바꿀것
	public List<Review> reviewRead(String appid);
	
	public String monthRating(@Param("appid")String appid, @Param("month")int month);
	
	public List<Review> reviewEmoRead(@Param("appid")String appid, @Param("apppn")float apppn);
	
	public String reviewEmo(@Param("appid")String appid,@Param("emo")float emo);

	public String allCn(String appid);
	
}
