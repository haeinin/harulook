package com.ksmart.harulook.adpay.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ksmart.harulook.adpay.service.AdPayDto;
@Repository
public class AdPayDao implements AdPayInterface {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	 /*제일 높은 결제 번호 조회 메서드*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.adpay.service.AdPayInterface#selectPayNo()
	 */
	public String selectPayNo(){
		 return sqlSessionTemplate.selectOne("com.ksmart.harulook.adcontract.service.AdContractMapper.getPayNo");
	 }
	 /*결제 입력 메서드*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.adpay.service.AdPayInterface#insertAdPay(com.ksmart.harulook.adpay.service.AdPayDto)
	 */
	public int insertAdPay(AdPayDto adpay) {
		 System.out.println("in DAO");	
		 System.out.println(adpay);
        return sqlSessionTemplate.insert("com.ksmart.harulook.adcontract.service.AdContractMapper.insertAdPay", adpay);	    
        }
	
}
