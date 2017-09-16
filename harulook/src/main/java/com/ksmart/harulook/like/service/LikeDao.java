package com.ksmart.harulook.like.service;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LikeDao implements LikeInterface {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/* sns게시물 삭제 시 예뻐요 삭제 */
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.like.service.LikeInterface#deleteboardLike(java.lang.String)
	 */
	@Override
	public int deleteboardLike(String snsBoardNo) {
		return sqlSessionTemplate.delete("com.ksmart.harulook.like.service.LikeMapper.boardLikeDelete", snsBoardNo);
	}
	
	/* 가장 최근에 등록한 예뻐요 번호 */
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.like.service.LikeInterface#selectLastLikeNo()
	 */
	@Override
	public String selectLastLikeNo() {
        String lastLikeNo = "";
        return sqlSessionTemplate.selectOne("com.ksmart.harulook.like.service.LikeMapper.getLastLikeNo", lastLikeNo);
 	}
	
	/* sns게시물 예뻐요 수 조회 */
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.like.service.LikeInterface#selectLikeCount(java.lang.String)
	 */
	@Override
	public int selectLikeCount(String snsBoardNo) {
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.like.service.LikeMapper.getLikeCount",snsBoardNo);
	}
	
	/* sns게시물 예뻐요 등록 여부 확인 메서드 */
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.like.service.LikeInterface#selectLikeClick(java.lang.String, java.lang.String)
	 */
	@Override
	public int selectLikeClick(String snsBoardNo, String userId) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("snsBoardNo", snsBoardNo);
		map.put("userId", userId);
		System.out.println("map : "+map);
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.like.service.LikeMapper.getLikeClick", map);
	}
	
	/* sns게시물 예뻐요 등록 */
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.like.service.LikeInterface#insertLike(java.lang.String, java.lang.String, java.lang.String)
	 */
	@Override
	public int insertLike(String snsLikeNo, String snsBoardNo, String userId) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("snsLikeNo", snsLikeNo);
		map.put("snsBoardNo", snsBoardNo);
		map.put("userId", userId);
		System.out.println("map : "+map+" in likeInsert");
		return sqlSessionTemplate.insert("com.ksmart.harulook.like.service.LikeMapper.likeInsert", map);
	}
	
	/* sns게시물 예뻐요 등록 취소 */
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.like.service.LikeInterface#deleteLike(java.lang.String, java.lang.String)
	 */
	@Override
	public int deleteLike(String snsBoardNo, String userId) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("snsBoardNo", snsBoardNo);
		map.put("userId", userId);
		System.out.println("map : "+map+" in likeDelete");
		return sqlSessionTemplate.delete("com.ksmart.harulook.like.service.LikeMapper.likeDelete", map);
	}
	
}
