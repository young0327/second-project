package kr.project.mapper;

import org.apache.ibatis.annotations.Param;

public interface BookMarkMapper {

	
	
	public String bookMarkRead (@Param("appid")String appid, @Param("id")String id);
	
	public void bookMarkEnroll(@Param("appid")String appid, @Param("id")String id);
	
	public int bookMarkDelete(@Param("appid")String appid, @Param("id")String id);

}
