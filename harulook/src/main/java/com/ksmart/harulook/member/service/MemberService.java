package com.ksmart.harulook.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public class MemberService implements MemberServiceInterface {

	@Autowired private MemberInterface memberInterface;
	public String getPwFind(MemberDto memberDto) {
		return memberInterface.selectPwFind(memberDto);
	}

	@Override
	public String getIdFind(MemberDto memberDto) {
		return memberInterface.selectIdFind(memberDto);
	}

	@Override
	public String addremoveUser(String id) {
		return memberInterface.insertDeleteUser(id);
	}

	@Override
	public String removeUserAdd(String id) {
		return memberInterface.deleteUserAdd(id);
	}

	@Override
	public String getUserremovePwCheck(String userId) {
		return memberInterface.selectUserDeletePwCheck(userId);
	}

	@Override
	public MemberDto getlogin(String id) {
		return memberInterface.selectlogin(id);
	}

	@Override
	public MemberDto getBusinessDetail(String userId) {
		return memberInterface.selectBusinessDetail(userId);
	}

	@Override
	public List<String> getUserStyle(String userId) {
		return memberInterface.selectUserStyle(userId);
	}

	@Override
	public List<String> getUserColor(String userId) {
		return memberInterface.selectUserColor(userId);
	}

	@Override
	public MemberDto getUserDetail(String userId) {
		return memberInterface.selectUserDetail(userId);
	}

	@Override
	public List<MemberDto> getAllUserList(String level, String userId) {
		return memberInterface.selectAllUserList(level, userId);
	}

	@Override
	public int getBoardCount(String level) {
		return memberInterface.selectBoardCount(level);
	}

	@Override
	public String getUserNickCheck(String nickcheck) {
		return memberInterface.selectUserNickCheck(nickcheck);
	}

	@Override
	public String getUserIdCheck(String idcheck) {
		return memberInterface.selectUserIdCheck(idcheck);
	}

	@Override
	public int addManager(MemberDto memberDto) {
		return memberInterface.insertManager(memberDto);
	}

	@Override
	public int addBusiness(MemberDto memberDto) {
		return memberInterface.insertBusiness(memberDto);
	}

	@Override
	public int addUserColor(String userColorAdd, String userColorNo, String userId) {
		return memberInterface.insertUserColor(userColorAdd, userColorNo, userId);
	}

	@Override
	public int addUserStyle(String userStyleAdd, String userStyleNo, String userId) {
		return memberInterface.insertUserStyle(userStyleAdd, userStyleNo, userId);
	}

	@Override
	public int removeUserColor(String userId) {
		return memberInterface.deleteUserColor(userId);
	}

	@Override
	public int removeUserStyle(String userId) {
		return memberInterface.deleteUserStyle(userId);
	}

	@Override
	public String getColor(String a) {
		return memberInterface.selectColor(a);
	}

	@Override
	public String getStyle(String a) {
		return memberInterface.selectStyle(a);
	}

	@Override
	public int modifyBusiness(MemberDto memberDto) {
		return memberInterface.updateBusiness(memberDto);
	}

	@Override
	public int modifyUser(MemberDto memberDto) {
		return memberInterface.updateUser(memberDto);
	}

	@Override
	public int addUser(MemberDto memberDto) {
		return memberInterface.insertUser(memberDto);
	}

}
