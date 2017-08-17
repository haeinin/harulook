package com.ksmart.harulook.partner.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PartnerDao {

	 @Autowired
	 private SqlSessionTemplate sqlSessionTemplate;
	
	 /*제휴계약 신청처리*/
	 public int insertCooContract(PartnerDto dto) {
	        return sqlSessionTemplate.insert("com.ksmart.harulook.partner.service.PartnerMapper.cooContractInsert", dto);
	    }
	 /*제휴계약번호 갯수세기*/
	 public String getLastCooContractNo(){
		 String lastCooContractNo = "";
		 return sqlSessionTemplate.selectOne("com.ksmart.harulook.partner.service.PartnerMapper.getLastCooContractNo",lastCooContractNo);
	 }
	 /*제휴계약 상세보기*/
	 public PartnerDto getCooContractDetail(String cooContractNo){
			return sqlSessionTemplate.selectOne("com.ksmart.harulook.partner.service.PartnerMapper.cooContractDetail",cooContractNo);
		}
	 /*제휴계약 목록조회*/
	 public List<PartnerDto> getCooContractList(){
			return sqlSessionTemplate.selectList("com.ksmart.harulook.partner.service.PartnerMapper.cooContractList");
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
	/* public List<PartnerPayDto> getCooContractPayList(){
		 return sqlSessionTemplate.selectList("com.ksmart.harulook.partner.service.PartnerMapper.cooContractBill", cooContractNo);
	 }*/
	 /*제휴계약 승인처리*/
	 public int updateCooContractAdmit(PartnerDto dto){
		 return sqlSessionTemplate.update("com.ksmart.harulook.partner.service.PartnerMapper.cooContractAdmit", dto);
	 }


}
