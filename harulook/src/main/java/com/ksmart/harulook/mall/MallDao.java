package com.ksmart.harulook.mall;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ksmart.harulook.dto.MallDto;

@Repository
public class MallDao{
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	
	public MallDto getMallPro(String mallProNo) {
        return sqlSessionTemplate.selectOne("com.ksmart.harulook.mall.MallMapper.mallProDetail", mallProNo);
    }
	
	public List<MallDto> getMallProList(){
		return sqlSessionTemplate.selectList("com.ksmart.harulook.mall.MallMapper.mallProList");
	}
	
}