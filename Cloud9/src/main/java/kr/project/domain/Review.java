package kr.project.domain;

import java.time.DayOfWeek;
import java.util.Date;

import lombok.Data;

@Data
public class Review {

    // 리뷰 번호 
    private int reviewNo;

    // 앱 아이디 
    private String appId;

    // 리뷰 제목 
    private String reviewTitle;

    // 리뷰 내용 
    private String reviewContent;

    // 리뷰 평점 
    private float reviewRating;

    // 감성분석 결과 
    private float emoResult;

    // 리뷰 날짜 
    private String reviewDate;

    // 리뷰 작성자 
    private String appCrawlId;

}
