package com.ksmart.harulook.member.controller;

import static org.hamcrest.CoreMatchers.nullValue;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ksmart.harulook.member.service.MemberDao;
import com.ksmart.harulook.member.service.MemberDto;

@Controller
public class MemberController {
	
	@Autowired
    private MemberDao memberDao;
	
	/*비밀번호찾기*/
	@RequestMapping(value="/pwFindFormAdd", produces = "application/text; charset=utf8", method = RequestMethod.POST)
	public @ResponseBody String pwFindForm(MemberDto memberDto,
			HttpServletResponse response) throws IOException {
				System.out.println("MemeberController 비밀번호찾기==" + memberDto);
			String levelFindForm = memberDao.pwFindForm(memberDto);
				System.out.println("MemeberController 비밀번호찾기==" + levelFindForm);
			return levelFindForm; //일반회원가입폼화면
	}
	
	/*아이디찾기*/
	@RequestMapping(value="/idFindFormAdd", produces = "application/text; charset=utf8", method = RequestMethod.POST)
	public @ResponseBody String idFindForm(MemberDto memberDto,
			HttpServletResponse response) throws IOException {
				System.out.println("MemeberController 아이디찾기==" + memberDto);
			String idFindForm = memberDao.idFindForm(memberDto);
				System.out.println("MemeberController 아이디찾기==" + idFindForm);
		return idFindForm; //일반회원가입폼화면
	}
	
	/*회원삭제처리후 탈퇴회원리스트에입력*/
	@RequestMapping(value="/userDeleteAdd", method = RequestMethod.POST)
	public String userDeleteAdd(Model model,
			@RequestParam(value="deleteid", required=true) String userId) {
		memberDao.userDeleteAdd(userId);	//회원삭제
		memberDao.deleteUserInsert(userId);	//삭제된회원리스트입력
		System.out.println("MemberController 회원탈퇴시 user목록삭제후 delete_user 입력");
		return "home"; //사업자 관리자 수정폼
	}
	
	/*회원탈퇴비밀번호체크*/
	@RequestMapping(value="/userDeletePw", produces = "application/text; charset=utf8", method = RequestMethod.POST)
	public @ResponseBody String userDeletePw(
			@RequestParam(value="pwcheck", required=true) String userId,
			HttpServletResponse response) throws IOException {
			System.out.println("member_user_detail 회원탈퇴시 비밀번호 체크할 아이디 == " + userId);
			String userDeletePw = memberDao.userDeletePw(userId);
			System.out.println("member_user_detail 회원탈퇴시 비밀번호 체크된 비번 == " + userDeletePw);
		return userDeletePw; //비밀번호체크 받아오는값
	}
	
	/*로그아웃액션*/
	@RequestMapping(value="/logoutadd", method = RequestMethod.POST)
	public String logoutadd() {
		System.out.println("MemberControlladd 로그아웃 ");
		return "home"; //홈화면
	}
	
	/*로그아웃화면*/
	@RequestMapping(value="/logout", method = RequestMethod.POST)
	public String logout() {
		System.out.println("MemberControll 로그아웃 ");
		return "login/logout"; //홈화면
	}
	
	/*로그인*/
	@RequestMapping(value="/loginAdd", produces = "application/text; charset=utf8", method = RequestMethod.POST)
	public String login(Model model,
			HttpSession session,
			@RequestParam(value="userId", required=true) String id,
			@RequestParam(value="userPw", required=true) String pw) {
		System.out.println("MemberController 로그인시 == " + id);
		
		MemberDto loginCheck = memberDao.login(id);
			System.out.println("MemeberController 로그인시 체크되어 받은 아이디loginCheck==" + loginCheck);
		
		if(loginCheck == null){
			loginCheck = null;
			System.out.println("아이디틀림");
			model.addAttribute("loginCheck", "아이디틀림");
			return "login/login";
		}else if(id.equals(loginCheck.getUserId())) {
			if(pw.equals(loginCheck.getUserPw())) {
				System.out.println("로그인성공");
				session.setAttribute("id", loginCheck.getUserId());
				session.setAttribute("level", loginCheck.getUserLevel());
				session.setAttribute("nick", loginCheck.getUserNick());
				model.addAttribute("loginCheck", "로그인성공");
				return "home";
			}else{
				System.out.println("비번틀림");
				model.addAttribute("loginCheck", "비번틀림");
				return "login/login";
			}
		}
		return "login/login"; //로그인화면
	}
	
