package com.ksmart.harulook.adrefund.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdRefundDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int insertRefund(AdRefundDto adrefund) {
		System.out.println("광고 계약 환불 내역 입력 요청 in Dao");
		System.out.println(adrefund);
		return sqlSessionTemplate.insert("com.ksmart.harulook.adrefund.service.AdRefundMapper.insertRefund", adrefund);
		}
	public String getRefundNo(){
		System.out.println("refundNo중에서 제일 높은값 출력 in Dao");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adrefund.service.AdRefundMapper.getRefundNo");
	}
	public List<AdRefundDto> getRefundList(){
		System.out.println("환불 목록 요청");
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adrefund.service.AdRefundMapper.selectRefundList");
	}

}
