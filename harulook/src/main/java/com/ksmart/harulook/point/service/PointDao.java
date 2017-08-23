package com.ksmart.harulook.point.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PointDao {
	 @Autowired
	    private SqlSessionTemplate sqlSessionTemplate;
	 
	/*포인트 정책 리스트*/
    public List<PointDto> pointPolicy() {
    	return sqlSessionTemplate.selectList("com.ksmart.harulook.point.service.PointMapper.pointPolicy");
    }
    
    /*포인트 사용 리스트*/
    public List<PointDto> pointUsePolicy() {
    	return sqlSessionTemplate.selectList("com.ksmart.harulook.point.service.PointMapper.pointUsePolicy");
    }
}
