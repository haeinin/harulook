package com.ksmart.harulook.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ksmart.harulook.member.service.MemberDao;
import com.ksmart.harulook.member.service.MemberDto;

@RestController
public class MemberRestController {

	@Autowired
    private MemberDao memberDao;
	
	/*비밀번호찾기*/
	@RequestMapping(value="/pwFindFormAdd", produces = "application/text; charset=utf8", method = RequestMethod.POST)
	public String pwFindForm(MemberDto memberDto,
			HttpSession session,
			HttpServletResponse response) throws IOException {
				System.out.println("MemeberController 비밀번호찾기==" + memberDto);
			session.setAttribute("id", memberDto.getUserId());
				System.out.println("MemeberController 비밀번호찾기 세션아이디==" + session);
			String levelFindForm = memberDao.pwFindForm(memberDto);
				System.out.println("MemeberController 비밀번호찾기==" + levelFindForm);
			return levelFindForm; //일반회원가입폼화면
	}
	
	/*아이디찾기*/
	@RequestMapping(value="/idFindFormAdd", produces = "application/text; charset=utf8", method = RequestMethod.POST)
	public String idFindForm(MemberDto memberDto,
			HttpServletResponse response) throws IOException {
				System.out.println("MemeberController 아이디찾기==" + memberDto);
			String idFindForm = memberDao.idFindForm(memberDto);
				System.out.println("MemeberController 아이디찾기==" + idFindForm);
		return idFindForm; //일반회원가입폼화면
	}
	
	/*회원탈퇴비밀번호체크*/
	@RequestMapping(value="/userDeletePw", produces = "application/text; charset=utf8", method = RequestMethod.POST)
	public String userDeletePw(
			@RequestParam(value="pwcheck", required=true) String userId,
			HttpServletResponse response) throws IOException {
			System.out.println("member_user_detail 회원탈퇴시 비밀번호 체크할 아이디 == " + userId);
			String userDeletePw = memberDao.userDeletePw(userId);
			System.out.println("member_user_detail 회원탈퇴시 비밀번호 체크된 비번 == " + userDeletePw);
		return userDeletePw; //비밀번호체크 받아오는값
	}
	
	/*닉네임중복체크*/
	@RequestMapping(value="/nickcheck", produces = "application/text; charset=utf8", method = RequestMethod.POST)
	public String nickcheck(
			@RequestParam(value="usernick", required=true) String nickcheck,
			HttpServletResponse response) throws IOException {
			System.out.println("MemberController 아이디 중복체크== " + nickcheck);
        String usernick = memberDao.userNickCheck(nickcheck); //중복체크한 아이디 변수값
        	System.out.println("MemberController 중복체크후 받아온 닉네임 == "+usernick);
        return usernick;  //아이디중복체크후 화면 그대로
    }
	
	/*아이디중복체크*/
	@RequestMapping(value="/idcheck", produces = "application/text; charset=utf8", method = RequestMethod.POST)
	public String idcheck(
			@RequestParam(value="idcheck", required=true) String idcheck,
			HttpServletResponse response) throws IOException {
		System.out.println("MemberController 아이디 중복체크== " + idcheck);
        String userid = memberDao.userIdCheck(idcheck); //중복체크한 아이디 변수값
        System.out.println("MemberController 중복체크후 받아온 아이디 == "+userid);
        return userid;  //아이디중복체크후 화면 그대로
    }
}