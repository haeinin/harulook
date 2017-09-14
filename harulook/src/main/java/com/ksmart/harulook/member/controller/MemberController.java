package com.ksmart.harulook.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ksmart.harulook.member.service.MemberDto;
import com.ksmart.harulook.member.service.MemberInterface;
import com.ksmart.harulook.point.service.PointInterface;
import com.ksmart.harulook.util.UtilFile;

@Controller
public class MemberController {
	
	@Autowired
    private MemberInterface memberDao;
	
	@Autowired
    private PointInterface pointDao;
	
	/*@Autowired
    private UtilFile utilFile;*/
	
	/*회원삭제처리후 탈퇴회원리스트에입력*/
	@RequestMapping(value="/userDeleteAdd", method = RequestMethod.POST)
	public String userDeleteAdd(Model model,
			@RequestParam(value="deleteid", required=true) String userId) {
		memberDao.deleteUserAdd(userId);	//회원삭제
		memberDao.insertDeleteUser(userId);	//삭제된회원리스트입력
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
		
		MemberDto loginCheck = memberDao.selectlogin(id);
			System.out.println("MemeberController 로그인시 체크되어 받은 아이디loginCheck== " + loginCheck);
		System.out.println("asdfasdfsadf = = == = = " + loginCheck.getUserPw());
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
					String attenCheckSelect = pointDao.selectAttenCheck(loginCheck.getUserId());	
						System.out.println("MemeberController 출석체크 중복검사== " + attenCheckSelect);
					int attenCheckSelectMonth = pointDao.selectAttenCheckMonth(loginCheck.getUserId());
						System.out.println("MemeberController 출석체크 한달== " + attenCheckSelectMonth);
					//맞춤추천을 위해 세션에 정보 저장	
					MemberDto userDetail = memberDao.selectUserDetail(id);
					List<String> userColor = memberDao.selectUserColor(id);
					List<String> userStyle = memberDao.selectUserStyle(id);	
					session.setAttribute("CcTall", userDetail.getUserTall());		//키
					session.setAttribute("CcSize", userDetail.getUserSize());		//체형
					session.setAttribute("CcGender", userDetail.getUserGender());	//성별
					session.setAttribute("CcAge", userDetail.getUserAge());			//나이
					session.setAttribute("CcuserColor", userColor);					//컬러
					session.setAttribute("CcuserStyle", userStyle);					//스타일
						
					if(attenCheckSelect == null){	//하루출석
						pointDao.insertAttenCheck(loginCheck.getUserId());	//출석체크 입력
						pointDao.insertPointGet(loginCheck.getUserId(), pointAttendDay);	//출석체크 포인트입력
					}else if(attenCheckSelectMonth > 29){	//30일출석
						pointDao.deleteAttenCheck(loginCheck.getUserId());	//한달출석 기존 출석내용 삭제	
						pointDao.insertPointGet(loginCheck.getUserId(), pointAttendMonth);	//한달출석 포인트 입력
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
	@RequestMapping(value="/memberManagerDetail", method = RequestMethod.GET)
	public String managerDetail(Model model,
			@RequestParam(value="userId", required=true) String userId) {
		System.out.println("member_user_detail 일반회원정보보기할때 받아온 아이디 == " + userId);
		MemberDto businessDetail = memberDao.selectBusinessDetail(userId);
		model.addAttribute("businessDetail", businessDetail);
			System.out.println("MemeberController 회원정보보기로 받아온 회원상세데이터들 model==" + model);
		return "member/manager/member_manager_detail"; //일반회원가입폼화면
	}
	
	/*사업자회원정보보기*/
	@RequestMapping(value="/memberBusinessDetail", method = RequestMethod.GET)
	public String businessDetail(Model model,
			@RequestParam(value="userId", required=true) String userId) {
		System.out.println("member_user_detail 일반회원정보보기할때 받아온 아이디 == " + userId);
		MemberDto businessDetail = memberDao.selectBusinessDetail(userId);
		model.addAttribute("businessDetail", businessDetail);
			System.out.println("MemeberController 회원정보보기로 받아온 회원상세데이터들 model==" + model);
		return "member/business/member_business_detail"; //일반회원가입폼화면
	}
	
	/*일반회원정보보기*/
	@RequestMapping(value="/memberUserDetail", method = RequestMethod.GET)
	public String userDetail(Model model,
			@RequestParam(value="userId", required=true) String userId) {
		System.out.println("member_user_detail 일반회원정보보기할때 받아온 아이디 == " + userId);
		MemberDto userDetail = memberDao.selectUserDetail(userId);
		model.addAttribute("userDetail", userDetail);
			System.out.println("MemeberController 회원정보보기로 받아온 회원상세데이터들 model==" + model);
			
		List<String> userColor = memberDao.selectUserColor(userId);	
		model.addAttribute("userColor", userColor);
		
		List<String> userStyle = memberDao.selectUserStyle(userId);	
		model.addAttribute("userStyle", userStyle);
			System.out.println("MemeberController 회원정보보기로 받아온 회원의컬러==" + userColor);
			System.out.println("MemeberController 회원정보보기로 받아온 회원의스타일==" + userStyle);
			System.out.println("MemeberController 회원정보보기로 받아온 회원의컬러와스타일 model==" + model);
				
		return "member/user/member_user_detail"; //일반회원가입폼화면
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
		
		int boardCount = memberDao.selectBoardCount(level);	// 일반회원 게시물 수
       
        List<MemberDto> list = memberDao.selectAllUserList(level, userId);

        model.addAttribute("boardCount", boardCount);
        model.addAttribute("list", list);
        	System.out.println("MemeberController 셀렉트해서 받아온 일반 회원 리스트 model값 == "+model);
        return "member/user/member_user_list2";  //아이디중복체크후 화면 그대로
    }
	
	
	
	
	
	/*관리자등록액션*/
	@RequestMapping(value="/managerAdd", method = RequestMethod.POST)
	public String managerAdd(MemberDto memberDto) {
        System.out.println("MemberController 회원가입시 받아오는 데이터" + memberDto);
        memberDao.insertManager(memberDto);	//일반회원가입 기타 입력데이터
        return "redirect:/home";  //회원가입후 홈화면으로
    }
	
	/*사업자등록액션*/
	@RequestMapping(value="/businessAdd", method = RequestMethod.POST)
	public String businessAdd(MemberDto memberDto) {
        System.out.println("MemberController 회원가입시 받아오는 데이터" + memberDto);
        memberDao.insertBusiness(memberDto);	//일반회원가입 기타 입력데이터
        return "redirect:/home";  //회원가입후 홈화면으로
    }
	
	/*관리자 광고주 정보 수정*/
	@RequestMapping(value="/addBusinessUpdate", method = RequestMethod.POST)
	public String businessUpdateAdd(MemberDto memberDto,
			HttpServletRequest request) {
        System.out.println("MemberController 회원정보수정하기" + memberDto);
        memberDao.updateBusiness(memberDto);	// 관리자 광주고 입력데이터
       
        return "redirect:/home";  //회원가입후 홈화면으로
    }
	
	/*일반회원정보수정*/
	@RequestMapping(value="/addUserUpdate", method = RequestMethod.POST)
	public String userUpdateAdd(MemberDto memberDto,
			HttpServletRequest request,
			HttpSession session,
			@RequestParam("userImgFile") MultipartFile userImg,
			MultipartHttpServletRequest multipartRequest) {
        System.out.println("MemberController 회원정보수정하기" + memberDto);
        
    	if(!(userImg.getOriginalFilename()).equals("")){	// 이미지 수정했나 구분
	        System.out.println("MemberController 이미지 수정 했을때");
	        UtilFile utilFile = new UtilFile();
			String userImgFile = utilFile.fileUpload(multipartRequest, userImg);	//이미지파일이름으로 주소받아오기
	        System.out.println("MemberController 이미지파일업로드 : " + userImgFile);
	    	memberDto.setUserImg(userImgFile);	//이미지파일 주소 입력
    	}
    	System.out.println("MemberController 이미지 수정하지 않았을때");
        memberDao.updateUser(memberDto);	//일반회원가입 기타 입력데이터
        //유저컬러와 스타일 내용 삭제
        memberDao.deleteUserColor(memberDto.getUserId());
        memberDao.deleteUserStyle(memberDto.getUserId());
        
        if(memberDto.getColorValue() != null){	//체크박스에 값이 있을때만 실행
	        //체크박스 컬러 배열로 받음
	        String[] colorValue = request.getParameterValues("colorValue");
	        for( int i = 0; i < colorValue.length; i++ ){	//컬러 체크 리스트 갯수만큼 for문 실행
	        	
	        	String lastColorNo = memberDao.selectColor(colorValue[i]);	//for문 갯수만큼 마지막 no찾아오기
	        	int insertColorNo = 1;    //DB에 등록된 게시물이 없을 때 번호의 초기값
	        	if(lastColorNo != null) {
	        		insertColorNo = Integer.parseInt(lastColorNo)+1;	//마지막no +1
	    		}
	        	memberDao.insertUserColor("user_color_"+insertColorNo, colorValue[i], memberDto.getUserId());
	        	System.out.println(colorValue[i] + " == 컬러배열");
	        }
        }
        
        if(memberDto.getStyleValue() != null){	//체크박스에 값이 있을때만 실행
	        //체크박스 스타일 배열로 받음
	        String[] styleValue = request.getParameterValues("styleValue");
	        for( int i = 0; i < styleValue.length; i++ ){
	        	
	        	String lastStyleNo = memberDao.selectStyle(styleValue[i]);	//for문 갯수만큼 마지막 no찾아오기
	        	int insertStyleNo = 1;    //DB에 등록된 게시물이 없을 때 번호의 초기값
	        	if(lastStyleNo != null) {
	        		insertStyleNo = Integer.parseInt(lastStyleNo)+1;	//마지막no +1
	    		}
	        	memberDao.insertUserStyle("user_style_"+insertStyleNo, styleValue[i], memberDto.getUserId());
	        	System.out.println(styleValue[i] + " == 스타일배열");
	        }
        }
        
        MemberDto userDetail = memberDao.selectUserDetail(memberDto.getUserId());
		List<String> userColor = memberDao.selectUserColor(memberDto.getUserId());
		List<String> userStyle = memberDao.selectUserStyle(memberDto.getUserId());	
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
			HttpServletRequest request,
			@RequestParam("userImgFile") MultipartFile userImg,
			MultipartHttpServletRequest multipartRequest) {
		System.out.println("일반회원가입 처리 요청");
		System.out.println("MemberController 회원가입시 받아오는 데이터" + memberDto);
		
		UtilFile utilFile = new UtilFile();
		String userImgFile = utilFile.fileUpload(multipartRequest, userImg);	//이미지파일이름으로 주소받아오기
        System.out.println("MemberController 이미지파일업로드 : " + userImgFile);
    	memberDto.setUserImg(userImgFile);	//이미지파일 주소 입력
        
    	memberDao.insertUser(memberDto);	//일반회원가입 기타 입력데이터
        
    	if(memberDto.getColorValue() != null){	//체크박스에 값이 있을때만 실행
	        //체크박스 컬러 배열로 받음
	        String[] colorValue = request.getParameterValues("colorValue");
	        for( int i = 0; i < colorValue.length; i++ ){	//컬러 체크 리스트 갯수만큼 for문 실행
	        	
	        	String lastColorNo = memberDao.selectColor(colorValue[i]);	//for문 갯수만큼 마지막 no찾아오기
	        	int insertColorNo = 1;    //DB에 등록된 게시물이 없을 때 번호의 초기값
	        	if(lastColorNo != null) {
	        		insertColorNo = Integer.parseInt(lastColorNo)+1;	//마지막no +1
	    		}
	        	memberDao.insertUserColor("user_color_"+insertColorNo, colorValue[i], memberDto.getUserId());
	        	System.out.println(colorValue[i] + " == 컬러배열");
	        }
        }
        
        if(memberDto.getStyleValue() != null){	//체크박스에 값이 있을때만 실행
	        //체크박스 스타일 배열로 받음
	        String[] styleValue = request.getParameterValues("styleValue");
	        for( int i = 0; i < styleValue.length; i++ ){
	        	
	        	String lastStyleNo = memberDao.selectStyle(styleValue[i]);	//for문 갯수만큼 마지막 no찾아오기
	        	int insertStyleNo = 1;    //DB에 등록된 게시물이 없을 때 번호의 초기값
	        	if(lastStyleNo != null) {
	        		insertStyleNo = Integer.parseInt(lastStyleNo)+1;	//마지막no +1
	    		}
	        	memberDao.insertUserStyle("user_style_"+insertStyleNo, styleValue[i], memberDto.getUserId());
	        	System.out.println(styleValue[i] + " == 스타일배열");
	        }
        }    
	        return "redirect:/home";  //회원가입후 홈화면으로
    }
	
	/*member_manager_insert(관리자등록 폼)*/
	@RequestMapping(value="/memberManagerInsert", method = RequestMethod.GET)
	public String managerAdd() {
		System.out.println("member_manager_insert 관리자등록");
		return "member/manager/member_manager_insert"; //관리자등록화면 
	}
	
	/*member_business_insert(사업자등록 폼)*/
	@RequestMapping(value="/memberBusinessInsert", method = RequestMethod.GET)
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
		MemberDto businessDetail = memberDao.selectBusinessDetail(userId);
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
		
		MemberDto userDetail = memberDao.selectUserDetail(userId);
		model.addAttribute("userDetail", userDetail);
			System.out.println("MemeberController 일반회원수정폼 받아온 회원상세데이터들 model==" + model);
			
		List<String> userColor = memberDao.selectUserColor(userId);	
		model.addAttribute("userColor", userColor);
		
		List<String> userStyle = memberDao.selectUserStyle(userId);	
		model.addAttribute("userStyle", userStyle);
			System.out.println("MemeberController 일반회원수정폼 받아온 회원의컬러와스타일 model==" + model);
			System.out.println("member_user_update 일반회원수정홈화면");
		return "member/user/member_user_update"; //일반회원가입폼화면
	}
	
	/*member_user_insert(일반회원가입폼)*/
	@RequestMapping(value="/memberUserInsert", method = RequestMethod.GET)
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
