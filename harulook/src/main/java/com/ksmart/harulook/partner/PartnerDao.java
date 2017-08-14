package com.ksmart.harulook.partner;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ksmart.harulook.dto.PartnerBillDto;
import com.ksmart.harulook.dto.PartnerDto;

@Repository
public class PartnerDao {

	 @Autowired
	 private SqlSessionTemplate sqlSessionTemplate;
	
	 /*제휴계약신청처리*/
	 public int insertCooContract(PartnerDto dto) {
	        return sqlSessionTemplate.insert("com.ksmart.harulook.partner.PartnerMapper.cooContractInsert", dto);
	    }
	 /*제휴계약상세보기*/
	 public PartnerDto getCooContractDetail(String cooContractNo){
			return sqlSessionTemplate.selectOne("com.ksmart.harulook.partner.PartnerMapper.cooContractDetail",cooContractNo);
		}
	 /*제휴계약목록조회*/
	 public List<PartnerDto> getCooContractList(){
			return sqlSessionTemplate.selectList("com.ksmart.harulook.partner.PartnerMapper.cooContractList");
		}
	 /*제휴계약 수정처리*/
	 public int updateCooContract(PartnerDto dto){
			return sqlSessionTemplate.update("com.ksmart.harulook.partner.PartnerMapper.cooContractUpdate", dto);
		}
	 public List<PartnerBillDto> getCooContractBill(String cooContractNo){
			return sqlSessionTemplate.selectList("com.ksmart.harulook.partner.PartnerMapper.cooContractBill", cooContractNo);
		}

}
