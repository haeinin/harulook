package com.ksmart.harulook.adboard.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public int insertAdBoard(AdBoardDto adBoard){
		System.out.println("DAO에서 입력되는 adBoardDto : " + adBoard.toString());
		return sqlSessionTemplate.insert("com.ksmart.harulook.adboard.service.AdBoardMapper.insertAdBoard", adBoard);
	}
	public List<AdBoardDto> selectAdBoardByContractId(String adContractNo){
		System.out.println("수정 화면 요청 in Dao");
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adboard.service.AdBoardMapper.selectAdBoardListbyContractId", adContractNo);
	}
	public int deleteAdBoard(String adBoardNo){
		System.out.println("광고 게시물 삭제 요청 in Dao");
		return sqlSessionTemplate.delete("com.ksmart.harulook.adboard.service.AdBoardMapper.deleteAdBoard", adBoardNo);
	}
	public AdBoardDto selectBoardDetail(String adBoardNo) {
		System.out.println("광고 상세 보기 내용 요청 in Dao");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adboard.service.AdBoardMapper.selectAdBoardDetail", adBoardNo);
	}
	public String getPlace1TempCount(String temp){
		System.out.println("현재 온도에 맞는 광고 게시물 수 요청 in Dao");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adboard.service.AdBoardMapper.getPlace1TempCount", temp);
	}
	public String getPlace2TempCount(String temp){
		System.out.println("현재 온도에 맞는 광고 게시물 수 요청 in Dao");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adboard.service.AdBoardMapper.getPlace2TempCount", temp);
	}
	public String getPlace3TempCount(String temp){
		System.out.println("현재 온도에 맞는 광고 게시물 수 요청 in Dao");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adboard.service.AdBoardMapper.getPlace3TempCount", temp);
	}
	public AdBoardDto selectBoardPlace1WhenCount0(){
		System.out.println("첫번째 위치 광고 게시물 내용 요청 in Dao");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adboard.service.AdBoardMapper.selectBoardPlace1WhenCount0");
	}
	public AdBoardDto selectBoardPlace1WhenCount1(){
		System.out.println("첫번째 위치 광고 게시물 내용 요청 in Dao");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adboard.service.AdBoardMapper.selectBoardPlace1WhenCount1");
	}
	public AdBoardDto selectBoardPlace1WhenCount2(){
		System.out.println("첫번째 위치 광고 게시물 내용 요청 in Dao");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adboard.service.AdBoardMapper.selectBoardPlace1WhenCount2");
	}
	public AdBoardDto selectBoardPlace2WhenCount0(){
		System.out.println("두번째 위치 광고 게시물 내용 요청 in Dao");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adboard.service.AdBoardMapper.selectBoardPlace2WhenCount0");
	}
	public AdBoardDto selectBoardPlace2WhenCount1(){
		System.out.println("두번째 위치 광고 게시물 내용 요청 in Dao");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adboard.service.AdBoardMapper.selectBoardPlace2WhenCount1");
	}
	public AdBoardDto selectBoardPlace2WhenCount2(){
		System.out.println("두번째 위치 광고 게시물 내용 요청 in Dao");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adboard.service.AdBoardMapper.selectBoardPlace2WhenCount2");
	}
	public AdBoardDto selectBoardPlace3WhenCount0(){
		System.out.println("세번째 위치 광고 게시물 내용 요청 in Dao");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adboard.service.AdBoardMapper.selectBoardPlace3WhenCount0");
	}
	public AdBoardDto selectBoardPlace3WhenCount1(){
		System.out.println("세번째 위치 광고 게시물 내용 요청 in Dao");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adboard.service.AdBoardMapper.selectBoardPlace3WhenCount1");
	}
	public AdBoardDto selectBoardPlace3WhenCount2(){
		System.out.println("세번째 위치 광고 게시물 내용 요청 in Dao");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adboard.service.AdBoardMapper.selectBoardPlace3WhenCount2");
	}
	

}
