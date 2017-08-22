package com.ksmart.harulook.mall.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MallDao{
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	/*쇼핑몰 상품 상세보기*/
	public MallDto getMallPro(String mallProNo) {
        return sqlSessionTemplate.selectOne("com.ksmart.harulook.mall.service.MallMapper.mallProDetail", mallProNo);
    }
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
	/*쇼핑몰 방문자 번호 가져오기*/
	public String getLastMallVisitor(){
		String lastMallVisitor = "";
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.mall.service.MallMapper.getLastMallVisitor",lastMallVisitor);
	}
	/*쇼핑몰 방문자 입력 처리*/
	 public int insertMallVisitor(MallVisitorDto dto) {
	        return sqlSessionTemplate.insert("com.ksmart.harulook.mall.service.MallMapper.insertMallVitor", dto);
	    }
}
