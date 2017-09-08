package com.ksmart.harulook.member.controller;

import java.io.IOException;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ksmart.harulook.member.service.MemberDao;
import com.ksmart.harulook.member.service.MemberDto;
import com.ksmart.harulook.point.service.PointDao;

@Controller
public class MemberController {
	
	@Autowired
    private MemberDao memberDao;
	
	@Autowired
    private PointDao pointDao;
	
	
	
	/*회원삭제처리후 탈퇴회원리스트에입력*/
	@RequestMapping(value="/userDeleteAdd", method = RequestMethod.POST)
	public String userDeleteAdd(Model model,
			@RequestParam(value="deleteid", required=true) String userId) {
		memberDao.userDeleteAdd(userId);	//회원삭제
		memberDao.deleteUserInsert(userId);	//삭제된회원리스트입력
		System.out.println("MemberController 회원탈퇴시 user목록삭제후 delete_user 입력");
		return "home"; //사업자 관리자 수정폼
	}
	

	
	
	/*로그아웃*/
	@RequestMapping(value="/logout", method = RequestMethod.POST)
	public String logout(HttpSession session) {
		System.out.println("MemberControll 로그아웃 aaaaaaa");
		session.invalidate();	//로그인되어있는 세션을 삭제시키고 로그아웃
		return "redirect:/home"; //홈화면
	}
	
