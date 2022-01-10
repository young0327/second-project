package kr.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.project.domain.Board;
import kr.project.mapper.BoardMapper;

@Service
public class BoardService {

	@Autowired
	BoardMapper mapper;
	
	public List<Board> boardList(String category){
		List<Board> list = mapper.boardList(category);
		return list;
	}
	
	public void boardWrite(Board vo) {
		mapper.boardInsert(vo);
	}
	
	public List<Board> boardRead(String bidx) {
		List<Board> boardDT=mapper.boardRead(bidx);
		return boardDT;
	}
	
	public void boardDelete(String bidx) {
		mapper.boardDelete(bidx);
	}
	
	public void boardModify(String bidx, String title,String content,String category ) {
		mapper.boardUpdate(bidx,title,content,category);
	}
}
