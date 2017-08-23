package com.ksmart.harulook.hof.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HofDao {
	
	@Autowired
	 private SqlSessionTemplate sqlSessionTemplate;
	
	/*이번 달 좋아요 랭크보기*/
	public List<HofRankDto> getBoardLikeRank(){
		return sqlSessionTemplate.selectList("com.ksmart.harulook.hof.service.HofMapper.getBoardLikeRank");
	}
	/*명예의전당 등록처리*/
	public int insertHof(HofDto dto){
		return sqlSessionTemplate.insert("com.ksmart.harulook.hof.service.HofMapper.insertHof",dto);
	}
	/*이번 달 명예의전당 목록보기*/
	public List<HofDto> getHofList(){
		return sqlSessionTemplate.selectList("com.ksmart.harulook.hof.service.HofMapper.getHofList");
	}
	/*명예의전당 중복체크*/
	public int selectDuplicateHof(String boardNo){
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.hof.service.HofMapper.dupliacteHof",boardNo);
	}
}
