package com.ksmart.harulook.adgoods.service;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class AdGoodsDao implements AdGoodsInterface {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	/*광고상품 조회 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adgoods.service.AdGoodsInterface#selectAdGoods(java.lang.String)
	 */
	public AdGoodsDto selectAdGoods(String adgoodsNo){
		log.debug("광고 상품 조회  메서드 in Dao");
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.adgoods.service.AdgoodsMapper.selectAdGoods", adgoodsNo);
	}
	/*광고 상품 수정 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adgoods.service.AdGoodsInterface#updateAdGoods(com.ksmart.harulook.adgoods.service.AdGoodsDto)
	 */
	public int updateAdGoods(AdGoodsDto adgoods){
		return sqlSessionTemplate.update("com.ksmart.harulook.adgoods.service.AdgoodsMapper.updateAdGoods", adgoods);
	}
	/*광고 상품 입력 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adgoods.service.AdGoodsInterface#insertAdGoods(com.ksmart.harulook.adgoods.service.AdGoodsDto)
	 */
	public int insertAdGoods(AdGoodsDto adGoods){
		log.debug("DAO에서 입력되는 adGoods : " + adGoods.toString());
		return sqlSessionTemplate.insert("com.ksmart.harulook.adgoods.service.AdgoodsMapper.insertGoods", adGoods);
	}
	/*광고 상품 삭제 메서드*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.adgoods.service.AdGoodsInterface#deleteAdGoods(java.lang.String)
	 */
	public int deleteAdGoods(String adGoodsNo){
		log.debug("광고 상품 삭제 요청 in Dao");
		return sqlSessionTemplate.delete("com.ksmart.harulook.adgoods.service.AdgoodsMapper.deleteAdGoods", adGoodsNo);
	}
}
