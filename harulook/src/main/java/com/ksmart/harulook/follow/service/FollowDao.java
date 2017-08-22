package com.ksmart.harulook.follow.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ksmart.harulook.guest.service.GuestDto;

@Repository
public class FollowDao {
	 @Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	
   /*팔로우삭제 */
    public String followDelete(String userId, String followId) {
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("userId", userId);
    	map.put("followId", followId);
    	return sqlSessionTemplate.selectOne("com.ksmart.harulook.follow.service.FollowMapper.followDelete", map);
    }
	  
    /*팔로우미리스트 */
    public List<FollowDto> followMeList(String followId) {
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("followId", followId);
    	return sqlSessionTemplate.selectList("com.ksmart.harulook.follow.service.FollowMapper.followMeSeach", map);
    }
    
	/*팔로우리스트 */
    public List<FollowDto> followList(String followId) {
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("followId", followId);
    	return sqlSessionTemplate.selectList("com.ksmart.harulook.follow.service.FollowMapper.followSeach", map);
    	
    }
    
    /*팔로우체크 */
    public String followCheck(String userId, String followId) {
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("userId", userId);
    	map.put("followId", followId);
    	System.out.println("followDao map == " + map);
    	return sqlSessionTemplate.selectOne("com.ksmart.harulook.follow.service.FollowMapper.followCheck", map);
    	
    }
	 
	/*팔로우no검색*/
    public String followNo() {
    	return sqlSessionTemplate.selectOne("com.ksmart.harulook.follow.service.FollowMapper.followNo");
    	
    }
	 
	/*팔로우입력 */
    public int followInsert(String followNo, String userId, String followId) {
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("followNo", followNo);
    	map.put("userId", userId);
    	map.put("followId", followId);
    	System.out.println("followDao map" + map);
        return sqlSessionTemplate.insert("com.ksmart.harulook.follow.service.FollowMapper.followInsert", map);
    }
}