	/*사업자회원정보보기 + 관리자회원정보*/
	@RequestMapping(value="/member_manager_detail", method = RequestMethod.GET)
	public String managerDetail(Model model,
			@RequestParam(value="userId", required=true) String userId) {
			System.out.println("member_user_detail 일반회원정보보기할때 받아온 아이디 == " + userId);
			MemberDto businessDetail = memberDao.businessDetail(userId);
			model.addAttribute("businessDetail", businessDetail);
				System.out.println("MemeberController 회원정보보기로 받아온 회원상세데이터들 model==" + model);
		return "member/manager/member_manager_detail"; //일반회원가입폼화면
	}
	
	/*사업자회원정보보기 + 관리자회원정보*/
	@RequestMapping(value="/member_business_detail", method = RequestMethod.GET)
	public String businessDetail(Model model,
			@RequestParam(value="userId", required=true) String userId) {
			System.out.println("member_user_detail 일반회원정보보기할때 받아온 아이디 == " + userId);
			MemberDto businessDetail = memberDao.businessDetail(userId);
			model.addAttribute("businessDetail", businessDetail);
				System.out.println("MemeberController 회원정보보기로 받아온 회원상세데이터들 model==" + model);
		return "member/business/member_business_detail"; //일반회원가입폼화면
	}
	
	/*일반회원정보보기*/
	@RequestMapping(value="/member_user_detail", method = RequestMethod.GET)
	public String userDetail(Model model,
			@RequestParam(value="userId", required=true) String userId) {
			System.out.println("member_user_detail 일반회원정보보기할때 받아온 아이디 == " + userId);
			MemberDto userDetail = memberDao.userDetail(userId);
			model.addAttribute("userDetail", userDetail);
				System.out.println("MemeberController 회원정보보기로 받아온 회원상세데이터들 model==" + model);
				
			List<MemberDto> userColor = memberDao.userColor(userId);	
			model.addAttribute("userColor", userColor);
			
			List<MemberDto> userStyle = memberDao.userStyle(userId);	
			model.addAttribute("userStyle", userStyle);
				System.out.println("MemeberController 회원정보보기로 받아온 회원의컬러와스타일 model==" + model);
				
		return "member/user/member_user_detail"; //일반회원가입폼화면
	}
	
	///////////////////////////////////////////////////////////////////////////하나로 합칠수있음
	/*관리자회원목록*/
	@RequestMapping(value={"member_manager_list"}, method = RequestMethod.GET)
    public String managerList(Model model,
             @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		String level = "관리자";	//****나중에 운영자가 회원검색했을때 페이지에서 넘어오는값을 변수로 받아올지 결정하자***
		
		int boardCount = memberDao.getBoardCount(level);	// 일반회원 게시물 수
			
        int pagePerRow = 10;	// 한페이지에 보여줄 갯수 10개
        int lastPage = (int)(Math.ceil(boardCount / pagePerRow)+1);	//총 게시물 숫자에 한페이지당 게시물 숫자 나눈값이 총 페이지 숫자
        List<MemberDto> list = memberDao.userList(currentPage, pagePerRow, level);
		model.addAttribute("currentPage", currentPage);
        model.addAttribute("boardCount", boardCount);
        model.addAttribute("lastPage", lastPage);
        
        model.addAttribute("list", list);
        	System.out.println("MemeberController 셀렉트해서 받아온 일반 회원 리스트 model값 == "+model);
        return "member/manager/member_manager_list";  //아이디중복체크후 화면 그대로
    }
	
