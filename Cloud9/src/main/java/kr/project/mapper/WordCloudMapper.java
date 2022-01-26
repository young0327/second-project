package kr.project.mapper;

import java.util.List;

import kr.project.domain.WordCloud;

public interface WordCloudMapper {

	public List<WordCloud> wordCount(String appid);
	
	
}
