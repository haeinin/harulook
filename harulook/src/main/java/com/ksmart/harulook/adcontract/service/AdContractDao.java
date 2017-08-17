package com.ksmart.harulook.adcontract.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class AdContractDao {
	
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	/*광고 계약 등록 메서드*/
	 public int insertAdContract(AdContractDto adcontract) {
		 	System.out.println(adcontract);
		 	System.out.println("in DAO");
	        return sqlSessionTemplate.insert("com.ksmart.harulook.adcontract.service.AdContractMapper.insertAdContract", adcontract);	    
	        }
	 /*광고 계약 출력 메서드*/
	 public List<AdContractDto> getAdContractList() {
		 	System.out.println("광고 계약 리스트 출력 메서드 실행");
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adcontract.service.AdContractMapper.selectAdContractListAll");		 
	 }
	 public List<AdContractDto> getAdContractListByAdUserCurrent(String id) {
		 	System.out.println("현재 진행중인 판매자 개인광고 계약 리스트 출력 메서드 실행");
			return sqlSessionTemplate.selectList("com.kmsart.harulook.adcontract.service.AdContractMapper.selectAdContractByAdUserCurrent", id);
	 }
	 public List<AdContractDto> getAdContractListByAdUser(String id) {
		 	System.out.println("현재 진행중이 아닌 판매자 개인광고 계약 리스트 출력 메서드 실행");
			return sqlSessionTemplate.selectList("com.kmsart.harulook.adcontract.service.AdContractMapper.selectAdContractByAdUserCurrent", id);
	 }
	 public String getContractNo(){
		 String lastNo="";
		 return sqlSessionTemplate.selectOne("com.kmsart.harulook.adcontract.service.AdContractMapper.getContractNo",lastNo);
	 }
}
