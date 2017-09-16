package com.ksmart.harulook.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public class BoardService implements BoardServiceInterface {

	@Autowired private BoardInterface boardInterface;
	@Override
	public int getBoardSearchListCount(BoardDto board) {
		return boardInterface.selectBoardCount();
	}

	@Override
	public int getBoardPointCheck(String userId) {
		return boardInterface.selectBoardPointCheck(userId);
	}

	@Override
	public List<String> getBoardSituation(String snsBoardNo) {
		return boardInterface.selectBoardSituation(snsBoardNo);
	}

	@Override
	public List<String> getBoardColor(String snsBoardNo) {
		return boardInterface.selectBoardColor(snsBoardNo);
	}

	@Override
	public List<String> getBoardStyle(String snsBoardNo) {
		return boardInterface.selectBoardStyle(snsBoardNo);
	}

	@Override
	public List<BoardDto> getBoardSearchList(BoardDto board, int currentPage, int pagePerRow, int popularity) {
		return boardInterface.selectBoardSearchList(board, currentPage, pagePerRow, popularity);
	}

	@Override
	public int removeSnsSituation(String boardNo) {
		return boardInterface.deleteSnsSituation(boardNo);
	}

	@Override
	public int removeSnsStyle(String boardNo) {
		return boardInterface.deleteSnsStyle(boardNo);
	}

	@Override
	public int removeSnsColor(String boardNo) {
		return boardInterface.deleteSnsColor(boardNo);
	}

	@Override
	public int removeBoard(String boardNo) {
		return boardInterface.deleteBoard(boardNo);
	}

	@Override
	public int modifyBboard(BoardDto board) {
		return boardInterface.updatBboard(board);
	}

	@Override
	public BoardDto getBoardDetail(String boardNo) {
		return boardInterface.selectBoardDetail(boardNo);
	}

	@Override
	public int getBoardCount() {
		return boardInterface.selectBoardCount();
	}

	@Override
	public List<BoardDto> getBoardList(int currentPage, int pagePerRow) {
		return boardInterface.selectBoardList(currentPage, pagePerRow);
	}

	@Override
	public int addSnsSituation(String snsSituationNo, String snsBoardNo, String situationNo) {
		return boardInterface.insertSnsSituation(snsSituationNo, snsBoardNo, situationNo);
	}

	@Override
	public int addSnsStyle(String snsStyleNo, String snsBoardNo, String styleNo) {
		return boardInterface.insertSnsStyle(snsStyleNo, snsBoardNo, styleNo);
	}

	@Override
	public int addSnsColor(String snsColorNo, String snsBoardNo, String colorNo) {
		return boardInterface.insertSnsColor(snsColorNo, snsBoardNo, colorNo);
	}

	@Override
	public int addBoard(BoardDto board) {
		return boardInterface.insertBoard(board);
	}

	@Override
	public String getLastSituationNo() {
		return boardInterface.selectLastSituationNo();
	}

	@Override
	public String getLastStyleNo() {
		return boardInterface.selectLastStyleNo();
	}

	@Override
	public String getLastColorNo() {
		return boardInterface.selectLastColorNo();
	}

	@Override
	public String getLastBoardNo() {
		return boardInterface.selectLastBoardNo();
	}

	@Override
	public List<BoardDto> getBoardPopularityList(int currentPage, int pagePerRow) {
		return boardInterface.selectBoardPopularityList(currentPage, pagePerRow);
	}

}
