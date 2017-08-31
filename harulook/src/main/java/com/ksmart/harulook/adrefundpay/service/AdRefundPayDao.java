package com.ksmart.harulook.adrefundpay.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class AdRefundPayDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int insertRefundPay(AdRefundPayDto adrefundpay) {
		System.out.println("환불 결제 내용 입력 요청 in Dao");
		System.out.println(adrefundpay);
		return sqlSessionTemplate.insert("com.ksmart.harulook.adrefundpay.service.AdRefundPayMapper.insertRefundPay", adrefundpay);
		}
	
	public String getRefundPayNo(){
		System.out.println("환불 결제 번호 요청 in Dao");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adrefundpay.service.AdRefundPayMapper.getRefundPayNo");
	}
}
