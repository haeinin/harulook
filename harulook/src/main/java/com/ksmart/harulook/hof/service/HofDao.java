package com.ksmart.harulook.hof.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HofDao {
	
	@Autowired
	 private SqlSessionTemplate sqlSessionTemplate;
	
	public List<HofRankDto> getBoardLikeRank(){
		return sqlSessionTemplate.selectList("com.ksmart.harulook.hof.service.HofMapper.getBoardLikeRank");
	}
	public int insertHof(HofDto dto){
		return sqlSessionTemplate.insert("com.ksmart.harulook.hof.service.HofMapper.insertHof",dto);
	}
	public List<HofDto> getHofList(){
		return sqlSessionTemplate.selectList("com.ksmart.harulook.hof.service.HofMapper.getHofList");
	}
	
}