	/*사업자회원목록*/
	@RequestMapping(value={"member_business_list"}, method = RequestMethod.GET)
    public String businessList(Model model,
             @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		String level = "사업자";	//****나중에 운영자가 회원검색했을때 페이지에서 넘어오는값을 변수로 받아올지 결정하자***
		
		int boardCount = memberDao.getBoardCount(level);	// 일반회원 게시물 수
			
        int pagePerRow = 10;	// 한페이지에 보여줄 갯수 10개
        int lastPage = (int)(Math.ceil(boardCount / pagePerRow)+1);	//총 게시물 숫자에 한페이지당 게시물 숫자 나눈값이 총 페이지 숫자
        List<MemberDto> list = memberDao.userList(currentPage, pagePerRow, level);
		model.addAttribute("currentPage", currentPage);
        model.addAttribute("boardCount", boardCount);
        model.addAttribute("lastPage", lastPage);
        
        model.addAttribute("list", list);
        	System.out.println("MemeberController 셀렉트해서 받아온 일반 회원 리스트 model값 == "+model);
        return "member/business/member_business_list";  //아이디중복체크후 화면 그대로
    }
	
	/*일반회원목록*/
	@RequestMapping(value={"member_user_list"}, method = RequestMethod.GET)
    public String userList(Model model,
             @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		String level = "일반회원";	//****나중에 운영자가 회원검색했을때 페이지에서 넘어오는값을 변수로 받아올지 결정하자***
		
		int boardCount = memberDao.getBoardCount(level);	// 일반회원 게시물 수
        int pagePerRow = 10;	// 한페이지에 보여줄 갯수 10개
        int lastPage = (int)(Math.ceil(boardCount / pagePerRow)+1);	//총 게시물 숫자에 한페이지당 게시물 숫자 나눈값이 총 페이지 숫자
        List<MemberDto> list = memberDao.userList(currentPage, pagePerRow, level);
		model.addAttribute("currentPage", currentPage);
        model.addAttribute("boardCount", boardCount);
        model.addAttribute("lastPage", lastPage);
        
        model.addAttribute("list", list);
        	System.out.println("MemeberController 셀렉트해서 받아온 일반 회원 리스트 model값 == "+model);
        return "member/user/member_user_list";  //아이디중복체크후 화면 그대로
    }
	///////////////////////////////////////////////////////////////////////////하나로 합칠수있음
	
	/*닉네임중복체크*/
	@RequestMapping(value="/nickcheck", produces = "application/text; charset=utf8", method = RequestMethod.POST)
	public @ResponseBody String nickcheck(
			@RequestParam(value="usernick", required=true) String nickcheck,
			HttpServletResponse response) throws IOException {
			System.out.println("MemberController 아이디 중복체크== " + nickcheck);
        String usernick = memberDao.userNickCheck(nickcheck); //중복체크한 아이디 변수값
        	System.out.println("MemberController 중복체크후 받아온 닉네임 == "+usernick);
        return usernick;  //아이디중복체크후 화면 그대로
    }
	
	/*아이디중복체크*/
	@RequestMapping(value="/idcheck", produces = "application/text; charset=utf8", method = RequestMethod.POST)
	public @ResponseBody String idcheck(
			@RequestParam(value="idcheck", required=true) String idcheck,
			HttpServletResponse response) throws IOException {
		System.out.println("MemberController 아이디 중복체크== " + idcheck);
        String userid = memberDao.userIdCheck(idcheck); //중복체크한 아이디 변수값
        System.out.println("MemberController 중복체크후 받아온 아이디 == "+userid);
        return userid;  //아이디중복체크후 화면 그대로
    }
	
	/*관리자등록액션*/
	@RequestMapping(value="/managerAdd", method = RequestMethod.POST)
	public String managerAdd(MemberDto memberDto) {
        System.out.println("MemberController 회원가입시 받아오는 데이터" + memberDto);
        memberDao.managerInsert(memberDto);	//일반회원가입 기타 입력데이터
        return "home";  //회원가입후 홈화면으로
    }
	
