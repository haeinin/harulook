package com.ksmart.harulook.adrefund.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ksmart.harulook.adrefundpay.service.AdRefundPayDto;

@Repository
public class AdRefundDao implements AdRefundInterface{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/*광고 환불 입력 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adrefund.service.AdRefundInterface#insertAdRefund(com.ksmart.harulook.adrefund.service.AdRefundDto)
	 */
	public int insertAdRefund(AdRefundDto adrefund) {
		System.out.println("광고 계약 환불 내역 입력 요청 in Dao");
		System.out.println(adrefund);
		return sqlSessionTemplate.insert("com.ksmart.harulook.adrefund.service.AdRefundMapper.insertRefund", adrefund);
		}
	/*광고 환불 번호에서 제일 높은 번호 요청 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adrefund.service.AdRefundInterface#selectAdRefundNo()
	 */
	public String selectAdRefundNo(){
		System.out.println("refundNo중에서 제일 높은값 출력 in Dao");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adrefund.service.AdRefundMapper.getRefundNo");
	}
	/*광고 환불 리스트 요청 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adrefund.service.AdRefundInterface#selectAdRefundList()
	 */
	public List<AdRefundDto> selectAdRefundList(){
		System.out.println("환불 목록 요청");
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adrefund.service.AdRefundMapper.selectRefundList");
	}
	/*아이디에 해당하는 광고 환불 리스트 요청 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adrefund.service.AdRefundInterface#selectAdRefundList(java.lang.String)
	 */
	public List<AdRefundDto> selectAdRefundList(String SID){
		System.out.println("환불 목록 요청 SID : " + SID);
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adrefund.service.AdRefundMapper.selectRefundListAdUser" , SID);
	}
	/*광고 수정 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adrefund.service.AdRefundInterface#updateAdRefund(java.lang.String)
	 */
	public int updateAdRefund(String refundNo){
		System.out.println("환불 상태변경 =>환불정보입력완료");
		return sqlSessionTemplate.update("com.ksmart.harulook.adrefund.service.AdRefundMapper.updateRefund", refundNo);
	}
	/*광고 상태(=>환불완료) 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adrefund.service.AdRefundInterface#updateAdContractStatApproveRefund(java.lang.String)
	 */
	public int updateAdContractStatApproveRefund(String refundNo){
		System.out.println("환불 상태변경 =>환불완료");
		return sqlSessionTemplate.update("com.ksmart.harulook.adrefund.service.AdRefundMapper.approveRefund", refundNo);
	}

}
