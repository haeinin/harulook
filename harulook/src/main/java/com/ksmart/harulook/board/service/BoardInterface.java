package com.ksmart.harulook.board.service;

import java.util.List;

public interface BoardInterface {

	/* sns게시물 카운트 검색 */
	int selectBoardSearchListCount(BoardDto board);

	/* 포인트등록 게시물 검색  */
	int selectBoardPointCheck(String userId);

	/* sns게시물 상황별 분류 조회 */
	List<String> selectBoardSituation(String snsBoardNo);

	/* sns게시물 색상 조회 */
	List<String> selectBoardColor(String snsBoardNo);

	/* sns게시물 스타일 조회 */
	List<String> selectBoardStyle(String snsBoardNo);

	/* sns게시물 검색 */
	List<BoardDto> selectBoardSearchList(BoardDto board, int currentPage, int pagePerRow, int popularity);

	/* sns게시물 상황별 분류삭제 */
	int deleteSnsSituation(String boardNo);

	/* sns게시물 스타일 삭제 */
	int deleteSnsStyle(String boardNo);

	/* sns게시물 색상 삭제 */
	int deleteSnsColor(String boardNo);

	/* sns게시물 삭제 */
	int deleteBoard(String boardNo);

	/* sns게시물 정보 수정 */
	int updatBboard(BoardDto board);

	/* sns게시물 상세 보기 */
	BoardDto selectBoardDetail(String boardNo);

	/* sns게시물 수 조회 */
	int selectBoardCount();

	/* sns게시물 목록 조회 메서드 */
	List<BoardDto> selectBoardList(int currentPage, int pagePerRow);

	/* sns게시물 상황별 분류 입력 처리 메서드 */
	int insertSnsSituation(String snsSituationNo, String snsBoardNo, String situationNo);

	/* sns게시물 스타일 입력 처리 메서드 */
	int insertSnsStyle(String snsStyleNo, String snsBoardNo, String styleNo);

	/* sns게시물 색상 입력 처리 메서드 */
	int insertSnsColor(String snsColorNo, String snsBoardNo, String colorNo);

	/* sns게시물 입력 처리 메서드 */
	int insertBoard(BoardDto board);

	/* 가장 최근에 입력된 게시물 상황별 분류 번호 */
	String selectLastSituationNo();

	/* 가장 최근에 입력된 게시물 스타일 번호 */
	String selectLastStyleNo();

	/* 가장 최근에 입력된 게시물 색상 번호 */
	String selectLastColorNo();

	/* 가장 최근에 등록된 게시물번호 */
	String selectLastBoardNo();

	List<BoardDto> selectBoardPopularityList(int currentPage, int pagePerRow);

}