package kr.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.project.domain.WordCloud;
import kr.project.mapper.WordCloudMapper;

@Service
public class WordCloudService {

	@Autowired
	WordCloudMapper mapper;
	
	public List<WordCloud> wordCount(String appid){
		List<WordCloud>wordList =mapper.wordCount(appid);
		return wordList;
	}

	
}

