package com.ksmart.harulook.adrefund.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdRefundDao implements AdRefundInterface{
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/*광고 환불 입력 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adrefund.service.AdRefundInterface#insertAdRefund(com.ksmart.harulook.adrefund.service.AdRefundDto)
	 */
	public int insertAdRefund(AdRefundDto adrefund) {
		log.debug("광고 계약 환불 내역 입력 요청 in Dao");
		log.debug(adrefund);
		return sqlSessionTemplate.insert("com.ksmart.harulook.adrefund.service.AdRefundMapper.insertRefund", adrefund);
		}
	/*광고 환불 번호에서 제일 높은 번호 요청 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adrefund.service.AdRefundInterface#selectAdRefundNo()
	 */
	public String selectAdRefundNo(){
		log.debug("refundNo중에서 제일 높은값 출력 in Dao");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adrefund.service.AdRefundMapper.getRefundNo");
	}
	/*광고 환불 리스트 요청 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adrefund.service.AdRefundInterface#selectAdRefundList()
	 */
	public List<AdRefundDto> selectAdRefundList(){
		log.debug("환불 목록 요청");
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adrefund.service.AdRefundMapper.selectRefundList");
	}
	/*아이디에 해당하는 광고 환불 리스트 요청 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adrefund.service.AdRefundInterface#selectAdRefundList(java.lang.String)
	 */
	public List<AdRefundDto> selectAdRefundList(String SID){
		log.debug("환불 목록 요청 SID : " + SID);
		return sqlSessionTemplate.selectList("com.ksmart.harulook.adrefund.service.AdRefundMapper.selectRefundListAdUser" , SID);
	}
	/*광고 수정 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adrefund.service.AdRefundInterface#updateAdRefund(java.lang.String)
	 */
	public int updateAdRefund(String refundNo){
		log.debug("환불 상태변경 =>환불정보입력완료");
		return sqlSessionTemplate.update("com.ksmart.harulook.adrefund.service.AdRefundMapper.updateRefund", refundNo);
	}
	/*광고 상태(=>환불완료) 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adrefund.service.AdRefundInterface#updateAdContractStatApproveRefund(java.lang.String)
	 */
	public int updateAdContractStatApproveRefund(String refundNo){
		log.debug("환불 상태변경 =>환불완료");
		return sqlSessionTemplate.update("com.ksmart.harulook.adrefund.service.AdRefundMapper.approveRefund", refundNo);
	}

}
