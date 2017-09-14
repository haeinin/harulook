package com.ksmart.harulook.partner.service;

import java.util.HashMap;
import java.util.List;

import com.ksmart.harulook.member.service.MemberDto;

public interface PartnerInterface {

	/*제휴계약 신청처리*/
	int insertCooContract(PartnerDto dto);

	/*제휴계약번호 번호 가져오기*/
	String selectLastCooContractNo();

	/*제휴계약 상세보기*/
	PartnerDto selectCooContractDetail(String cooContractNo);

	/*제휴계약 전체목록보기(관리자)*/
	List<PartnerDto> selectCooContractList();

	/*제휴계약 목록보기(개인)*/
	List<PartnerDto> selectCooContractList(String id);

	/*제휴계약 수정처리*/
	int updateCooContract(PartnerDto dto);

	/*제휴결제예정금액 보기*/
	List<PartnerBillDto> selectCooContractBill(String cooContractNo);

	/*제휴결제 처리*/
	int insertCooContractPay(PartnerBillDto dto);

	/*제휴결제상태 변경처리*/
	int updateCooContractPayStat(PartnerBillDto dto);

	/*제휴정지해제*/
	int updateCooContractRelieve(PartnerBillDto dto);

	/*제휴결제처리 후 제휴예정데이터 삭제*/
	int deleteCooContractBill(PartnerBillDto dto);

	/*제휴결제내역 보기*/
	List<PartnerPayDto> selectCooContractPayList(String cooContractNo);

	/*제휴계약 승인처리*/
	int updateCooContractAdmit(PartnerDto dto);

	/*제휴결제 폼 요청*/
	PartnerBillDto selectCooContractPayForm(String cooBillNo);

	/*제휴계약업체 상세보기*/
	MemberDto selectCooContractCompany(String userId);

	/*제휴계약 수수료 입력처리*/
	int insertCooContractBill(String cooBillNo, String cooContractNo);

	/*제휴종료시 수수료 입력처리*/
	int insertEndBill(String cooBillNo, String cooContractNo);

	/*제휴계약이름 전체불러오기*/
	List<String> selectCooContractNo();

	/*제휴계약예정 번호 가져오기*/
	String selectLastCooBillNo();

	/*제휴업체 일별 방문자 수 가져오기*/
	List<PartnerStatsDto> selectDailyVisitor(HashMap<String, String> map);

	/*제휴업체 월별 방문자 수 가져오기*/
	List<PartnerStatsDto> selectMonthlyVisitor(String cooContractNo);

	/*제휴업체 월별 유입방문자 수 가져오기*/
	List<PartnerStatsDto> selectMonthlyInflux(String cooContractNo);

	/*제휴업체 주별 방문자 수 가져오기*/
	List<PartnerStatsDto> selectWeeklyVisitor(String cooContractNo);

	/*제휴업체 주별 유입 방문자 수 가져오기*/
	List<PartnerStatsDto> selectWeeklyInflux(String cooContractNo);

	/*제휴업체 쿠폰 번호 중복체크*/
	int selectDuplicateCode(String cooContractCode);

	/*상품별 구매량 가져오기*/
	HashMap<String, Integer> selectBuyCount(String mallProNo);

	/*전체 상품번호 가져오기*/
	List<String> selectMallProNo();

	/*제휴승인된 배너 이미지 불러오기*/
	List<HashMap<String, String>> selectBanner();

	/*기간만료된 제휴계약 조회*/
	List<String> selectEndCooContractList();

	/*기간만료된 제휴계약 상태변경*/
	int updateEndCooContract(String cooContractNo);

	/*제휴 시작할 계약 조회*/
	List<String> selectStartCooContract();

	/* 제휴진행 상태로 변경*/
	int updateStartCooContract(String cooContractNo);

	/*납부기한 지난 제휴계약 조회*/
	List<String> selectOverDueList();

	/*납부기한 지난 제휴정지*/
	int updateOverDue(String cooContractNo);

}