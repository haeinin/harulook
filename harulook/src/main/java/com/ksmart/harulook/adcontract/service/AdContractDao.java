package com.ksmart.harulook.adcontract.service;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ksmart.harulook.adcontract.service.AdContractDto;
import com.ksmart.harulook.adrefund.service.AdRefundDao;
import com.ksmart.harulook.adrefund.service.AdRefundDto;
@Repository
public class AdContractDao {
	
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	@Autowired
	private AdRefundDao adrefunddao;
	/*광고 계약 등록 메서드*/
	 public int insertAdContract(AdContractDto adcontract) {
			 System.out.println("in DAO");	
			 System.out.println(adcontract);
	        return sqlSessionTemplate.insert("com.ksmart.harulook.adcontract.service.AdContractMapper.insertAdContract", adcontract);	    
	        }

	 /*현재진행중인 광고 계약 출력 메서드*/
	 public List<AdContractDto> getAdContractListCurrent() {
		 	System.out.println("현재 진행중인 광고 계약 리스트 출력 메서드 실행");
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adcontract.service.AdContractMapper.selectAdContractListCurrent");		 
	 }
	 /*광고주 ID에 해당하는 광고 계약 출력 메서드*/
	 public List<AdContractDto> getAdContractList(String SID) {
		 	System.out.println("광고주 ID에 해당하는 광고 계약 리스트 출력 메서드 실행");
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adcontract.service.AdContractMapper.selectAdContractListByUser", SID);		 
	 }
	 /*모든 ID에 해당하는 광고 계약 출력 메서드*/
	 public List<AdContractDto> getAdContractList() {
		 	System.out.println("모든 ID에 해당하는 광고 계약 리스트 출력 메서드 실행");
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adcontract.service.AdContractMapper.selectAdContractList");		 
	 }	 
	 public String getContractNo(){
		 return sqlSessionTemplate.selectOne("com.ksmart.harulook.adcontract.service.AdContractMapper.getContractNo");
	 }

	 public String getPrice(String adtype){
		 System.out.println("품목별 광고금액 요청 in Dao");
		 System.out.println(adtype);
		 return sqlSessionTemplate.selectOne("com.ksmart.harulook.adcontract.service.AdContractMapper.getPrice", adtype);
		 
	 }
	 public String getDc(String dc){
		 System.out.println("기간별 할인율 요청 in Dao");
		 System.out.println(dc);
		 return sqlSessionTemplate.selectOne("com.ksmart.harulook.adcontract.service.AdContractMapper.getDc", dc);
		 
	 }
	public int modifyContractStat(String adcontractno) {
		 System.out.println("광고 계약 상태 수정요청 in Dao");
		 System.out.println(adcontractno);
		 System.out.println("환불 예정내역 등록완료");
		return sqlSessionTemplate.update("com.ksmart.harulook.adcontract.service.AdContractMapper.modifyContract", adcontractno);
	}
	public int insertRefund(AdRefundDto refund) {
		 System.out.println("광고 계약 상태 수정요청 in Dao");
		 System.out.println(refund);
		 System.out.println("환불 예정내역 등록완료");
		return sqlSessionTemplate.update("com.ksmart.harulook.adcontract.service.AdContractMapper.modifyContract", refund);
	}

	public int approveContractStat(String adcontractno) {
		System.out.println("광고 계약 승인 요청 in Dao");
		 System.out.println(adcontractno);
		return sqlSessionTemplate.update("com.ksmart.harulook.adcontract.service.AdContractMapper.approveContract", adcontractno);
		
	}

	public int approveCancel(String adcontractno) {
		System.out.println("광고 계약 취소 승인 요청 in Dao");
		 System.out.println(adcontractno);
		return sqlSessionTemplate.update("com.ksmart.harulook.adcontract.service.AdContractMapper.approveCancel", adcontractno);
		
		
	}
	public int adWait(String adcontractno) {
		System.out.println("광고 대기 요청 in Dao");
		 System.out.println(adcontractno);
		return sqlSessionTemplate.update("com.ksmart.harulook.adcontract.service.AdContractMapper.adWait", adcontractno);
		
		
	}
	
}
