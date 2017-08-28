package com.ksmart.harulook.adboard.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ksmart.harulook.adgoods.AdGoodsDto;

@Repository
public class AdBoardDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	public void insertAdBoard(String adcontractno) {
		
	}
	
	public String getGoodsNo(){
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adboard.service.AdBoardMapper.getGoodsNo");
	}
	
	public int insertAdGoods(AdGoodsDto adGoods){
		return sqlSessionTemplate.insert("com.ksmart.harulook.adboard.service.AdBoardMapper.insertGoods", adGoods);
	}

}
