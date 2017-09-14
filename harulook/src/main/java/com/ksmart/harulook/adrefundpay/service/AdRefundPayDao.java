package com.ksmart.harulook.adrefundpay.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class AdRefundPayDao implements AdRefundPayInterface {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	/*환불결제 입력 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adrefundpay.service.AdRefundPayInterface#insertRefundPay(com.ksmart.harulook.adrefundpay.service.AdRefundPayDto)
	 */
	public int insertRefundPay(AdRefundPayDto adrefundpay) {
		System.out.println("환불 결제 내용 입력 요청 in Dao");
		System.out.println(adrefundpay);
		return sqlSessionTemplate.insert("com.ksmart.harulook.adrefundpay.service.AdRefundPayMapper.insertRefundPay", adrefundpay);
		}
	/*환불결제번호 중 제일 높은번호 요청 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adrefundpay.service.AdRefundPayInterface#selectRefundPayNo()
	 */
	public String selectRefundPayNo(){
		System.out.println("환불 결제 번호 요청 in Dao");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adrefundpay.service.AdRefundPayMapper.getRefundPayNo");
	}
}
