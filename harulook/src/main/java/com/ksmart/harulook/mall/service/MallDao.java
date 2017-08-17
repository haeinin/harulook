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
	
	/*상품 구입 처리*/
	public int insertMallSale(MallSaleDto dto){
		return sqlSessionTemplate.insert("com.ksmart.harulook.mall.service.MallMapper.mallSaleOneInsert",dto);
	}
	
}