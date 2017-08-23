package com.ksmart.harulook.adpay.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ksmart.harulook.adpay.service.AdPayDto;
@Repository
public class AdPayDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	 public String getPayNo(){
		 return sqlSessionTemplate.selectOne("com.ksmart.harulook.adcontract.service.AdContractMapper.getPayNo");
	 }
	 public int insertAdPay(AdPayDto adpay) {
		 System.out.println("in DAO");	
		 System.out.println(adpay);
        return sqlSessionTemplate.insert("com.ksmart.harulook.adcontract.service.AdContractMapper.insertAdPay", adpay);	    
        }
	
}
