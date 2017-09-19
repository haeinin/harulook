package com.ksmart.harulook.like.controller;

import java.awt.Image;
import java.net.URI;

import javax.servlet.http.HttpServletRequest;
import javax.swing.ImageIcon;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ksmart.harulook.like.service.LikeInterface;
import com.ksmart.harulook.like.service.LikeToggleDto;

@RestController
public class LikeRestController {

	@Autowired
	private LikeInterface likeDao;
	
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
	
	/* 게시물 상세보기 이미지의 세로 사이즈 구하기 */
	@RequestMapping(value = "/getSize", method = RequestMethod.POST)
	public float getSize(@RequestParam(value="imgroot", required=true) String imgroot, HttpServletRequest request){
	    // 이미지 읽기
		String root = request.getSession().getServletContext().getRealPath("/");

	    // 이미지 파일 위치
	    String filename = root+imgroot;
	    System.out.println("루트경로 :"+ root );
	    System.out.println("원본경로 :"+ imgroot );
	    System.out.println("이미지경로 :"+ filename );
	
	    // 이미지 읽기
	    Image img = new ImageIcon(filename).getImage();
	 
	    float Widthsize = img.getWidth(null);	//가로사이즈
	    float Heightsize = img.getHeight(null);	//세로사이즈
	    System.out.println("가로 :"+ Widthsize );
	    System.out.println("세로 :"+ Heightsize );
	    
	    float size=(Heightsize/Widthsize)*588; //비율계산
	    System.out.println("사이즈 :"+ size );
		return size;
	}

	
}