	/*로그인*/
	@RequestMapping(value="/loginAdd", produces = "application/text; charset=utf8", method = RequestMethod.POST)
	public String login(Model model,
			HttpSession session,
			@RequestParam(value="userId", required=true) String id,
			@RequestParam(value="userPw", required=true) String pw) {
		System.out.println("MemberController 로그인시 == " + id);
		
		MemberDto loginCheck = memberDao.login(id);
			System.out.println("MemeberController 로그인시 체크되어 받은 아이디loginCheck== " + loginCheck);
		
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
				
				if(loginCheck.getUserLevel().equals("일반회원")){
					String pointAttendDay = "point_ex_3";
					String pointAttendMonth = "point_ex_2";
					//일반회원일경우에만
					String attenCheckSelect = pointDao.attenCheckSelect(loginCheck.getUserId());	
						System.out.println("MemeberController 출석체크 중복검사== " + attenCheckSelect);
					int attenCheckSelectMonth = pointDao.attenCheckSelectMonth(loginCheck.getUserId());
						System.out.println("MemeberController 출석체크 한달== " + attenCheckSelectMonth);
					//맞춤추천을 위해 세션에 정보 저장	
					MemberDto userDetail = memberDao.userDetail(id);
					List<String> userColor = memberDao.userColor(id);
					List<String> userStyle = memberDao.userStyle(id);	
					session.setAttribute("CcTall", userDetail.getUserTall());		//키
					session.setAttribute("CcSize", userDetail.getUserSize());		//체형
					session.setAttribute("CcGender", userDetail.getUserGender());	//성별
					session.setAttribute("CcAge", userDetail.getUserAge());			//나이
					session.setAttribute("CcuserColor", userColor);					//컬러
					session.setAttribute("CcuserStyle", userStyle);					//스타일
						
					if(attenCheckSelect == null){	//하루출석
						pointDao.attenCheckInsert(loginCheck.getUserId());	//출석체크 입력
						pointDao.pointGetInsert(loginCheck.getUserId(), pointAttendDay);	//출석체크 포인트입력
					}else if(attenCheckSelectMonth > 29){	//30일출석
						pointDao.attenCheckDelete(loginCheck.getUserId());	//한달출석 기존 출석내용 삭제	
						pointDao.pointGetInsert(loginCheck.getUserId(), pointAttendMonth);	//한달출석 포인트 입력
					}
				}
				return "redirect:/home";
			}else{
				System.out.println("비번틀림");
				model.addAttribute("loginCheck", "비번틀림");
				return "login/login";
			}
		}
		return "login/login"; //로그인화면
	}
	
	/*관리자회원정보*/
	@RequestMapping(value="/member_manager_detail", method = RequestMethod.GET)
	public String managerDetail(Model model,
			@RequestParam(value="userId", required=true) String userId) {
			System.out.println("member_user_detail 일반회원정보보기할때 받아온 아이디 == " + userId);
			MemberDto businessDetail = memberDao.businessDetail(userId);
			model.addAttribute("businessDetail", businessDetail);
				System.out.println("MemeberController 회원정보보기로 받아온 회원상세데이터들 model==" + model);
		return "member/manager/member_manager_detail"; //일반회원가입폼화면
	}
	
	/*사업자회원정보보기*/
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
				
			List<String> userColor = memberDao.userColor(userId);	
			model.addAttribute("userColor", userColor);
			
			List<String> userStyle = memberDao.userStyle(userId);	
			model.addAttribute("userStyle", userStyle);
				System.out.println("MemeberController 회원정보보기로 받아온 회원의컬러==" + userColor);
				System.out.println("MemeberController 회원정보보기로 받아온 회원의스타일==" + userStyle);
				System.out.println("MemeberController 회원정보보기로 받아온 회원의컬러와스타일 model==" + model);
				
		return "member/user/member_user_detail"; //일반회원가입폼화면
	}
	
	
	/*전체회원리스트(기존)*/
	@RequestMapping(value={"member_user_list"}, produces = "application/text; charset=utf8", method = {RequestMethod.GET, RequestMethod.POST})
    public String userList(Model model,
    		 HttpSession session,
    		 @RequestParam(value="userId", required=false) String userId,
    		 @RequestParam(value="level", required=false) String levelList,	//권한을 null로도 받을수 있게 false
             @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		System.out.println(userId + " == 검색 아이디");
		
		if(userId == ""){	//검색 아이디가 공백일 경우 null로 바꾸어 전체 리스트 나열
			userId = null;
		}
		System.out.println(levelList + " == 권한별로 리스트");
		if(levelList != null){	//관리자가 회원리스트 버튼으로 접속할때 권한을 세션에 세팅하기위함  *리스트 다음 이전버튼클릭시 권한이 null로 세팅되는걸 막기 위함
			session.setAttribute("searchLevel", levelList);
		}
		String level = (String) session.getAttribute("searchLevel");
		System.out.println(level + " ==  세션 권한별로 리스트");
		
		int boardCount = memberDao.getBoardCount(level);	// 일반회원 게시물 수
        int pagePerRow = 10;	// 한페이지에 보여줄 갯수 10개
        int lastPage = (int)(Math.ceil(boardCount / pagePerRow)+1);	//총 게시물 숫자에 한페이지당 게시물 숫자 나눈값이 총 페이지 숫자
        List<MemberDto> list = memberDao.userList(currentPage, pagePerRow, level, userId);
		model.addAttribute("currentPage", currentPage);
        model.addAttribute("boardCount", boardCount);
        model.addAttribute("lastPage", lastPage);
        
        model.addAttribute("list", list);
        	System.out.println("MemeberController 셀렉트해서 받아온 일반 회원 리스트 model값 == "+model);
        return "member/user/member_user_list";  //아이디중복체크후 화면 그대로
    }
	
	/*전체회원리스트*/
	@RequestMapping(value={"allUserList"}, produces = "application/text; charset=utf8", method = {RequestMethod.GET, RequestMethod.POST})
    public String allUserList(Model model,
    		 HttpSession session,
    		 @RequestParam(value="userId", required=false) String userId,
    		 @RequestParam(value="level", required=false) String levelList	//권한을 null로도 받을수 있게 false
    		 ){
		System.out.println(userId + " == 검색 아이디");
		
		if(userId == ""){	//검색 아이디가 공백일 경우 null로 바꾸어 전체 리스트 나열
			userId = null;
		}
		System.out.println(levelList + " == 권한별로 리스트");
		if(levelList != null){	//관리자가 회원리스트 버튼으로 접속할때 권한을 세션에 세팅하기위함  *리스트 다음 이전버튼클릭시 권한이 null로 세팅되는걸 막기 위함
			session.setAttribute("searchLevel", levelList);
		}
		String level = (String) session.getAttribute("searchLevel");
		System.out.println(level + " ==  세션 권한별로 리스트");
		
		int boardCount = memberDao.getBoardCount(level);	// 일반회원 게시물 수
       
        List<MemberDto> list = memberDao.allUserList(level, userId);

        model.addAttribute("boardCount", boardCount);
        model.addAttribute("list", list);
        	System.out.println("MemeberController 셀렉트해서 받아온 일반 회원 리스트 model값 == "+model);
        return "member/user/member_user_list2";  //아이디중복체크후 화면 그대로
    }
	
	
	
	
	
	/*관리자등록액션*/
	@RequestMapping(value="/managerAdd", method = RequestMethod.POST)
	public String managerAdd(MemberDto memberDto) {
        System.out.println("MemberController 회원가입시 받아오는 데이터" + memberDto);
        memberDao.managerInsert(memberDto);	//일반회원가입 기타 입력데이터
        return "redirect:/home";  //회원가입후 홈화면으로
    }
	
	/*사업자등록액션*/
	@RequestMapping(value="/businessAdd", method = RequestMethod.POST)
	public String businessAdd(MemberDto memberDto) {
        System.out.println("MemberController 회원가입시 받아오는 데이터" + memberDto);
        memberDao.businessInsert(memberDto);	//일반회원가입 기타 입력데이터
        return "redirect:/home";  //회원가입후 홈화면으로
    }
	
	/*관리자 광고주 정보 수정*/
	@RequestMapping(value="/addBusinessUpdate", method = RequestMethod.POST)
	public String businessUpdateAdd(MemberDto memberDto,
			HttpServletRequest request) {
        System.out.println("MemberController 회원정보수정하기" + memberDto);
        memberDao.businessUpdate(memberDto);	// 관리자 광주고 입력데이터
       
        return "redirect:/home";  //회원가입후 홈화면으로
    }
	
	/*일반회원정보수정*/
	@RequestMapping(value="/addUserUpdate", method = RequestMethod.POST)
	public String userUpdateAdd(MemberDto memberDto,
			HttpServletRequest request,
			HttpSession session) {
        System.out.println("MemberController 회원정보수정하기" + memberDto);
        memberDao.userUpdate(memberDto);	//일반회원가입 기타 입력데이터
        //유저컬러와 스타일 내용 삭제
        memberDao.userColorDelete(memberDto.getUserId());
        memberDao.userStyleDelete(memberDto.getUserId());
        
        	System.out.println(memberDto.getColorValue() + " == sadlkjfaslkdfjlaskdfjlsakfjlksadfjlkasjflksajdflkasjflksajkfd");
        
        if(memberDto.getColorValue() != null){	//체크박스에 값이 있을때만 실행
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
        }
        
        if(memberDto.getStyleValue() != null){	//체크박스에 값이 있을때만 실행
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
        }
        
        MemberDto userDetail = memberDao.userDetail(memberDto.getUserId());
		List<String> userColor = memberDao.userColor(memberDto.getUserId());
		List<String> userStyle = memberDao.userStyle(memberDto.getUserId());	
		session.setAttribute("CcTall", userDetail.getUserTall());		//키
		session.setAttribute("CcSize", userDetail.getUserSize());		//체형
		session.setAttribute("CcGender", userDetail.getUserGender());	//성별
		session.setAttribute("CcAge", userDetail.getUserAge());			//나이
		session.setAttribute("CcuserColor", userColor);					//컬러
		session.setAttribute("CcuserStyle", userStyle);					//스타일
		
        return "redirect:/home";  //회원정보수정 홈화면으로
    }
	
	/*일반회원가입액션*/
	@RequestMapping(value="/userAdd", method = RequestMethod.POST)
	public String userAdd(MemberDto memberDto,
			HttpServletRequest request) {
        System.out.println("MemberController 회원가입시 받아오는 데이터" + memberDto);
        memberDao.userInsert(memberDto);	//일반회원가입 기타 입력데이터
       
        if(memberDto.getColorValue() != null){	//체크박스에 값이 있을때만 실행
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
        }
        
        if(memberDto.getStyleValue() != null){	//체크박스에 값이 있을때만 실행
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
        }    
	        return "redirect:/home";  //회원가입후 홈화면으로
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
			HttpSession session,
			@RequestParam(value="userId", required=true) String userId) {
		System.out.println("MemeberController 관리자 사업자수정폼 받아온 아이디 == " + userId);
		if(userId == "") {	//비밀번호찾기에서 회원수정으로 넘어올때 세션에 있는 아이디를 넣기 위한 if문
			String sessionId = (String) session.getAttribute("id");
			userId = sessionId;
		}
		MemberDto businessDetail = memberDao.businessDetail(userId);
		model.addAttribute("businessDetail", businessDetail);
			System.out.println(businessDetail + " == 1280937120398109238102938109381209381093810923089");
		return "member/business/member_business_update"; //사업자 관리자 수정폼
	}
	
	
	/*member_user_update(일반회원수정폼)*/
	@RequestMapping(value="/userUpdate", method = RequestMethod.POST)
	public String userUpdate(Model model,
			HttpSession session,
			@RequestParam(value="userId", required=true) String userId) {
		System.out.println("MemeberController 일반회원수정폼 받아온 아이디 == " + userId);
		if(userId == "") {	//비밀번호찾기에서 회원수정으로 넘어올때 세션에 있는 아이디를 넣기 위한 if문
			String sessionId = (String) session.getAttribute("id");
			userId = sessionId;
		}
		
		MemberDto userDetail = memberDao.userDetail(userId);
		model.addAttribute("userDetail", userDetail);
			System.out.println("MemeberController 일반회원수정폼 받아온 회원상세데이터들 model==" + model);
			
		List<String> userColor = memberDao.userColor(userId);	
		model.addAttribute("userColor", userColor);
		
		List<String> userStyle = memberDao.userStyle(userId);	
		model.addAttribute("userStyle", userStyle);
			System.out.println("MemeberController 일반회원수정폼 받아온 회원의컬러와스타일 model==" + model);
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
