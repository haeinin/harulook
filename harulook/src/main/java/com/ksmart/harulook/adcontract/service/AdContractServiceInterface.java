package com.ksmart.harulook.adcontract.service;

import java.util.List;

import com.ksmart.harulook.adboard.service.AdBoardDto;
import com.ksmart.harulook.adrefund.service.AdRefundDto;

public interface AdContractServiceInterface {

	/*불량 광고 계약 취소 메서드*/
	int modifyBadAdContract(String adContractNo);

	/*광고 게약 수정 메서드*/
	int modifyAdContract(AdContractDto adcontract);

	/*광고 계약번호에 해당하는 광고 계약 내용 출력 메서드*/
	AdContractDto getAdContractByContractNo(String contractno);

	/*광고가 종료된 계약 상태변화 메서드*/
	int modifyEndContract(String adContractNo);

	/*광고가 시작된 계약 상태변화 메서드*/
	int modifyIngContract(String adContractNo);

	/*광고상태 변경메서드(광고중->계약만료 으로 바꿔야할 계약번호 조회)*/
	List<AdContractDto> getmodifyEndContract();
	
	/*광고상태 변경메서드(광고대기 -> 광고중으로 바꿔야 할 계약번호 조회)*/
	List<AdContractDto> getmodifyIngContract();

	int addAdContract(AdContractDto adcontract);

	/*현재진행중인 광고 계약 출력 메서드*/
	AdContractDto getAdContractListCurrentPlace1();

	AdContractDto getAdContractListCurrentPlace2();

	AdContractDto getAdContractListCurrentPlace3();

	/*모든 ID에 해당하는 광고 취소 요청 리스트 출력 메서드*/
	List<AdContractDto> getAdContractCancelRequestList();

	/*광고주 ID에 해당하는 광고 취소 요청 리스트 출력 메서드*/
	List<AdContractDto> getAdContractCancelRequestList(String SID);

	/*모든 ID에 해당하는 광고 등록 대기 리스트 출력 메서드*/
	List<AdContractDto> getAdBoardAdContractStataddWaitList();

	/*광고주 ID에 해당하는 광고 등록 대기 리스트 출력 메서드*/
	List<AdContractDto> getAdBoardAdContractStataddWaitListByUser(String SID);

	/*모든 ID에 해당하는 광고 승인 대기 리스트 출력 메서드*/
	List<AdContractDto> getAdContractApproveWaitList();

	/*광고주 ID에 해당하는 광고 승인 대기 리스트 출력 메서드*/
	List<AdContractDto> getAdContractApproveWaitListByUser(String SID);

	/*모든 ID에 해당하는 광고 예정 리스트 출력 메서드*/
	List<AdContractDto> getAdContractSoonList();

	/*광고주 ID에 해당하는 광고 예정 리스트 출력 메서드*/
	List<AdContractDto> getAdContractSoonList(String SID);

	/*DB에있는 계약번호중 가장 높은 숫자를 불러오는 메서드*/
	String getContractNo();

	/*광고 종류를 선택했을때 가격을 불러오는 메서드*/
	String getPrice(String adtype);

	/*광고 계약 기간을 선택했을때 할인율을 불러오는 메서드*/
	String getDc(String dc);

	/*광고 취소 요청 메서드 인데 수정필요*/
	int modifyContractStat(String adcontractno);

	/*관리자가 광고 취소 요청 승인시 환불 테이블에 환불 예정 내역 입력*/
	int addRefund(AdRefundDto refund);

	/*광고 계약 승인 메서드*/
	int modifyContractStatApprove(String adcontractno);

	/*광고 계약 취소 승인 메서드*/
	int modifyContractStatApproveCancel(String adcontractno);

	/*광고 승인 이후 광고 기간이 기다리기전 광고대기 상태로 변경하는 메서드*/
	int modifyContractStatAdWait(String adcontractno);

	/*게약 목록 화면에서 광고 계약중인 게시물 상세보기 메서드*/
	List<AdBoardDto> getContractDetail(String adContractNo);

}