package com.ksmart.harulook.adgoods.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class AdGoodsDao {
	@Autowired
	
	SqlSessionTemplate sqlSessionTemplate;
	public AdGoodsDto selectAdGoods(String adgoodsNo){
		System.out.println("광고 상품 상세보기 화면 요청 in Dao");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adgoods.service.AdgoodsMapper.selectAdGoods", adgoodsNo);
	}

}
