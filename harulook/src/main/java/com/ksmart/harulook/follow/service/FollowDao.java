package com.ksmart.harulook.follow.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ksmart.harulook.guest.service.GuestDto;

@Repository
public class FollowDao implements FollowInterface {
	 @Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	
	/*팔로우삭제 */
    /* (non-Javadoc)
	 * @see com.ksmart.harulook.follow.service.FollowInterface#deleteFollow(java.lang.String, java.lang.String)
	 */
    @Override
	public String deleteFollow(String userId, String followId) {
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("userId", userId);
    	map.put("followId", followId);
    	return sqlSessionTemplate.selectOne("com.ksmart.harulook.follow.service.FollowMapper.followDelete", map);
    }
	  
    /*나를 팔로우한 리스트 카운트 매서드 */
    /* (non-Javadoc)
	 * @see com.ksmart.harulook.follow.service.FollowInterface#selectFollowMeListCount(java.lang.String)
	 */
    @Override
	public int selectFollowMeListCount(String userId) {
    		
        return sqlSessionTemplate.selectOne("com.ksmart.harulook.follow.service.FollowMapper.followMeListCount", userId);
    }
    
    /*팔로우리스트 카운트 매서드 */
    /* (non-Javadoc)
	 * @see com.ksmart.harulook.follow.service.FollowInterface#selectFollowListCount(java.lang.String)
	 */
    @Override
	public int selectFollowListCount(String userId) {
    		
        return sqlSessionTemplate.selectOne("com.ksmart.harulook.follow.service.FollowMapper.followListCount", userId);
    }
    
    /*팔로우미리스트 */
    /* (non-Javadoc)
	 * @see com.ksmart.harulook.follow.service.FollowInterface#selectFollowMeList(int, int, java.lang.String)
	 */
    @Override
	public List<FollowDto> selectFollowMeList(int currentPage, int pagePerRow, String followId) {
    	Map<Object, Object> map = new HashMap<Object, Object>();
    	map.put("beginRow", (currentPage-1)*pagePerRow);
        map.put("pagePerRow", pagePerRow);
    	map.put("followId", followId);
    	return sqlSessionTemplate.selectList("com.ksmart.harulook.follow.service.FollowMapper.followMeSeach", map);
    }
    
	/*팔로우리스트 */
    /* (non-Javadoc)
	 * @see com.ksmart.harulook.follow.service.FollowInterface#selectFollowList(int, int, java.lang.String)
	 */
    @Override
	public List<FollowDto> selectFollowList(int currentPage, int pagePerRow, String followId) {
    	Map<Object, Object> map = new HashMap<Object, Object>();
    	map.put("beginRow", (currentPage-1)*pagePerRow);
        map.put("pagePerRow", pagePerRow);
    	map.put("followId", followId);
    	return sqlSessionTemplate.selectList("com.ksmart.harulook.follow.service.FollowMapper.followSeach", map);
    	
    }
    
    /*팔로우체크 */
    /* (non-Javadoc)
	 * @see com.ksmart.harulook.follow.service.FollowInterface#selectFollowCheck(java.lang.String, java.lang.String)
	 */
    @Override
	public String selectFollowCheck(String userId, String followId) {
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("userId", userId);
    	map.put("followId", followId);
    	System.out.println("followDao map == " + map);
    	return sqlSessionTemplate.selectOne("com.ksmart.harulook.follow.service.FollowMapper.followCheck", map);
    	
    }
	 
	/*팔로우no검색*/
    /* (non-Javadoc)
	 * @see com.ksmart.harulook.follow.service.FollowInterface#selectFollowNo()
	 */
    @Override
	public String selectFollowNo() {
    	return sqlSessionTemplate.selectOne("com.ksmart.harulook.follow.service.FollowMapper.followNo");
    	
    }
	 
	/*팔로우입력 */
    /* (non-Javadoc)
	 * @see com.ksmart.harulook.follow.service.FollowInterface#insertFollow(java.lang.String, java.lang.String, java.lang.String)
	 */
    @Override
	public int insertFollow(String followNo, String userId, String followId) {
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("followNo", followNo);
    	map.put("userId", userId);
    	map.put("followId", followId);
    	System.out.println("followDao map" + map);
        return sqlSessionTemplate.insert("com.ksmart.harulook.follow.service.FollowMapper.followInsert", map);
    }
}
