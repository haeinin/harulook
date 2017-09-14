package com.ksmart.harulook.member.service;

import java.util.List;

public interface MemberServiceInterface {

	/*비밀번호찾기 */
	String getPwFind(MemberDto memberDto);

	/*아이디찾기 */
	String getIdFind(MemberDto memberDto);

	/*삭제된회원리스트입력 */
	String addremoveUser(String id);

	/*회원삭제 */
	String removeUserAdd(String id);

	/*회원탈퇴비밀번호체크 */
	String getUserremovePwCheck(String userId);

	/*로그인 */
	MemberDto getlogin(String id);

	/*사업자회원정보보기 + 관리자 회원정보 */
	MemberDto getBusinessDetail(String userId);

	/*일반회원 스타일 */
	List<String> getUserStyle(String userId);

	/*일반회원 색상 */
	List<String> getUserColor(String userId);

	/*일반회원정보보기 */
	MemberDto getUserDetail(String userId);

	/*전체회원리스트 페이지 없이 */
	List<MemberDto> getAllUserList(String level, String userId);

	/*회원게시물들의 카운트 매서드 */
	int getBoardCount(String level);

	/*닉네임중복체크 */
	String getUserNickCheck(String nickcheck);

	/*아이디중복체크 */
	String getUserIdCheck(String idcheck);

	/*관리자가입입력 */
	int addManager(MemberDto memberDto);

	/*사업자가입입력 */
	int addBusiness(MemberDto memberDto);

	/*회원컬러배열입력 */
	int addUserColor(String userColoradd, String userColorNo, String userId);

	/*회원스타일배열입력 */
	int addUserStyle(String userStyleadd, String userStyleNo, String userId);

	/*회원컬러삭제 */
	int removeUserColor(String userId);

	/*회원스타일삭제 */
	int removeUserStyle(String userId);

	/*컬러검색 */
	String getColor(String a);

	/*컬러검색 */
	String getStyle(String a);

	/*관리자 사업자 정보수정 */
	int modifyBusiness(MemberDto memberDto);

	/*일반회원정보수정 */
	int modifyUser(MemberDto memberDto);

	/*회원가입입력 */
	int addUser(MemberDto memberDto);	
}
