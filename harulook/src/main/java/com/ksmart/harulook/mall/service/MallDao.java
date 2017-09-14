package com.ksmart.harulook.mall.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MallDao implements MallInterface{
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	/*쇼핑몰 상품 상세보기*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.mall.service.MallInterface#selectMallPro(java.lang.String)
	 */
	@Override
	public MallDto selectMallPro(String mallProNo) {
        return sqlSessionTemplate.selectOne("com.ksmart.harulook.mall.service.MallMapper.mallProDetail", mallProNo);
    }
	/*회원 상품 구입 처리*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.mall.service.MallInterface#insertMallSale(com.ksmart.harulook.mall.service.MallSaleDto)
	 */
	@Override
	public int insertMallSale(MallSaleDto dto){
		return sqlSessionTemplate.insert("com.ksmart.harulook.mall.service.MallMapper.mallSaleUserInsert",dto);
	}
	/*비회원 상품 구입 처리*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.mall.service.MallInterface#insertMallSaleNon(com.ksmart.harulook.mall.service.MallSaleDto)
	 */
	@Override
	public int insertMallSaleNon(MallSaleDto dto){
		return sqlSessionTemplate.insert("com.ksmart.harulook.mall.service.MallMapper.mallSaleNonInsert",dto);
	}
	/*할인코드 확인*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.mall.service.MallInterface#selectCooContractCode(java.lang.String)
	 */
	@Override
	public String selectCooContractCode(String cooContractCode){
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.mall.service.MallMapper.vaildCooContractCode",cooContractCode);
	}
	/*방금 구매한 정보 보기*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.mall.service.MallInterface#selectMallBuyNow()
	 */
	@Override
	public MallSaleDto selectMallBuyNow(){
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.mall.service.MallMapper.getMallBuyNow");
	}
	/*내 구매내역 전체보기*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.mall.service.MallInterface#selectMallBuyList(java.lang.String)
	 */
	@Override
	public List<MallSaleDto> selectMallBuyList(String id){
		return sqlSessionTemplate.selectList("com.ksmart.harulook.mall.service.MallMapper.getMallBuyList",id);
	}
	/*쇼핑몰 방문자 번호 가져오기*/
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.mall.service.MallInterface#selectLastMallVisitor()
	 */
	@Override
	public String selectLastMallVisitor(){
		String lastMallVisitor = "";
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.mall.service.MallMapper.getLastMallVisitor",lastMallVisitor);
	}
	/*쇼핑몰 방문자 입력 처리*/
	 /* (non-Javadoc)
	 * @see com.ksmart.harulook.mall.service.MallInterface#insertMallVisitor(com.ksmart.harulook.mall.service.MallVisitorDto)
	 */
	@Override
	public int insertMallVisitor(MallVisitorDto dto) {
	        return sqlSessionTemplate.insert("com.ksmart.harulook.mall.service.MallMapper.insertMallVitor", dto);
	    }
}
