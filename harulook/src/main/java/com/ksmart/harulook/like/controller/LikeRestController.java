package com.ksmart.harulook.like.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ksmart.harulook.like.service.LikeDao;
import com.ksmart.harulook.like.service.LikeToggleDto;

@RestController
public class LikeRestController {

	@Autowired
	private LikeDao likeDao;
	
	/* sns게시물의 예뻐요 버튼 클릭 */
	@RequestMapping(value="/likeBtnClick", method = RequestMethod.POST)
	public LikeToggleDto likeBtnClick(
			@RequestParam(value="snsBoardNo", required=true) String snsBoardNo
			,@RequestParam(value="userId", required=true) String userId) {
		System.out.println("likeBtnClick 요청");
		int likeClick = likeDao.selectLikeClick(snsBoardNo, userId);
		System.out.println("likeClick : "+likeClick);
		if(likeClick != 0) {
			likeDao.deleteLike(snsBoardNo, userId);
		} else {
			/******** sns_board_no의 끝 숫자 자동 입력 *****************/
			 String lastLikeNo = likeDao.selectLastLikeNo();
			 int insertLikeNo = 1;    //DB에 등록된 게시물이 없을 때 번호의 초기값
			 if(lastLikeNo != null) {
			      insertLikeNo = Integer.parseInt(lastLikeNo)+1;
			 }
			 String snsLikeNo = "sns_like_"+insertLikeNo;
			/*************************************************/
			likeDao.insertLike(snsLikeNo, snsBoardNo, userId);
		}
		int snsLikeCount = likeDao.selectLikeCount(snsBoardNo);
		LikeToggleDto likeToggle = new LikeToggleDto();
		likeToggle.setLikeClick(likeClick);
		likeToggle.setSnsLikeCount(snsLikeCount);
		System.out.println("likeToggle : "+likeToggle);
		return likeToggle;
	}
}