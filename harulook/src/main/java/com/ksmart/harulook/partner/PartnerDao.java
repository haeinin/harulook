package com.ksmart.harulook.partner;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ksmart.harulook.dto.PartnerDto;

@Repository
public class PartnerDao {

	 @Autowired
	 private SqlSessionTemplate sqlSessionTemplate;
	
	 /*제휴계약신청처리 메서드*/
	 public int insertCooContract(PartnerDto dto) {
	        return sqlSessionTemplate.insert("com.ksmart.harulook.partner.PartnerMapper.cooContractInsert", dto);
	    }
	 /*제휴계약목록조회*/
	 public List<PartnerDto> getCooContractList(){
			return sqlSessionTemplate.selectList("com.ksmart.harulook.partner.PartnerMapper.cooContractList");
		}
}
