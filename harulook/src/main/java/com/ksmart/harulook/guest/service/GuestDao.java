package com.ksmart.harulook.guest.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ksmart.harulook.member.service.MemberDto;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class GuestDao {
	 @Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	 
	/*중복접속체크 */
    public String guestSelect(String guestIp) {
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("guestIp", guestIp);
    	return sqlSessionTemplate.selectOne("com.ksmart.harulook.guest.service.GuestMapper.guestSelect", map);
    	
    }
	 
	/*게스트no검색 */
    public String guestSelectNo(String a) {
    	return sqlSessionTemplate.selectOne("com.ksmart.harulook.guest.service.GuestMapper.guestSelectNo");
    	
    }
	 
	/*게스트입력 */
    public int guestInsert(String guestIp, String guestInsertNo) {
    	System.out.println("GuestDto 회원가입내용" + guestIp);
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("guestIp", guestIp);
    	map.put("guestInsertNo", guestInsertNo);
    	
    	System.out.println("GuestDto map" + map);
        return sqlSessionTemplate.insert("com.ksmart.harulook.guest.service.GuestMapper.guestinsert", map);
    }
}
