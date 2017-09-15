package com.ksmart.harulook.adboard.service;

import java.util.List;

public interface AdBoardInterface {

	/*게시물 목록 요청 메서드*/
	List<AdBoardDto> selectAdBoard();

	/*광고 상품번호에서 가장 높은 번호 요청 메서드*/
	String selectGoodsNo();

	/*광고 게시물번호에서 가장 높은 번호 요청 메서드*/
	String selectBoardNo();

	/*광고 게시물 입력 메서드*/
	int insertAdBoard(AdBoardDto adBoard);

	/*광고 계약 번호에 해당하는 광고 게시물 입력 메서드*/
	List<AdBoardDto> selectAdBoardByContractId(String adContractNo);

	/*광고 게심루 삭제 메서드*/
	int deleteAdBoard(String adBoardNo);

	/*메인화면에서 광고 게시물 상세 보기 메서드*/
	AdBoardDto selectBoardDetail(String adBoardNo);

	/*광고위치가 1이고 광고 게시물중에 온도가 현재 온도에 해당하는 광고 게시물의 갯수 요청 메서드*/
	String selectPlace1TempCount(String temp);

	/*광고위치가 2이고 광고 게시물중에 온도가 현재 온도에 해당하는 광고 게시물의 갯수 요청 메서드*/
	String selectPlace2TempCount(String temp);

	/*광고위치가 3이고 광고 게시물중에 온도가 현재 온도에 해당하는 광고 게시물의 갯수 요청 메서드*/
	String selectPlace3TempCount(String temp);

	/*광고 위치가 1이고 현재 온도에 해당하는 광고 게시물의 갯수가 0일때 광고 게시물을 조회 하는 메서드*/
	AdBoardDto selectBoardPlace1WhenCount0();

	/*광고 위치가 1이고 현재 온도에 해당하는 광고 게시물의 갯수가 1일때 광고 게시물을 조회 하는 메서드*/
	AdBoardDto selectBoardPlace1WhenCount1(String temp);

	/*광고 위치가 1이고 현재 온도에 해당하는 광고 게시물의 갯수가 2일때 광고 게시물을 조회 하는 메서드*/
	AdBoardDto selectBoardPlace1WhenCount2();

	/*광고 위치가 2이고 현재 온도에 해당하는 광고 게시물의 갯수가 0일때 광고 게시물을 조회 하는 메서드*/
	AdBoardDto selectBoardPlace2WhenCount0();

	/*광고 위치가 2이고 현재 온도에 해당하는 광고 게시물의 갯수가 1일때 광고 게시물을 조회 하는 메서드*/
	AdBoardDto selectBoardPlace2WhenCount1(String temp);

	/*광고 위치가 2이고 현재 온도에 해당하는 광고 게시물의 갯수가 2일때 광고 게시물을 조회 하는 메서드*/
	AdBoardDto selectBoardPlace2WhenCount2();

	/*광고 위치가 3이고 현재 온도에 해당하는 광고 게시물의 갯수가 0일때 광고 게시물을 조회 하는 메서드*/
	AdBoardDto selectBoardPlace3WhenCount0();

	/*광고 위치가 3이고 현재 온도에 해당하는 광고 게시물의 갯수가 1일때 광고 게시물을 조회 하는 메서드*/
	AdBoardDto selectBoardPlace3WhenCount1(String temp);

	/*광고 위치가 3이고 현재 온도에 해당하는 광고 게시물의 갯수가 2일때 광고 게시물을 조회 하는 메서드*/
	AdBoardDto selectBoardPlace3WhenCount2();

}