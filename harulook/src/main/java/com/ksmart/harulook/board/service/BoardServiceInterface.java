package com.ksmart.harulook.board.service;

import java.util.List;

public interface BoardServiceInterface {

	/* sns게시물 카운트 검색 */
	int getBoardSearchListCount(BoardDto board);

	/* 포인트등록 게시물 검색  */
	int getBoardPointCheck(String userId);

	/* sns게시물 상황별 분류 조회 */
	List<String> getBoardSituation(String snsBoardNo);

	/* sns게시물 색상 조회 */
	List<String> getBoardColor(String snsBoardNo);

	/* sns게시물 스타일 조회 */
	List<String> getBoardStyle(String snsBoardNo);

	/* sns게시물 검색 */
	List<BoardDto> getBoardSearchList(BoardDto board, int currentPage, int pagePerRow, int popularity);

	/* sns게시물 상황별 분류삭제 */
	int removeSnsSituation(String boardNo);

	/* sns게시물 스타일 삭제 */
	int removeSnsStyle(String boardNo);

	/* sns게시물 색상 삭제 */
	int removeSnsColor(String boardNo);

	/* sns게시물 삭제 */
	int removeBoard(String boardNo);

	/* sns게시물 정보 수정 */
	int modifyBboard(BoardDto board);

	/* sns게시물 상세 보기 */
	BoardDto getBoardDetail(String boardNo);

	/* sns게시물 수 조회 */
	int getBoardCount();

	/* sns게시물 목록 조회 메서드 */
	List<BoardDto> getBoardList(int currentPage, int pagePerRow);

	/* sns게시물 상황별 분류 입력 처리 메서드 */
	int addSnsSituation(String snsSituationNo, String snsBoardNo, String situationNo);

	/* sns게시물 스타일 입력 처리 메서드 */
	int addSnsStyle(String snsStyleNo, String snsBoardNo, String styleNo);

	/* sns게시물 색상 입력 처리 메서드 */
	int addSnsColor(String snsColorNo, String snsBoardNo, String colorNo);

	/* sns게시물 입력 처리 메서드 */
	int addBoard(BoardDto board);

	/* 가장 최근에 입력된 게시물 상황별 분류 번호 */
	String getLastSituationNo();

	/* 가장 최근에 입력된 게시물 스타일 번호 */
	String getLastStyleNo();

	/* 가장 최근에 입력된 게시물 색상 번호 */
	String getLastColorNo();

	/* 가장 최근에 등록된 게시물번호 */
	String getLastBoardNo();

	List<BoardDto> getBoardPopularityList(int currentPage, int pagePerRow);
}
