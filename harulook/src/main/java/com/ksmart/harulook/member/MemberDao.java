package com.ksmart.harulook.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ksmart.harulook.dto.MemberDto;
 
@Repository
public class MemberDao { 
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;
    
    /*회원가입입력 Dao */
    public int userInsert(MemberDto memberDto) {
    	System.out.println("MemberDao" + memberDto);
        return sqlSessionTemplate.insert("com.ksmart.harulook.member.MemberMapper.userinsert", memberDto);
    }
}
