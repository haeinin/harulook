package com.ksmart.harulook.mall;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ksmart.harulook.dto.MallDto;
import com.ksmart.harulook.dto.MallSaleDto;

@Repository
public class MallDao{
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	
	public MallDto getMallPro(String mallProNo) {
        return sqlSessionTemplate.selectOne("com.ksmart.harulook.mall.MallMapper.mallProDetail", mallProNo);
    }
	/*쇼핑몰 상품 목록*/
	public List<MallDto> getMallProList(){
		return sqlSessionTemplate.selectList("com.ksmart.harulook.mall.MallMapper.mallProList");
	}
	
	/*삭제할것들*/
	/*public int countMallVistor(){
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.mall.MallMapper.mallVisitorId");
	}
	public int insertMallVisitor(String mallVistorNo){
		System.out.println("mallVisitId="+mallVistorNo);
		return sqlSessionTemplate.insert("com.ksmart.harulook.mall.MallMapper.mallVisit",mallVistorNo);
	}*/
	
	/*상품 구입 처리*/
	public int insertMallSale(MallSaleDto dto){
		return sqlSessionTemplate.insert("com.ksmart.harulook.mall.MallMapper.mallSaleOneInsert",dto);
	}
	
}
