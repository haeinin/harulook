package com.ksmart.harulook.member;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ksmart.harulook.dto.MemberDto;

@Controller
public class MemberController {
	
	@Autowired
    private MemberDao memberDao;
	
	/*일반회원가입액션*/
	@RequestMapping(value="/userAdd", method = RequestMethod.POST)
	public String userAdd(MemberDto memberDto) {
        System.out.println("MemberController" + memberDto);
        memberDao.userInsert(memberDto);
        return "home";  //회원가입후 홈화면으로
    }
			
	/*member_user_insert(일반회원가입폼)*/
	@RequestMapping(value = "/member_user_insert", method = RequestMethod.GET)
	public String userAdd() {
		System.out.println("member_user_insert 일반회원가입홈화면");
		return "member/member_user_insert"; //일반회원가입폼화면
	}
		
}