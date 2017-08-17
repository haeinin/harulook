package com.ksmart.harulook.like.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LikeDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int likeInsert(LikeDto like) {
		return sqlSessionTemplate.insert("com.ksmart.harulook.like.LikeMapper.likeInsert", like);
	}
	
	public int likeDelete(LikeDto like) {
		return sqlSessionTemplate.delete("com.ksmart.harulook.like.LikeMapper.likeDelete", like);
	}
	
}
