package com.ksmart.harulook.member.service;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ksmart.harulook.member.service.MemberDto;
 
@Repository
public class MemberDao { 
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;
    
    /*비밀번호찾기 */
    public String pwFindForm(MemberDto memberDto) {
		Map<Object, Object> map = new HashMap<Object, Object>();
    	map.put("userId", memberDto.getUserId());
    	map.put("userNick", memberDto.getUserNick());
    	map.put("userQ", memberDto.getUserQ());
    	map.put("userA", memberDto.getUserA());
    	return sqlSessionTemplate.selectOne("com.ksmart.harulook.member.service.MemberMapper.pwFindForm", map);
      
    }
    
    /*아이디찾기 */
    public String idFindForm(MemberDto memberDto) {
		Map<Object, Object> map = new HashMap<Object, Object>();
    	map.put("userNick", memberDto.getUserNick());
    	map.put("userPw", memberDto.getUserPw());
    	map.put("userQ", memberDto.getUserQ());
    	map.put("userA", memberDto.getUserA());
    	return sqlSessionTemplate.selectOne("com.ksmart.harulook.member.service.MemberMapper.idFindForm", map);
      
    }
    
    /*삭제된회원리스트입력 */
    public String deleteUserInsert(String id) {
	    	Map<String, String> map = new HashMap<String, String>();
	    	map.put("userId", id);
	    	System.out.println("MemeberDao 로그인 == " + map);
        return sqlSessionTemplate.selectOne("com.ksmart.harulook.member.service.MemberMapper.deleteUserInsert", map);
    }
    
    /*회원삭제 */
    public String userDeleteAdd(String id) {
	    	Map<String, String> map = new HashMap<String, String>();
	    	map.put("userId", id);
	    	System.out.println("MemeberDao 로그인 == " + map);
        return sqlSessionTemplate.selectOne("com.ksmart.harulook.member.service.MemberMapper.userDeleteAdd", map);
    }
    
    /*회원탈퇴비밀번호체크 */
    public String userDeletePw(String userId) {
		Map<String, String> map = new HashMap<String, String>();
    	map.put("userId", userId);
        return sqlSessionTemplate.selectOne("com.ksmart.harulook.member.service.MemberMapper.userDeletePw", map);
    }
    
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
	public List<String> userStyle(String userId) {
		Map<String, String> map = new HashMap<String, String>();
	    map.put("userId", userId);
	    return sqlSessionTemplate.selectList("com.ksmart.harulook.member.service.MemberMapper.userStyle", map);
	}


    /*일반회원 색상 */
    public List<String> userColor(String userId) {
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
    
  
    /*전체회원리스트 */
    public List<MemberDto> userList(int currentPage, int pagePerRow, String level, String userId) {
		
        Map<Object, Object> map = new HashMap<Object, Object>();
        map.put("beginRow", (currentPage-1)*pagePerRow);
        map.put("pagePerRow", pagePerRow);
        map.put("level", level);
        map.put("userId", userId);
        	System.out.println(map + " ==MemberDao 전체회원리스트 map");
        return sqlSessionTemplate.selectList("com.ksmart.harulook.member.service.MemberMapper.userList", map);
    }
    /*전체회원리스트 페이지 없이 */
    public List<MemberDto> allUserList(String level, String userId) {
		
        Map<Object, Object> map = new HashMap<Object, Object>();
        map.put("level", level);
        map.put("userId", userId);
        	System.out.println(map + " ==MemberDao 전체회원리스트 map");
        return sqlSessionTemplate.selectList("com.ksmart.harulook.member.service.MemberMapper.allUserList", map);
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
    
    /*관리자가입입력 */
    public int managerInsert(MemberDto memberDto) {
    	System.out.println("MemberDao 사입자가입내용" + memberDto);
        return sqlSessionTemplate.insert("com.ksmart.harulook.member.service.MemberMapper.managerinsert", memberDto);
    }
    
    /*사업자가입입력 */
    public int businessInsert(MemberDto memberDto) {
    	System.out.println("MemberDao 사입자가입내용" + memberDto);
        return sqlSessionTemplate.insert("com.ksmart.harulook.member.service.MemberMapper.businessinsert", memberDto);
    }
    
    /*회원컬러배열입력 */
    public int userColorInsert(String userColorInsert, String userColorNo, String userId) {
    	System.out.println("MemberDao 컬러배열" + userColorInsert);
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("userColorInsert", userColorInsert);
    	map.put("userColorNo", userColorNo);
    	map.put("userId", userId);
        return sqlSessionTemplate.insert("com.ksmart.harulook.member.service.MemberMapper.userColorInsert", map);
    	
    }
    
    /*회원스타일배열입력 */
    public int userStyleInsert(String userStyleInsert, String userStyleNo, String userId) {
    	System.out.println("MemberDao 스타일배열" + userStyleInsert);
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("userStyleInsert", userStyleInsert);
    	map.put("userStyleNo", userStyleNo);
    	map.put("userId", userId);
        return sqlSessionTemplate.insert("com.ksmart.harulook.member.service.MemberMapper.userStyleInsert", map);
    }
    
    /*회원컬러삭제 */
    public int userColorDelete(String userId) {
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("userId", userId);
        return sqlSessionTemplate.insert("com.ksmart.harulook.member.service.MemberMapper.userColorDelete", map);
    	
    }
    
    /*회원스타일삭제 */
    public int userStyleDelete(String userId) {
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("userId", userId);
        return sqlSessionTemplate.insert("com.ksmart.harulook.member.service.MemberMapper.userStyleDelete", map);
    }
    
    /*컬러검색 */
    public String colorSelect(String a) {
    	return sqlSessionTemplate.selectOne("com.ksmart.harulook.member.service.MemberMapper.userColorSelect");
    	
    }
    
    /*컬러검색 */
    public String styleSelct(String a) {
    	return sqlSessionTemplate.selectOne("com.ksmart.harulook.member.service.MemberMapper.userStyleSelect");
    }
    
    /*관리자 사업자 정보수정 */
    public int businessUpdate(MemberDto memberDto) {
    	System.out.println("MemberDao 일반회원수정내용" + memberDto);
        return sqlSessionTemplate.insert("com.ksmart.harulook.member.service.MemberMapper.businessUpdate", memberDto);
    }
    
    /*일반회원정보수정 */
    public int userUpdate(MemberDto memberDto) {
    	System.out.println("MemberDao 일반회원수정내용" + memberDto);
        return sqlSessionTemplate.insert("com.ksmart.harulook.member.service.MemberMapper.userUpdate", memberDto);
    }
    
    /*회원가입입력 */
    public int userInsert(MemberDto memberDto) {
    	System.out.println("MemberDao 회원가입내용" + memberDto);
        return sqlSessionTemplate.insert("com.ksmart.harulook.member.service.MemberMapper.userinsert", memberDto);
    }

}
