package com.ksmart.harulook.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public class MemberService implements MemberServiceInterface {

	@Autowired private MemberInterface memberInterface;
	public String getPwFind(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return memberInterface.selectPwFind(memberDto);
	}

	@Override
	public String getIdFind(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return memberInterface.selectIdFind(memberDto);
	}

	@Override
	public String addremoveUser(String id) {
		// TODO Auto-generated method stub
		return memberInterface.insertDeleteUser(id);
	}

	@Override
	public String removeUserAdd(String id) {
		// TODO Auto-generated method stub
		return memberInterface.deleteUserAdd(id);
	}

	@Override
	public String getUserremovePwCheck(String userId) {
		// TODO Auto-generated method stub
		return memberInterface.selectUserDeletePwCheck(userId);
	}

	@Override
	public MemberDto getlogin(String id) {
		// TODO Auto-generated method stub
		return memberInterface.selectlogin(id);
	}

	@Override
	public MemberDto getBusinessDetail(String userId) {
		// TODO Auto-generated method stub
		return memberInterface.selectBusinessDetail(userId);
	}

	@Override
	public List<String> getUserStyle(String userId) {
		// TODO Auto-generated method stub
		return memberInterface.selectUserStyle(userId);
	}

	@Override
	public List<String> getUserColor(String userId) {
		// TODO Auto-generated method stub
		return memberInterface.selectUserColor(userId);
	}

	@Override
	public MemberDto getUserDetail(String userId) {
		// TODO Auto-generated method stub
		return memberInterface.selectUserDetail(userId);
	}

	@Override
	public List<MemberDto> getAllUserList(String level, String userId) {
		// TODO Auto-generated method stub
		return memberInterface.selectAllUserList(level, userId);
	}

	@Override
	public int getBoardCount(String level) {
		// TODO Auto-generated method stub
		return memberInterface.selectBoardCount(level);
	}

	@Override
	public String getUserNickCheck(String nickcheck) {
		// TODO Auto-generated method stub
		return memberInterface.selectUserNickCheck(nickcheck);
	}

	@Override
	public String getUserIdCheck(String idcheck) {
		// TODO Auto-generated method stub
		return memberInterface.selectUserIdCheck(idcheck);
	}

	@Override
	public int addManager(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return memberInterface.insertManager(memberDto);
	}

	@Override
	public int addBusiness(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return memberInterface.insertBusiness(memberDto);
	}

	@Override
	public int addUserColor(String userColorAdd, String userColorNo, String userId) {
		// TODO Auto-generated method stub
		return memberInterface.insertUserColor(userColorAdd, userColorNo, userId);
	}

	@Override
	public int addUserStyle(String userStyleAdd, String userStyleNo, String userId) {
		// TODO Auto-generated method stub
		return memberInterface.insertUserStyle(userStyleAdd, userStyleNo, userId);
	}

	@Override
	public int removeUserColor(String userId) {
		// TODO Auto-generated method stub
		return memberInterface.deleteUserColor(userId);
	}

	@Override
	public int removeUserStyle(String userId) {
		// TODO Auto-generated method stub
		return memberInterface.deleteUserStyle(userId);
	}

	@Override
	public String getColor(String a) {
		// TODO Auto-generated method stub
		return memberInterface.selectColor(a);
	}

	@Override
	public String getStyle(String a) {
		// TODO Auto-generated method stub
		return memberInterface.selectStyle(a);
	}

	@Override
	public int modifyBusiness(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return memberInterface.updateBusiness(memberDto);
	}

	@Override
	public int modifyUser(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return memberInterface.updateUser(memberDto);
	}

	@Override
	public int addUser(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return memberInterface.insertUser(memberDto);
	}

}
