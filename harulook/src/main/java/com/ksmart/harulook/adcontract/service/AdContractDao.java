package com.ksmart.harulook.adcontract.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ksmart.harulook.adboard.service.AdBoardDto;
import com.ksmart.harulook.adcontract.service.AdContractDto;
import com.ksmart.harulook.adrefund.service.AdRefundDto;
@Repository
public class AdContractDao implements AdContractInterface{
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	/*불량 광고 계약 취소 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adcontract.service.AdContractServiceInterface#updateBadAdContract(java.lang.String)
	 */
	public int updateBadAdContract(String adContractNo){
		log.debug("불량 광고 계약 취소 메서드 실행 in Dao");
		log.debug("계약 번호 : " + adContractNo);
		return sqlSessionTemplate.update("com.ksmart.harulook.adcontract.service.AdContractMapper.updateBadAdContract", adContractNo);
	}
	
	/*광고 게약 수정 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adcontract.service.AdContractServiceInterface#updateAdContract(com.ksmart.harulook.adcontract.service.AdContractDto)
	 */
	public int updateAdContract(AdContractDto adcontract){
		log.debug("광고 계약 수정 메서드 실행");
		log.debug(adcontract);
		return sqlSessionTemplate.update("com.ksmart.harulook.adcontract.service.AdContractMapper.updateAdContract", adcontract);
	}
	
	/*광고 계약번호에 해당하는 광고 계약 내용 출력 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adcontract.service.AdContractServiceInterface#selectAdContractByContractNo(java.lang.String)
	 */
	public AdContractDto selectAdContractByContractNo(String contractno){
		log.debug("계약 번호에 해당하는 계약 내용 출력 메서드 실행");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adcontract.service.AdContractMapper.SelectAdContractByContractNo", contractno);
	}
	
	/*광고가 종료된 계약 상태변화 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adcontract.service.AdContractServiceInterface#updateEndContract(java.lang.String)
	 */
	public int updateEndContract(String adContractNo){
		System.out.print("광고상태 변경(광고진행중 -> 계약만료)메서드 실행");
		return sqlSessionTemplate.update("com.ksmart.harulook.adcontract.service.AdContractMapper.UpdateEndContract", adContractNo);
	}
	
	/*광고가 시작된 계약 상태변화 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adcontract.service.AdContractServiceInterface#updateIngContract(java.lang.String)
	 */
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adcontract.service.AdContractInterface#updateIngContract(java.lang.String)
	 */
	public int updateIngContract(String adContractNo){
		System.out.print("광고상태 변경(광고대기 -> 광고진행중)메서드 실행");
		return sqlSessionTemplate.update("com.ksmart.harulook.adcontract.service.AdContractMapper.UpdateIngContract", adContractNo);
	}
	/*광고상태 변경메서드(광고중->계약만료 으로 바꿔야할 계약번호 조회)*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adcontract.service.AdContractServiceInterface#selectUpdateEndContract()
	 */
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adcontract.service.AdContractInterface#selectUpdateEndContract()
	 */
	public List<AdContractDto> selectUpdateEndContract(){
		log.debug("(진행중->계약만료) 갱신될 계약번호 조회 메서드 실행");
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adcontract.service.AdContractMapper.selectUpdateEndContract");
	}
	/*광고상태 변경메서드(광고대기 -> 광고중으로 바꿔야 할 계약번호 조회)*/
	
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adcontract.service.AdContractServiceInterface#selectUpdateIngContract()
	 */
	public List<AdContractDto> selectUpdateIngContract(){
		log.debug("(광고대기->진행중) 갱신될 계약번호 조회 메서드 실행");
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adcontract.service.AdContractMapper.selectUpdateIngContract");
	}
	