	/*사업자등록액션*/
	@RequestMapping(value="/businessAdd", method = RequestMethod.POST)
	public String businessAdd(MemberDto memberDto) {
        System.out.println("MemberController 회원가입시 받아오는 데이터" + memberDto);
        memberDao.businessInsert(memberDto);	//일반회원가입 기타 입력데이터
        return "home";  //회원가입후 홈화면으로
    }
	
	/*관리자 광고주 정보 수정*/
	@RequestMapping(value="/addBusinessUpdate", method = RequestMethod.POST)
	public String businessUpdateAdd(MemberDto memberDto,
			HttpServletRequest request) {
        System.out.println("MemberController 회원정보수정하기" + memberDto);
        memberDao.businessUpdate(memberDto);	// 관리자 광주고 입력데이터
       
        return "home";  //회원가입후 홈화면으로
    }
	
	/*일반회원정보수정*/
	@RequestMapping(value="/addUserUpdate", method = RequestMethod.POST)
	public String userUpdateAdd(MemberDto memberDto,
			HttpServletRequest request) {
        System.out.println("MemberController 회원정보수정하기" + memberDto);
        memberDao.userUpdate(memberDto);	//일반회원가입 기타 입력데이터
        //유저컬러와 스타일 내용 삭제
        memberDao.userColorDelete(memberDto.getUserId());
        memberDao.userStyleDelete(memberDto.getUserId());
        
        //체크박스 컬러 배열로 받음
        String[] colorValue = request.getParameterValues("colorValue");
        for( int i = 0; i < colorValue.length; i++ ){	//컬러 체크 리스트 갯수만큼 for문 실행
        	
        	String lastColorNo = memberDao.colorSelect(colorValue[i]);	//for문 갯수만큼 마지막 no찾아오기
        	int insertColorNo = 1;    //DB에 등록된 게시물이 없을 때 번호의 초기값
        	if(lastColorNo != null) {
        		insertColorNo = Integer.parseInt(lastColorNo)+1;	//마지막no +1
    		}
        	memberDao.userColorInsert("user_color_"+insertColorNo, colorValue[i], memberDto.getUserId());
        	System.out.println(colorValue[i] + " == 컬러배열");
        }
        
        //체크박스 스타일 배열로 받음
        String[] styleValue = request.getParameterValues("styleValue");
        for( int i = 0; i < styleValue.length; i++ ){
        	
        	String lastStyleNo = memberDao.styleSelct(styleValue[i]);	//for문 갯수만큼 마지막 no찾아오기
        	int insertStyleNo = 1;    //DB에 등록된 게시물이 없을 때 번호의 초기값
        	if(lastStyleNo != null) {
        		insertStyleNo = Integer.parseInt(lastStyleNo)+1;	//마지막no +1
    		}
        	memberDao.userStyleInsert("user_style_"+insertStyleNo, styleValue[i], memberDto.getUserId());
        	System.out.println(styleValue[i] + " == 스타일배열");
        }
        return "home";  //회원가입후 홈화면으로
    }
	
