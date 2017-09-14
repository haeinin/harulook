package com.ksmart.harulook.guest.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ksmart.harulook.member.service.MemberDto;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class GuestDao implements GuestInterface {
	 @Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	
	/*월간방문자수조회 */
    /* (non-Javadoc)
	 * @see com.ksmart.harulook.guest.service.GuestInterface#selectMonthlyGuest()
	 */
    @Override
	public List<GuestDto> selectMonthlyGuest() {
    	return sqlSessionTemplate.selectList("com.ksmart.harulook.guest.service.GuestMapper.monthlyGuest");
    }
	 
	/*주간방문자수조회 */
    /* (non-Javadoc)
	 * @see com.ksmart.harulook.guest.service.GuestInterface#selectWeeklyGuest()
	 */
    @Override
	public List<GuestDto> selectWeeklyGuest() {
    	return sqlSessionTemplate.selectList("com.ksmart.harulook.guest.service.GuestMapper.weeklyGuest");
    }
	 
	 /*일일방문자수조회 */
    /* (non-Javadoc)
	 * @see com.ksmart.harulook.guest.service.GuestInterface#selectdailyGuest()
	 */
    @Override
	public List<GuestDto> selectdailyGuest() {
    	return sqlSessionTemplate.selectList("com.ksmart.harulook.guest.service.GuestMapper.dailyGuest");
    }
	 
	/*중복접속체크 */
    /* (non-Javadoc)
	 * @see com.ksmart.harulook.guest.service.GuestInterface#selectGuest(java.lang.String)
	 */
    @Override
	public String selectGuest(String guestIp) {
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("guestIp", guestIp);
    	return sqlSessionTemplate.selectOne("com.ksmart.harulook.guest.service.GuestMapper.guestSelect", map);
    	
    }
	 
	/*게스트no검색 */
    /* (non-Javadoc)
	 * @see com.ksmart.harulook.guest.service.GuestInterface#selectGuestNo(java.lang.String)
	 */
    @Override
	public String selectGuestNo(String a) {
    	return sqlSessionTemplate.selectOne("com.ksmart.harulook.guest.service.GuestMapper.guestSelectNo");
    	
    }
	 
	/*게스트입력 */
    /* (non-Javadoc)
	 * @see com.ksmart.harulook.guest.service.GuestInterface#insertGuest(java.lang.String, java.lang.String)
	 */
    @Override
	public int insertGuest(String guestIp, String guestInsertNo) {
    	System.out.println("GuestDto 회원가입내용" + guestIp);
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("guestIp", guestIp);
    	map.put("guestInsertNo", guestInsertNo);
    	
    	System.out.println("GuestDto map" + map);
        return sqlSessionTemplate.insert("com.ksmart.harulook.guest.service.GuestMapper.guestinsert", map);
    }
}
