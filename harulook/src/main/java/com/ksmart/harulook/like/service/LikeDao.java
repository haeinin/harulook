package com.ksmart.harulook.like.service;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LikeDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/* sns게시물 삭제 시 예뻐요 삭제 */
	public int boardLikeDelete(String snsBoardNo) {
		return sqlSessionTemplate.delete("com.ksmart.harulook.like.service.LikeMapper.boardLikeDelete", snsBoardNo);
	}
	
	/* 가장 최근에 등록한 예뻐요 번호 */
	public String getLastLikeNo() {
        String lastLikeNo = "";
        return sqlSessionTemplate.selectOne("com.ksmart.harulook.like.service.LikeMapper.getLastLikeNo", lastLikeNo);
 	}
	
	/* sns게시물 예뻐요 수 조회 */
	public int getLikeCount(String snsBoardNo) {
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.like.service.LikeMapper.getLikeCount",snsBoardNo);
	}
	
	/* sns게시물 예뻐요 등록 여부 확인 메서드 */
	public int getLikeClick(String snsBoardNo, String userId) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("snsBoardNo", snsBoardNo);
		map.put("userId", userId);
		System.out.println("map : "+map);
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.like.service.LikeMapper.getLikeClick", map);
	}
	
	/* sns게시물 예뻐요 등록 */
	public int likeInsert(String snsLikeNo, String snsBoardNo, String userId) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("snsLikeNo", snsLikeNo);
		map.put("snsBoardNo", snsBoardNo);
		map.put("userId", userId);
		System.out.println("map : "+map+" in likeInsert");
		return sqlSessionTemplate.insert("com.ksmart.harulook.like.service.LikeMapper.likeInsert", map);
	}
	
	/* sns게시물 예뻐요 등록 취소 */
	public int likeDelete(String snsBoardNo, String userId) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("snsBoardNo", snsBoardNo);
		map.put("userId", userId);
		System.out.println("map : "+map+" in likeDelete");
		return sqlSessionTemplate.delete("com.ksmart.harulook.like.service.LikeMapper.likeDelete", map);
	}
	
}
