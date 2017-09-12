package com.ksmart.harulook.adcontract.service;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ksmart.harulook.adboard.service.AdBoardDto;
import com.ksmart.harulook.adcontract.service.AdContractDto;
import com.ksmart.harulook.adrefund.service.AdRefundDto;
@Repository
public class AdContractDao {
	
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	
	public int updateBadAdContract(String adContractNo){
		System.out.println("불량 광고 계약 취소 메서드 실행 in Dao");
		System.out.println("계약 번호 : " + adContractNo);
		return sqlSessionTemplate.update("com.ksmart.harulook.adcontract.service.AdContractMapper.updateBadAdContract", adContractNo);
	}
	
	public int updateAdContract(AdContractDto adcontract){
		System.out.println("광고 계약 수정 메서드 실행");
		System.out.println(adcontract);
		return sqlSessionTemplate.update("com.ksmart.harulook.adcontract.service.AdContractMapper.updateAdContract", adcontract);
	}
	
	public AdContractDto selectAdContractByContractNo(String contractno){
		System.out.println("계약 번호에 해당하는 계약 내용 출력 메서드 실행");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adcontract.service.AdContractMapper.SelectAdContractByContractNo", contractno);
	}
	
	public int updateEndContract(String adContractNo){
		System.out.print("광고상태 변경(광고진행중 -> 계약만료)메서드 실행");
		return sqlSessionTemplate.update("com.ksmart.harulook.adcontract.service.AdContractMapper.UpdateEndContract", adContractNo);
	}
	
	public int updateIngContract(String adContractNo){
		System.out.print("광고상태 변경(광고대기 -> 광고진행중)메서드 실행");
		return sqlSessionTemplate.update("com.ksmart.harulook.adcontract.service.AdContractMapper.UpdateIngContract", adContractNo);
	}
	/*광고상태 변경메서드(광고중->계약만료 으로 바꿔야할 계약번호 조회)*/
	public List<AdContractDto> getUpdateEndContract(){
		System.out.println("(진행중->계약만료) 갱신될 계약번호 조회 메서드 실행");
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adcontract.service.AdContractMapper.selectUpdateEndContract");
	}
	/*광고상태 변경메서드(광고대기 -> 광고중으로 바꿔야 할 계약번호 조회)*/
	public List<AdContractDto> getUpdateIngContract(){
		System.out.println("(광고대기->진행중) 갱신될 계약번호 조회 메서드 실행");
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adcontract.service.AdContractMapper.selectUpdateIngContract");
	}
	
