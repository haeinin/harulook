package com.ksmart.harulook.member.service;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
 
@Repository
public class MemberDao { 
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;
    
    /*로그인 */
    public MemberDto login(String id) {
	    	Map<String, String> map = new HashMap<String, String>();
	    	map.put("userId", id);
	    	
			System.out.println("MemeberDao 로그인 == " + map);
        return sqlSessionTemplate.selectOne("com.ksmart.harulook.member.service.MemberMapper.login", map);
    }
    
    /*사업자회원정보보기 + 관리자 회원정보 */
    public MemberDto businessDetail(String userId) {
		Map<String, String> map = new HashMap<String, String>();
    	map.put("userId", userId);
        return sqlSessionTemplate.selectOne("com.ksmart.harulook.member.service.MemberMapper.businessDetail", map);
    }
    
	/*일반회원 스타일 */
	public List<MemberDto> userStyle(String userId) {
		Map<String, String> map = new HashMap<String, String>();
	    map.put("userId", userId);
	    return sqlSessionTemplate.selectList("com.ksmart.harulook.member.service.MemberMapper.userStyle", map);
	}


    /*일반회원 색상 */
    public List<MemberDto> userColor(String userId) {
    	System.out.println("색상고를때");
		Map<String, String> map = new HashMap<String, String>();
        map.put("userId", userId);
        return sqlSessionTemplate.selectList("com.ksmart.harulook.member.service.MemberMapper.userColor", map);
    }
    
    /*일반회원정보보기 */
    public MemberDto userDetail(String userId) {
		Map<String, String> map = new HashMap<String, String>();
    	map.put("userId", userId);
        return sqlSessionTemplate.selectOne("com.ksmart.harulook.member.service.MemberMapper.userDetail", map);
    }
    
    /*관리자회원리스트 */
    public List<MemberDto> managerList(int currentPage, int pagePerRow, String level) {
		Map<Object, Object> map = new HashMap<Object, Object>();
        map.put("beginRow", (currentPage-1)*pagePerRow);
        map.put("pagePerRow", pagePerRow);
        map.put("level", level);
        return sqlSessionTemplate.selectList("com.ksmart.harulook.member.service.MemberMapper.userList", map);
    }
    
    /*사업자회원리스트 */
    public List<MemberDto> businessList(int currentPage, int pagePerRow, String level) {
		
        Map<Object, Object> map = new HashMap<Object, Object>();
        map.put("beginRow", (currentPage-1)*pagePerRow);
        map.put("pagePerRow", pagePerRow);
        map.put("level", level);
        return sqlSessionTemplate.selectList("com.ksmart.harulook.member.service.MemberMapper.userList", map);
    }
    
    /*일반회원리스트 */
    public List<MemberDto> userList(int currentPage, int pagePerRow, String level) {
		
        Map<Object, Object> map = new HashMap<Object, Object>();
        map.put("beginRow", (currentPage-1)*pagePerRow);
        map.put("pagePerRow", pagePerRow);
        map.put("level", level);
        return sqlSessionTemplate.selectList("com.ksmart.harulook.member.service.MemberMapper.userList", map);
    }
    
    /*회원게시물들의 카운트 매서드 */
    public int getBoardCount(String level) {
    		
        return sqlSessionTemplate.selectOne("com.ksmart.harulook.member.service.MemberMapper.getBoardCount", level);
    }

    /*닉네임중복체크 */
    public String userNickCheck(String nickcheck) {
    	System.out.println("MemberDao 아이디중복체크 아이디값==" + nickcheck);
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("nickcheck", nickcheck);
    	System.out.println("MemberDao에서 맵핑된 아이디값==  " + map);
    	return sqlSessionTemplate.selectOne("com.ksmart.harulook.member.service.MemberMapper.nickcheck", map);
    }
    
    /*아이디중복체크 */
    public String userIdCheck(String idcheck) {
    	System.out.println("MemberDao 아이디중복체크 아이디값==" + idcheck);
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("idcheck", idcheck);
    	System.out.println("MemberDao에서 맵핑된 아이디값==  " + map);
    	return sqlSessionTemplate.selectOne("com.ksmart.harulook.member.service.MemberMapper.idcheck", map);
    }
    
    /*회원가입입력 */
    public int userInsert(MemberDto memberDto) {
    	System.out.println("MemberDao 회원가입내용" + memberDto);
        return sqlSessionTemplate.insert("com.ksmart.harulook.member.service.MemberMapper.userinsert", memberDto);
    }

}
