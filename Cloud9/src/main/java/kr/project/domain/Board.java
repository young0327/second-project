package kr.project.domain;

import lombok.Data;

@Data
public class Board {
	private int bidx;
	private String id;
	private String title;
	private String content;
	private String category;
	private String day;
	
}