	/*광고 계약 등록 메서드*/
	 public int insertAdContract(AdContractDto adcontract) {
		 System.out.println("in DAO");	
		 System.out.println(adcontract);
	     return sqlSessionTemplate.insert("com.ksmart.harulook.adcontract.service.AdContractMapper.insertAdContract", adcontract);	    
	 }
	 /*현재진행중인 광고 계약 출력 메서드*/
	 public AdContractDto getAdContractListCurrentPlace1(){
		 
		 System.out.println("위치 1에 해당하는 계약 리스트 출력");
		 return sqlSessionTemplate.selectOne("com.ksmart.harulook.adcontract.service.AdContractMapper.selectAdContractListCurrentPlace1");
	 }
	 public AdContractDto getAdContractListCurrentPlace2(){
		 System.out.println("위치 2에 해당하는 계약 리스트 출력");
		 return sqlSessionTemplate.selectOne("com.ksmart.harulook.adcontract.service.AdContractMapper.selectAdContractListCurrentPlace2");
	 }
	 public AdContractDto getAdContractListCurrentPlace3(){
		 System.out.println("위치 3에 해당하는 계약 리스트 출력");
		 return sqlSessionTemplate.selectOne("com.ksmart.harulook.adcontract.service.AdContractMapper.selectAdContractListCurrentPlace3");
	 }
	 /*모든 ID에 해당하는 광고 취소 요청 리스트 출력 메서드*/
	 public List<AdContractDto> getAdContractCancelRequestList() {
		 	System.out.println("광고 취소 요청 리스트 출력 메서드 실행");
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adcontract.service.AdContractMapper.selectAdContractListCancelRequest");		 
	 }
	 /*광고주 ID에 해당하는 광고 취소 요청 리스트 출력 메서드*/
	 public List<AdContractDto> getAdContractCancelRequestList(String SID) {
		 	System.out.println("광고 취소 요청 리스트 출력 메서드 실행");
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adcontract.service.AdContractMapper.selectAdContractListCancelRequestByUser", SID);		 
	 }
	 /*모든 ID에 해당하는 광고 등록 대기 리스트 출력 메서드*/
	 public List<AdContractDto> getAdContractAdBoardInsertWaitList() {
		 	System.out.println("광고 등록 대기 리스트 출력 메서드 실행");
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adcontract.service.AdContractMapper.selectAdContractListAdBoardInsertWait");		 
	 }
	 /*광고주 ID에 해당하는 광고 등록 대기 리스트 출력 메서드*/
	 public List<AdContractDto> getAdContractAdBoardInsertWaitListByUser(String SID) {
		 	System.out.println("현재 진행중인 승인 대기 리스트 출력 메서드 실행");
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adcontract.service.AdContractMapper.selectAdContractListAdBoardInsertWaitByUser", SID);		 
	 }
	 /*모든 ID에 해당하는 광고 승인 대기 리스트 출력 메서드*/
	 public List<AdContractDto> getAdContractApproveWaitList() {
		 	System.out.println("현재 진행중인 승인 대기 리스트 출력 메서드 실행");
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adcontract.service.AdContractMapper.selectAdContractListAdWait");		 
	 }
	 /*광고주 ID에 해당하는 광고 승인 대기 리스트 출력 메서드*/
	 public List<AdContractDto> getAdContractApproveWaitListByUser(String SID) {
		 	System.out.println("현재 진행중인 승인 대기 리스트 출력 메서드 실행");
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adcontract.service.AdContractMapper.selectAdContractListAdWaitByUser", SID);		 
	 }
	 /*모든 ID에 해당하는 광고 예정 리스트 출력 메서드*/
	 public List<AdContractDto> getAdContractSoonList() {
		 	System.out.println("현재 진행중인 광고 계약 리스트 출력 메서드 실행");
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adcontract.service.AdContractMapper.selectAdContractListSoon");		 
	 }
	 /*광고주 ID에 해당하는 광고 예정 리스트 출력 메서드*/
	 public List<AdContractDto> getAdContractSoonList(String SID) {
		 	System.out.println("광고주 ID에 해당하는 광고 예정 리스트 출력 메서드 실행");
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adcontract.service.AdContractMapper.selectAdContractListSoonByUser", SID);		 
	 }
	 /*DB에있는 계약번호중 가장 높은 숫자를 불러오는 메서드*/
	 public String getContractNo(){
		 return sqlSessionTemplate.selectOne("com.ksmart.harulook.adcontract.service.AdContractMapper.getContractNo");
	 }
	 /*광고 종류를 선택했을때 가격을 불러오는 메서드*/
	 public String getPrice(String adtype){
		 System.out.println("품목별 광고금액 요청 in Dao");
		 System.out.println(adtype);
		 return sqlSessionTemplate.selectOne("com.ksmart.harulook.adcontract.service.AdContractMapper.getPrice", adtype);
		 
	 }
	 /*광고 계약 기간을 선택했을때 할인율을 불러오는 메서드*/
	 public String getDc(String dc){
		 System.out.println("기간별 할인율 요청 in Dao");
		 System.out.println(dc);
		 return sqlSessionTemplate.selectOne("com.ksmart.harulook.adcontract.service.AdContractMapper.getDc", dc);
		 
	 }
	 /*광고 취소 요청 메서드 인데 수정필요*/
	public int modifyContractStat(String adcontractno) {
		 System.out.println("광고 계약 상태 수정요청 in Dao");
		 System.out.println(adcontractno);
		 System.out.println("환불 예정내역 등록완료");
		return sqlSessionTemplate.update("com.ksmart.harulook.adcontract.service.AdContractMapper.modifyContract", adcontractno);
	}
	/*관리자가 광고 취소 요청 승인시 환불 테이블에 환불 예정 내역 입력*/
	public int insertRefund(AdRefundDto refund) {
		 System.out.println("광고 계약 상태 수정요청 in Dao");
		 System.out.println(refund);
		 System.out.println("환불 예정내역 등록완료");
		return sqlSessionTemplate.update("com.ksmart.harulook.adcontract.service.AdContractMapper.modifyContract", refund);
	}
	/*광고 계약 승인 메서드*/
	public int approveContractStat(String adcontractno) {
		System.out.println("광고 계약 승인 요청 in Dao");
		 System.out.println(adcontractno);
		return sqlSessionTemplate.update("com.ksmart.harulook.adcontract.service.AdContractMapper.approveContract", adcontractno);
	}
	/*광고 계약 취소 승인 메서드*/
	public int approveCancel(String adcontractno) {
		System.out.println("광고 계약 취소 승인 요청 in Dao");
		 System.out.println(adcontractno);
		return sqlSessionTemplate.update("com.ksmart.harulook.adcontract.service.AdContractMapper.approveCancel", adcontractno);
	}
	/*광고 승인 이후 광고 기간이 기다리기전 광고대기 상태로 변경하는 메서드*/
	public int adWait(String adcontractno) {
		System.out.println("광고 대기 요청 in Dao");
		 System.out.println(adcontractno);
		return sqlSessionTemplate.update("com.ksmart.harulook.adcontract.service.AdContractMapper.adWait", adcontractno);	
	}

	public List<AdBoardDto> selectContractDetail(String adContractNo) {
		System.out.println("광고 상세 보기 내용 요청 in Dao");
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adboard.service.AdBoardMapper.selectAdBoard", adContractNo);
	}
	
}
