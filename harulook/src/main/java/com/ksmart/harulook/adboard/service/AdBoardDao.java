package com.ksmart.harulook.adboard.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ksmart.harulook.adgoods.service.AdGoodsDto;

@Repository
public class AdBoardDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<AdBoardDto> selectAdBoard(){
		System.out.println("광고 게시물 목록 요청 in Dao");
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adboard.service.AdBoardMapper.selectAdBoardList");
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
