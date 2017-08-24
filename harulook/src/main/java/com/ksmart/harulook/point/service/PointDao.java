package com.ksmart.harulook.point.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PointDao {
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	
     /*나의 포인트*/
    public int myPoint(String userId) {
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("userId", userId);
    	return sqlSessionTemplate.selectOne("com.ksmart.harulook.point.service.PointMapper.myPoint", map);
    }
	
	/*포인트 정책 리스트*/
    public List<PointDto> pointPolicy() {
    	return sqlSessionTemplate.selectList("com.ksmart.harulook.point.service.PointMapper.pointPolicy");
    }
    
    /*포인트 쿠폰 정책*/
    public List<PointDto> pointUsePolicy() {
    	return sqlSessionTemplate.selectList("com.ksmart.harulook.point.service.PointMapper.pointUsePolicy");
    }
    
    /*포인트 사용 내역*/
    public List<PointDto> pointUse(String userId) {
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("userId", userId);
		System.out.println("PointDao pointUse  아이디 =  " + map);
    	return sqlSessionTemplate.selectList("com.ksmart.harulook.point.service.PointMapper.pointUse", map);
    }
    
    /*포인트 취득 내역*/
    public List<PointDto> pointGet(String userId) {
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("userId", userId);
    	System.out.println("PointDao pointGet  아이디 =  " + map);
    	return sqlSessionTemplate.selectList("com.ksmart.harulook.point.service.PointMapper.pointGet", map);
    }
}
