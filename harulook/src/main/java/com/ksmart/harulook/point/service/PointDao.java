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
	
	/*쿠폰 중복 검사 */
    public String couponCheck(String pointGoodsCode) {
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("pointGoodsCode", pointGoodsCode);
    	return sqlSessionTemplate.selectOne("com.ksmart.harulook.point.service.PointMapper.couponCheck", map);
    }
	
	/*쿠폰입력no검색*/
    public String pointNo() {
    	return sqlSessionTemplate.selectOne("com.ksmart.harulook.point.service.PointMapper.pointNo");
    	
    }
	
	/*쿠폰사용 */
    public int couponInset(String pointNo, String userId, int pointPolicyValue, String pointGoodsCode) {
    	Map<Object, Object> map = new HashMap<Object, Object>();
    	map.put("pointNo", pointNo);
    	map.put("userId", userId);
    	map.put("pointPolicyValue", pointPolicyValue);
    	map.put("pointGoodsCode", pointGoodsCode);
    	System.out.println("couponInset map" + map);
        return sqlSessionTemplate.insert("com.ksmart.harulook.point.service.PointMapper.couponInset", map);
    }
	
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