	/*광고 계약 등록 메서드*/
	 
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adcontract.service.AdContractServiceInterface#insertAdContract(com.ksmart.harulook.adcontract.service.AdContractDto)
	 */
	public int insertAdContract(AdContractDto adcontract) {
		 log.debug("in DAO");	
		 log.debug(adcontract);
	     return sqlSessionTemplate.insert("com.ksmart.harulook.adcontract.service.AdContractMapper.insertAdContract", adcontract);	    
	 }
	 /*현재진행중인 광고 계약 출력 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adcontract.service.AdContractServiceInterface#selectAdContractListCurrentPlace1()
	 */
	public AdContractDto selectAdContractListCurrentPlace1(){
		 log.debug("위치 1에 해당하는 계약 리스트 출력");
		 return sqlSessionTemplate.selectOne("com.ksmart.harulook.adcontract.service.AdContractMapper.selectAdContractListCurrentPlace1");
	 }
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adcontract.service.AdContractServiceInterface#selectAdContractListCurrentPlace2()
	 */
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adcontract.service.AdContractInterface#selectAdContractListCurrentPlace2()
	 */
	public AdContractDto selectAdContractListCurrentPlace2(){
		 log.debug("위치 2에 해당하는 계약 리스트 출력");
		 return sqlSessionTemplate.selectOne("com.ksmart.harulook.adcontract.service.AdContractMapper.selectAdContractListCurrentPlace2");
	 }
	
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adcontract.service.AdContractServiceInterface#selectAdContractListCurrentPlace3()
	 */
	public AdContractDto selectAdContractListCurrentPlace3(){
		 log.debug("위치 3에 해당하는 계약 리스트 출력");
		 return sqlSessionTemplate.selectOne("com.ksmart.harulook.adcontract.service.AdContractMapper.selectAdContractListCurrentPlace3");
	 }
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.adcontract.service.AdContractServiceInterface#selectAdContractCancelRequestList()
	 */
	 /*모든 ID에 해당하는 광고 취소 요청 리스트 출력 메서드*/
	public List<AdContractDto> selectAdContractCancelRequestList() {
		 	log.debug("광고 취소 요청 리스트 출력 메서드 실행");
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adcontract.service.AdContractMapper.selectAdContractListCancelRequest");		 
	 }
	 /*광고주 ID에 해당하는 광고 취소 요청 리스트 출력 메서드*/ 
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adcontract.service.AdContractServiceInterface#selectAdContractCancelRequestList(java.lang.String)
	 */
	public List<AdContractDto> selectAdContractCancelRequestList(String SID) {
		 	log.debug("광고 취소 요청 리스트 출력 메서드 실행");
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adcontract.service.AdContractMapper.selectAdContractListCancelRequestByUser", SID);		 
	 }
	 /*모든 ID에 해당하는 광고 등록 대기 리스트 출력 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adcontract.service.AdContractInterface#selectAdBoardAdContractStatInsertWaitList()
	 */
	public List<AdContractDto> selectAdBoardAdContractStatInsertWaitList() {
		 	log.debug("광고 등록 대기 리스트 출력 메서드 실행");
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adcontract.service.AdContractMapper.selectAdContractListAdBoardInsertWait");		 
	 }
	 /*광고주 ID에 해당하는 광고 등록 대기 리스트 출력 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adcontract.service.AdContractServiceInterface#selectAdBoardAdContractStatInsertWaitListByUser(java.lang.String)
	 */
	public List<AdContractDto> selectAdBoardAdContractStatInsertWaitListByUser(String SID) {
		 	log.debug("현재 진행중인 승인 대기 리스트 출력 메서드 실행");
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adcontract.service.AdContractMapper.selectAdContractListAdBoardInsertWaitByUser", SID);		 
	 }
	 /*모든 ID에 해당하는 광고 승인 대기 리스트 출력 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adcontract.service.AdContractServiceInterface#selectAdContractApproveWaitList()
	 */
	public List<AdContractDto> selectAdContractApproveWaitList() {
		 	log.debug("현재 진행중인 승인 대기 리스트 출력 메서드 실행");
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adcontract.service.AdContractMapper.selectAdContractListAdWait");		 
	 }
	 /*광고주 ID에 해당하는 광고 승인 대기 리스트 출력 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adcontract.service.AdContractServiceInterface#selectAdContractApproveWaitListByUser(java.lang.String)
	 */
	public List<AdContractDto> selectAdContractApproveWaitListByUser(String SID) {
		 	log.debug("현재 진행중인 승인 대기 리스트 출력 메서드 실행");
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adcontract.service.AdContractMapper.selectAdContractListAdWaitByUser", SID);		 
	 }
	 /*모든 ID에 해당하는 광고 예정 리스트 출력 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adcontract.service.AdContractServiceInterface#selectAdContractSoonList()
	 */
	public List<AdContractDto> selectAdContractSoonList() {
		 	log.debug("현재 진행중인 광고 계약 리스트 출력 메서드 실행");
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adcontract.service.AdContractMapper.selectAdContractListSoon");		 
	 }
	 /*광고주 ID에 해당하는 광고 예정 리스트 출력 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adcontract.service.AdContractServiceInterface#selectAdContractSoonList(java.lang.String)
	 */
	public List<AdContractDto> selectAdContractSoonList(String SID) {
		 	log.debug("광고주 ID에 해당하는 광고 예정 리스트 출력 메서드 실행");
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adcontract.service.AdContractMapper.selectAdContractListSoonByUser", SID);		 
	 }
	 /*DB에있는 계약번호중 가장 높은 숫자를 불러오는 메서드*/ 
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adcontract.service.AdContractServiceInterface#selectContractNo()
	 */
	public String selectContractNo(){
		 return sqlSessionTemplate.selectOne("com.ksmart.harulook.adcontract.service.AdContractMapper.getContractNo");
	 }
	 /*광고 종류를 선택했을때 가격을 불러오는 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adcontract.service.AdContractServiceInterface#selectPrice(java.lang.String)
	 */
	public String selectPrice(String adtype){
		 log.debug("품목별 광고금액 요청 in Dao");
		 log.debug(adtype);
		 return sqlSessionTemplate.selectOne("com.ksmart.harulook.adcontract.service.AdContractMapper.getPrice", adtype);
		 
	 }
	 /*광고 계약 기간을 선택했을때 할인율을 불러오는 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adcontract.service.AdContractServiceInterface#selectDc(java.lang.String)
	 */
	public String selectDc(String dc){
		 log.debug("기간별 할인율 요청 in Dao");
		 log.debug(dc);
		 return sqlSessionTemplate.selectOne("com.ksmart.harulook.adcontract.service.AdContractMapper.getDc", dc);
		 
	 }
	 /*광고 취소 요청 메서드 인데 수정필요*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adcontract.service.AdContractServiceInterface#updateContractStat(java.lang.String)
	 */
	public int updateContractStat(String adcontractno) {
		 log.debug("광고 계약 상태 수정요청 in Dao");
		 log.debug(adcontractno);
		 log.debug("환불 예정내역 등록완료");
		return sqlSessionTemplate.update("com.ksmart.harulook.adcontract.service.AdContractMapper.modifyContract", adcontractno);
	}
	/*관리자가 광고 취소 요청 승인시 환불 테이블에 환불 예정 내역 입력*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adcontract.service.AdContractServiceInterface#insertRefund(com.ksmart.harulook.adrefund.service.AdRefundDto)
	 */
	public int insertRefund(AdRefundDto refund) {
		 log.debug("광고 계약 상태 수정요청 in Dao");
		 log.debug(refund);
		 log.debug("환불 예정내역 등록완료");
		return sqlSessionTemplate.update("com.ksmart.harulook.adcontract.service.AdContractMapper.modifyContract", refund);
	}
	/*광고 계약 승인 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adcontract.service.AdContractServiceInterface#updateContractStatApprove(java.lang.String)
	 */
	public int updateContractStatApprove(String adcontractno) {
		log.debug("광고 계약 승인 요청 in Dao");
		 log.debug(adcontractno);
		return sqlSessionTemplate.update("com.ksmart.harulook.adcontract.service.AdContractMapper.approveContract", adcontractno);
	}
	/*광고 계약 취소 승인 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adcontract.service.AdContractServiceInterface#updateContractStatApproveCancel(java.lang.String)
	 */
	public int updateContractStatApproveCancel(String adcontractno) {
		log.debug("광고 계약 취소 승인 요청 in Dao");
		 log.debug(adcontractno);
		return sqlSessionTemplate.update("com.ksmart.harulook.adcontract.service.AdContractMapper.approveCancel", adcontractno);
	}
	/*광고 승인 이후 광고 기간이 기다리기전 광고대기 상태로 변경하는 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adcontract.service.AdContractServiceInterface#updateContractStatAdWait(java.lang.String)
	 */
	public int updateContractStatAdWait(String adcontractno) {
		log.debug("광고 대기 요청 in Dao");
		 log.debug(adcontractno);
		return sqlSessionTemplate.update("com.ksmart.harulook.adcontract.service.AdContractMapper.adWait", adcontractno);	
	}
	/*게약 목록 화면에서 광고 계약중인 게시물 상세보기 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adcontract.service.AdContractServiceInterface#selectContractDetail(java.lang.String)
	 */
	public List<AdBoardDto> selectContractDetail(String adContractNo) {
		log.debug("광고 상세 보기 내용 요청 in Dao");
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adboard.service.AdBoardMapper.selectAdBoard", adContractNo);
	}
	
}
