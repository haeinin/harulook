package com.ksmart.harulook.mall.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MallDao{
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	
	public MallDto getMallPro(String mallProNo) {
        return sqlSessionTemplate.selectOne("com.ksmart.harulook.mall.service.MallMapper.mallProDetail", mallProNo);
    }
	/*쇼핑몰 상품 목록*/
	public List<MallDto> getMallProList(){
		return sqlSessionTemplate.selectList("com.ksmart.harulook.mall.service.MallMapper.mallProList");
	}
	
	/*삭제할것들*/
	/*public int countMallVistor(){
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.mall.service.MallMapper.mallVisitorId");
	}
	public int insertMallVisitor(String mallVistorNo){
		System.out.println("mallVisitId="+mallVistorNo);
		return sqlSessionTemplate.insert("com.ksmart.harulook.mall.service.MallMapper.mallVisit",mallVistorNo);
	}*/
	
	/*회원 상품 구입 처리*/
	public int insertMallSale(MallSaleDto dto){
		return sqlSessionTemplate.insert("com.ksmart.harulook.mall.service.MallMapper.mallSaleUserInsert",dto);
	}
	/*비회원 상품 구입 처리*/
	public int insertMallSaleNon(MallSaleDto dto){
		return sqlSessionTemplate.insert("com.ksmart.harulook.mall.service.MallMapper.mallSaleNonInsert",dto);
	}
	/*할인코드 확인*/
	public String getCooContractCode(String cooContractCode){
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.mall.service.MallMapper.vaildCooContractCode",cooContractCode);
	}
	/*방금 구매한 정보 보기*/
	public MallSaleDto getMallBuyNow(){
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.mall.service.MallMapper.getMallBuyNow");
	}
	/*내 구매내역 전체보기*/
	public List<MallSaleDto> getMallBuyList(String id){
		return sqlSessionTemplate.selectList("com.ksmart.harulook.mall.service.MallMapper.getMallBuyList",id);
	}
}
