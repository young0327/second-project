package kr.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.project.domain.Board;

public interface BoardMapper {

	public List<Board> boardList(String category);
	
	public void boardInsert(Board vo);
	
	public List<Board> boardRead(String bidx);
	
	public void boardDelete(String bidx);
	
	public void boardUpdate(@Param("bidx") String bidx, @Param("title")String title, @Param("content")String content, @Param("category")String category);
}