	/*일반회원가입액션*/
	@RequestMapping(value="/userAdd", method = RequestMethod.POST)
	public String userAdd(MemberDto memberDto,
			HttpServletRequest request) {
        System.out.println("MemberController 회원가입시 받아오는 데이터" + memberDto);
        memberDao.userInsert(memberDto);	//일반회원가입 기타 입력데이터
       
        //체크박스 컬러 배열로 받음
        String[] colorValue = request.getParameterValues("colorValue");
        for( int i = 0; i < colorValue.length; i++ ){	//컬러 체크 리스트 갯수만큼 for문 실행
        	
        	String lastColorNo = memberDao.colorSelect(colorValue[i]);	//for문 갯수만큼 마지막 no찾아오기
        	int insertColorNo = 1;    //DB에 등록된 게시물이 없을 때 번호의 초기값
        	if(lastColorNo != null) {
        		insertColorNo = Integer.parseInt(lastColorNo)+1;	//마지막no +1
    		}
        	memberDao.userColorInsert("user_color_"+insertColorNo, colorValue[i], memberDto.getUserId());
        	System.out.println(colorValue[i] + " == 컬러배열");
        }
        
        //체크박스 스타일 배열로 받음
        String[] styleValue = request.getParameterValues("styleValue");
        for( int i = 0; i < styleValue.length; i++ ){
        	
        	String lastStyleNo = memberDao.styleSelct(styleValue[i]);	//for문 갯수만큼 마지막 no찾아오기
        	int insertStyleNo = 1;    //DB에 등록된 게시물이 없을 때 번호의 초기값
        	if(lastStyleNo != null) {
        		insertStyleNo = Integer.parseInt(lastStyleNo)+1;	//마지막no +1
    		}
        	memberDao.userStyleInsert("user_style_"+insertStyleNo, styleValue[i], memberDto.getUserId());
        	System.out.println(styleValue[i] + " == 스타일배열");
        }
        return "home";  //회원가입후 홈화면으로
    }
	
	/*member_manager_insert(관리자등록 폼)*/
	@RequestMapping(value="/member_manager_insert", method = RequestMethod.GET)
	public String managerAdd() {
		System.out.println("member_manager_insert 관리자등록");
		return "member/manager/member_manager_insert"; //관리자등록화면 
	}
	
	/*member_business_insert(사업자등록 폼)*/
	@RequestMapping(value="/member_business_insert", method = RequestMethod.GET)
	public String businessAdd() {
		System.out.println("member_business_insert 사업자등록폼");
		return "member/business/member_business_insert"; //사업자등록폼화면
	}
	
	/*member_business_update(사업자+관리자 수정폼)*/
	@RequestMapping(value="/businessUpdate", method = RequestMethod.POST)
	public String businessUpdate(Model model,
			@RequestParam(value="userId", required=true) String userId) {
		MemberDto businessDetail = memberDao.businessDetail(userId);
		model.addAttribute("businessDetail", businessDetail);
		return "member/business/member_business_update"; //사업자 관리자 수정폼
	}
	
	/*member_user_update(일반회원수정폼)*/
	@RequestMapping(value="/userUpdate", method = RequestMethod.POST)
	public String userUpdate(Model model,
			@RequestParam(value="userId", required=true) String userId) {
		System.out.println("member_user_detail 일반회원정보보기할때 받아온 아이디 == " + userId);
		MemberDto userDetail = memberDao.userDetail(userId);
		model.addAttribute("userDetail", userDetail);
			System.out.println("MemeberController 회원정보보기로 받아온 회원상세데이터들 model==" + model);
			
		List<MemberDto> userColor = memberDao.userColor(userId);	
		model.addAttribute("userColor", userColor);
		
		List<MemberDto> userStyle = memberDao.userStyle(userId);	
		model.addAttribute("userStyle", userStyle);
			System.out.println("MemeberController 회원정보보기로 받아온 회원의컬러와스타일 model==" + model);
			
		System.out.println("member_user_update 일반회원수정홈화면");
		return "member/user/member_user_update"; //일반회원가입폼화면
	}
	
	/*member_user_insert(일반회원가입폼)*/
	@RequestMapping(value="/member_user_insert", method = RequestMethod.GET)
	public String userAdd() {
		System.out.println("member_user_insert 일반회원가입홈화면");
		return "member/user/member_user_insert"; //일반회원가입폼화면
	}
	/*로그인화면폼*/
	@RequestMapping(value="/loginForm", method = RequestMethod.GET)
	public String login() {
		System.out.println("login 로그인화면");
		return "login/login"; //일반회원가입폼화면
	}
	
	/*홈으로*/
	/*@RequestMapping(value="/home", method = RequestMethod.GET)
	public String home() {
		System.out.println("login 로그인화면");
		return "home"; //홈으로
	}*/
		
}
