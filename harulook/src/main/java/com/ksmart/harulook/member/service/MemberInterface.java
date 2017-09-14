package com.ksmart.harulook.member.service;

import java.util.List;

public interface MemberInterface {

	/*비밀번호찾기 */
	String selectPwFind(MemberDto memberDto);

	/*아이디찾기 */
	String selectIdFind(MemberDto memberDto);

	/*삭제된회원리스트입력 */
	String insertDeleteUser(String id);

	/*회원삭제 */
	String deleteUserAdd(String id);

	/*회원탈퇴비밀번호체크 */
	String selectUserDeletePwCheck(String userId);

	/*로그인 */
	MemberDto selectlogin(String id);

	/*사업자회원정보보기 + 관리자 회원정보 */
	MemberDto selectBusinessDetail(String userId);

	/*일반회원 스타일 */
	List<String> selectUserStyle(String userId);

	/*일반회원 색상 */
	List<String> selectUserColor(String userId);

	/*일반회원정보보기 */
	MemberDto selectUserDetail(String userId);

	/*전체회원리스트 페이지 없이 */
	List<MemberDto> selectAllUserList(String level, String userId);

	/*회원게시물들의 카운트 매서드 */
	int selectBoardCount(String level);

	/*닉네임중복체크 */
	String selectUserNickCheck(String nickcheck);

	/*아이디중복체크 */
	String selectUserIdCheck(String idcheck);

	/*관리자가입입력 */
	int insertManager(MemberDto memberDto);

	/*사업자가입입력 */
	int insertBusiness(MemberDto memberDto);

	/*회원컬러배열입력 */
	int insertUserColor(String userColorInsert, String userColorNo, String userId);

	/*회원스타일배열입력 */
	int insertUserStyle(String userStyleInsert, String userStyleNo, String userId);

	/*회원컬러삭제 */
	int deleteUserColor(String userId);

	/*회원스타일삭제 */
	int deleteUserStyle(String userId);

	/*컬러검색 */
	String selectColor(String a);

	/*컬러검색 */
	String selectStyle(String a);

	/*관리자 사업자 정보수정 */
	int updateBusiness(MemberDto memberDto);

	/*일반회원정보수정 */
	int updateUser(MemberDto memberDto);

	/*회원가입입력 */
	int insertUser(MemberDto memberDto);

}