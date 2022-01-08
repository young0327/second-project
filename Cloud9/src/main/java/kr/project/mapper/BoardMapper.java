package kr.project.mapper;

import java.util.List;

import kr.project.domain.Board;

public interface BoardMapper {

	public List<Board> boardList(String category);
	
	public void boardInsert(Board vo);
	
	public List<Board> boardRead(String bidx);
	
	public void boardDelete(String bidx);
}
