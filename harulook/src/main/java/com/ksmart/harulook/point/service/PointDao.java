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
	
	/*출석체크삭제 */
    public int deleteAttenCheck(String userId) {
    	Map<String, String> map = new HashMap<String, String>();
        map.put("userId", userId);
        return sqlSessionTemplate.insert("com.ksmart.harulook.point.service.PointMapper.attenCheckDelete", map);
    }
	
	/* 출석체크 한달검색  */
	public int selectAttenCheckMonth(String userId) {
		Map<String, String> map = new HashMap<String, String>();
        map.put("userId", userId);
        return sqlSessionTemplate.selectOne("com.ksmart.harulook.point.service.PointMapper.attenCheckSelectMonth", map);
	}
	
	/* 출석체크검색  */
	public String selectAttenCheck(String userId) {
		Map<String, String> map = new HashMap<String, String>();
        map.put("userId", userId);
        return sqlSessionTemplate.selectOne("com.ksmart.harulook.point.service.PointMapper.attenCheckSelect", map);
	}
	
	/*출석체크입력 */
    public int insertAttenCheck(String userId) {
    	Map<String, String> map = new HashMap<String, String>();
        map.put("userId", userId);
        return sqlSessionTemplate.insert("com.ksmart.harulook.point.service.PointMapper.attenCheckInsert", map);
    }
	
	/*포인트취득 */
    public int insertPointGet(String userId, String pointPolicyNo) {
    	Map<String, String> map = new HashMap<String, String>();
        map.put("userId", userId);
        map.put("pointPolicyNo", pointPolicyNo);
        return sqlSessionTemplate.insert("com.ksmart.harulook.point.service.PointMapper.pointGetInsert", map);
    }
	
	/* 포인트등록 게시물 검색  */
	public String selectPointCehck(String userId, String pointPolicyNo) {
		Map<String, String> map = new HashMap<String, String>();
        map.put("userId", userId);
        map.put("pointPolicyNo", pointPolicyNo);
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.point.service.PointMapper.pointCehck", map);
	}
	
	/*쿠폰 중복 검사 */
    public String selectCouponCheck(String pointGoodsCode) {
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("pointGoodsCode", pointGoodsCode);
    	return sqlSessionTemplate.selectOne("com.ksmart.harulook.point.service.PointMapper.couponCheck", map);
    }
	
	/*쿠폰입력no검색*/
    /*public String pointNo() {
    	return sqlSessionTemplate.selectOne("com.ksmart.harulook.point.service.PointMapper.pointNo");
    	
    }*/
	
	/*쿠폰사용 */
    public int insetCoupon(/*String pointNo, */String userId, int pointPolicyValue, String pointGoodsCode) {
    	Map<Object, Object> map = new HashMap<Object, Object>();
    	/*map.put("pointNo", pointNo);*/
    	map.put("userId", userId);
    	map.put("pointPolicyValue", pointPolicyValue);
    	map.put("pointGoodsCode", pointGoodsCode);
    	System.out.println("couponInset map" + map);
        return sqlSessionTemplate.insert("com.ksmart.harulook.point.service.PointMapper.couponInset", map);
    }
	
    /*나의 포인트*/
    public int selectMyPoint(String userId) {
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("userId", userId);
    	return sqlSessionTemplate.selectOne("com.ksmart.harulook.point.service.PointMapper.myPoint", map);
    }
	
	/*포인트 정책 리스트*/
    public List<PointDto> selectPointPolicy() {
    	return sqlSessionTemplate.selectList("com.ksmart.harulook.point.service.PointMapper.pointPolicy");
    }
    
    /*포인트 쿠폰 정책*/
    public List<PointDto> selectPointUsePolicy() {
    	return sqlSessionTemplate.selectList("com.ksmart.harulook.point.service.PointMapper.pointUsePolicy");
    }
    
    /*포인트 사용 내역*/
    public List<PointDto> selectPointUse(int currentPage, int pagePerRow, String userId) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("beginRow", (currentPage-1)*pagePerRow);
	    map.put("pagePerRow", pagePerRow);
    	map.put("userId", userId);
		System.out.println("PointDao pointUse  아이디 =  " + map);
    	return sqlSessionTemplate.selectList("com.ksmart.harulook.point.service.PointMapper.pointUse", map);
    }
    
    /*포인트 사용 내역 카운트 */
    public int selectPointUseCount(String userId) {
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("userId", userId);	
        return sqlSessionTemplate.selectOne("com.ksmart.harulook.point.service.PointMapper.pointUseCount", map);
    }
    
    /*포인트 취득 내역*/
    public List<PointDto> selectPointGet(int currentPage, int pagePerRow, String userId) {
    	Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("beginRow", (currentPage-1)*pagePerRow);
	    map.put("pagePerRow", pagePerRow);
    	map.put("userId", userId);
    	System.out.println("PointDao pointGet  아이디 =  " + map);
    	return sqlSessionTemplate.selectList("com.ksmart.harulook.point.service.PointMapper.pointGet", map);
    }
    
    /*포인트 취득 내역 카운트 */
    public int selectPointGetCount(String userId) {
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("userId", userId);	
        return sqlSessionTemplate.selectOne("com.ksmart.harulook.point.service.PointMapper.pointGetCount", map);
    }
}
