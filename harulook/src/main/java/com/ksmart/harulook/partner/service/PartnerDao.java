package com.ksmart.harulook.partner.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ksmart.harulook.member.service.MemberDto;

@Repository
public class PartnerDao {

	 @Autowired
	 private SqlSessionTemplate sqlSessionTemplate;
	 
	 /*제휴계약 신청처리*/
	 public int insertCooContract(PartnerDto dto) {
	        return sqlSessionTemplate.insert("com.ksmart.harulook.partner.service.PartnerMapper.cooContractInsert", dto);
	    }
	 /*제휴계약번호 번호 가져오기*/
	 public String getLastCooContractNo(){
		 String LastCooContractNo="";
		 return sqlSessionTemplate.selectOne("com.ksmart.harulook.partner.service.PartnerMapper.getLastCooContractNo",LastCooContractNo);
	 }
	 /*제휴계약 상세보기*/
	 public PartnerDto getCooContractDetail(String cooContractNo){
			return sqlSessionTemplate.selectOne("com.ksmart.harulook.partner.service.PartnerMapper.cooContractDetail",cooContractNo);
		}
	 /*제휴계약 전체목록보기(관리자)*/
	 public List<PartnerDto> getCooContractList(){
			return sqlSessionTemplate.selectList("com.ksmart.harulook.partner.service.PartnerMapper.cooContractAllList");
		}
	 /*제휴계약 목록보기(개인)*/
	 public List<PartnerDto> getCooContractList(String id){
			return sqlSessionTemplate.selectList("com.ksmart.harulook.partner.service.PartnerMapper.cooContractList",id);
		}
	 /*제휴계약 수정처리*/
	 public int updateCooContract(PartnerDto dto){
			return sqlSessionTemplate.update("com.ksmart.harulook.partner.service.PartnerMapper.cooContractUpdate", dto);
		}
	 /*제휴결제예정금액 보기*/
	 public List<PartnerBillDto> getCooContractBill(String cooContractNo){
			return sqlSessionTemplate.selectList("com.ksmart.harulook.partner.service.PartnerMapper.cooContractBill", cooContractNo);
		}
	 /*제휴결제 처리*/
	 public int insertCooContractPay(PartnerBillDto dto){
		 return sqlSessionTemplate.insert("com.ksmart.harulook.partner.service.PartnerMapper.cooContractPayinsert", dto);
	 }
	 /*제휴결제상태 변경처리*/
	 public int updateCooContractPayStat(PartnerBillDto dto){
		 return sqlSessionTemplate.update("com.ksmart.harulook.partner.service.PartnerMapper.cooContractPayStatUpdate", dto);
	 }
	 /*제휴결제처리 후 제휴예정데이터 삭제*/
	 public int deleteCooContractBill(PartnerBillDto dto){
		 return sqlSessionTemplate.delete("com.ksmart.harulook.partner.service.PartnerMapper.cooContractBillDelete", dto);
	 }
	 /*제휴결제내역 보기*/
	 public List<PartnerPayDto> getCooContractPayList(String cooContractNo){
		 return sqlSessionTemplate.selectList("com.ksmart.harulook.partner.service.PartnerMapper.cooContractPayList", cooContractNo);
	 }
	 /*제휴계약 승인처리*/
	 public int updateCooContractAdmit(PartnerDto dto){
		 return sqlSessionTemplate.update("com.ksmart.harulook.partner.service.PartnerMapper.cooContractAdmit", dto);
	 }
	 /*제휴결제 폼 요청*/
	 public PartnerBillDto cooContractPayForm(String cooContractNo){
		 return sqlSessionTemplate.selectOne("com.ksmart.harulook.partner.service.PartnerMapper.cooContractPayForm", cooContractNo);
	 }
	 /*제휴계약업체 상세보기*/
	 public MemberDto getCooContractCompany(String userId){
		 return sqlSessionTemplate.selectOne("com.ksmart.harulook.partner.service.PartnerMapper.cooContractCompany", userId);
	 }
	 /*제휴계약 수수료 입력처리*/
	 public int cooContractBillInsert(String cooBillNo,String cooContractNo){
		 Map<String,String> map = new HashMap<String,String>();
		 map.put("cooBillNo", cooBillNo);
		 map.put("cooContractNo", cooContractNo);
		 return sqlSessionTemplate.insert("com.ksmart.harulook.partner.service.PartnerMapper.cooContractBillInsert", map);
	 }
	 /*제휴계약이름 전체불러오기*/
	 public List<String> getCooContractNo(){
		 return sqlSessionTemplate.selectList("com.ksmart.harulook.partner.service.PartnerMapper.getCooContractNo");
	 }
	 /*제휴계약예정 번호 가져오기*/
	 public String getLastCooBillNo(){
		 String LastCooBillNo="";
		 return sqlSessionTemplate.selectOne("com.ksmart.harulook.partner.service.PartnerMapper.getLastCooBillNo",LastCooBillNo);
	 }
	 /*제휴업체 일별 방문자 수 가져오기*/
	 public List<PartnerStatsDto> getDailyVisitor(HashMap<String,String> map){
		 return sqlSessionTemplate.selectList("com.ksmart.harulook.partner.service.PartnerMapper.getDailyVisitor",map);
	 }
	 /*제휴업체 월별 방문자 수 가져오기*/
	 public List<PartnerStatsDto> getMonthlyVisitor(String cooContractNo){
		 return sqlSessionTemplate.selectList("com.ksmart.harulook.partner.service.PartnerMapper.getMonthlyVisitor",cooContractNo);
	 }
	 /*제휴업체 월별 유입방문자 수 가져오기*/
	 public List<PartnerStatsDto> getMonthlyInflux(String cooContractNo){
		 return sqlSessionTemplate.selectList("com.ksmart.harulook.partner.service.PartnerMapper.getMonthlyInflux",cooContractNo);
	 }
	 /*제휴업체 주별 방문자 수 가져오기*/
	 public List<PartnerStatsDto> getWeeklyVisitor(String cooContractNo){
		 return sqlSessionTemplate.selectList("com.ksmart.harulook.partner.service.PartnerMapper.getWeeklyVisitor",cooContractNo);
	 }
	 /*제휴업체 주별 유입 방문자 수 가져오기*/
	 public List<PartnerStatsDto> getWeeklyInflux(String cooContractNo){
		 return sqlSessionTemplate.selectList("com.ksmart.harulook.partner.service.PartnerMapper.getWeeklyInflux",cooContractNo);
	 }
	 /*제휴업체 쿠폰 번호 중복체크*/
	 public int duplicateCode(String cooContractCode){
		 return sqlSessionTemplate.selectOne("com.ksmart.harulook.partner.service.PartnerMapper.duplicateCode",cooContractCode);
	 }
	 /*상품별 구매량 가져오기*/
	 public HashMap<String,Integer> getCountBuy(String mallProNo){
		 return sqlSessionTemplate.selectOne("com.ksmart.harulook.partner.service.PartnerMapper.getBuyStats",mallProNo);
	 }
	 /*전체 상품번호 가져오기*/
	 public List<String> getMallProNo(){
		 return sqlSessionTemplate.selectList("com.ksmart.harulook.partner.service.PartnerMapper.getMallProNo");
	 }

}
