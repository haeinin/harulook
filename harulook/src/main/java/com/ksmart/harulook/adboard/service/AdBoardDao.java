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
	public String getBoardNo(){
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adboard.service.AdBoardMapper.getBoardNo");
	}
	
	public int insertAdGoods(AdGoodsDto adGoods){
		System.out.println("DAO에서 입력되는 adGoods : " + adGoods.toString());
		return sqlSessionTemplate.insert("com.ksmart.harulook.adboard.service.AdBoardMapper.insertGoods", adGoods);
	}
	public int insertAdBoard(AdBoardDto adBoard){
		System.out.println("DAO에서 입력되는 adBoardDto : " + adBoard.toString());
		return sqlSessionTemplate.insert("com.ksmart.harulook.adboard.service.AdBoardMapper.insertAdBoard", adBoard);
	}

}
