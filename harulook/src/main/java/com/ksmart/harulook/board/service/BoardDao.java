package com.ksmart.harulook.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/* 포인트등록 게시물 검색  */
	public int selectBoardPointCheck(String userId) {
		Map<String, String> map = new HashMap<String, String>();
        map.put("userId", userId);
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.board.service.BoardMapper.boardPointCheck", map);
	}
	
	/* sns게시물 상황별 분류 조회 */
	public List<String> selectBoardSituation(String snsBoardNo) {
		return sqlSessionTemplate.selectList("com.ksmart.harulook.board.service.BoardMapper.boardSituationSelect", snsBoardNo);
	}
	
	/* sns게시물 색상 조회 */
	public List<String> selectBoardColor(String snsBoardNo) {
		return sqlSessionTemplate.selectList("com.ksmart.harulook.board.service.BoardMapper.boardColorSelect", snsBoardNo);
	}
	
	/* sns게시물 스타일 조회 */
	public List<String> selectBoardStyle(String snsBoardNo) {
		return sqlSessionTemplate.selectList("com.ksmart.harulook.board.service.BoardMapper.boardStyleSelect", snsBoardNo);
	}
	
	/* sns게시물 검색 */
	public List<BoardDto> selectBoardSearchList(BoardDto board) {
		return sqlSessionTemplate.selectList("com.ksmart.harulook.board.service.BoardMapper.boardSearchList", board);
	}
	
	/* sns게시물 상황별 분류삭제 */
	public int deleteSnsSituation(String boardNo) {
		return sqlSessionTemplate.delete("com.ksmart.harulook.board.service.BoardMapper.snsSituationDelete", boardNo);
	}
	
	/* sns게시물 스타일 삭제 */
	public int deleteSnsStyle(String boardNo) {
		return sqlSessionTemplate.delete("com.ksmart.harulook.board.service.BoardMapper.snsStyleDelete", boardNo);
	}
	
	/* sns게시물 색상 삭제 */
	public int deleteSnsColor(String boardNo) {
		return sqlSessionTemplate.delete("com.ksmart.harulook.board.service.BoardMapper.snsColorDelete", boardNo);
	}
	
	/* sns게시물 삭제 */
	public int deleteBoard(String boardNo) {
		return sqlSessionTemplate.delete("com.ksmart.harulook.board.service.BoardMapper.boardDelete", boardNo);
	}
	
	/* sns게시물 정보 수정 */
	public int updatBboard(BoardDto board) {
		return sqlSessionTemplate.update("com.ksmart.harulook.board.service.BoardMapper.boardUpdate", board);
	}
	
	/* sns게시물 상세 보기 */
	public BoardDto selectBoardDetail(String boardNo) {
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.board.service.BoardMapper.boardDetail", boardNo);
	}
	
	/* sns게시물 수 조회 */
	public int selectBoardCount() {
        return sqlSessionTemplate.selectOne("com.ksmart.harulook.board.service.BoardMapper.boardCount");
    }
	
	/* sns게시물 목록 조회 메서드 */
	public List<BoardDto> selectBoardList(int currentPage, int pagePerRow) {
		Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("beginRow", (currentPage-1)*pagePerRow);
        map.put("pagePerRow", pagePerRow);
		return sqlSessionTemplate.selectList("com.ksmart.harulook.board.service.BoardMapper.boardList", map);
	}
	
	/* sns게시물 상황별 분류 입력 처리 메서드 */
	public int insertSnsSituation(String snsSituationNo, String snsBoardNo, String situationNo) {
		Map<String, String> map = new HashMap<String, String>();
        map.put("snsSituationNo", snsSituationNo);
        map.put("snsBoardNo", snsBoardNo);
        map.put("situationNo", situationNo);
		return sqlSessionTemplate.insert("com.ksmart.harulook.board.service.BoardMapper.SnsSituationInsert", map);
	}
	
	/* sns게시물 스타일 입력 처리 메서드 */
	public int insertSnsStyle(String snsStyleNo, String snsBoardNo, String styleNo) {
		Map<String, String> map = new HashMap<String, String>();
        map.put("snsStyleNo", snsStyleNo);
        map.put("snsBoardNo", snsBoardNo);
        map.put("styleNo", styleNo);
		return sqlSessionTemplate.insert("com.ksmart.harulook.board.service.BoardMapper.SnsStyleInsert", map);
	}
	
	/* sns게시물 색상 입력 처리 메서드 */
	public int insertSnsColor(String snsColorNo, String snsBoardNo, String colorNo) {
		Map<String, String> map = new HashMap<String, String>();
        map.put("snsColorNo", snsColorNo);
        map.put("snsBoardNo", snsBoardNo);
        map.put("colorNo", colorNo);
		return sqlSessionTemplate.insert("com.ksmart.harulook.board.service.BoardMapper.SnsColorInsert", map);
	}
	
	/* sns게시물 입력 처리 메서드 */
	public int insertBoard(BoardDto board) {
		return sqlSessionTemplate.insert("com.ksmart.harulook.board.service.BoardMapper.boardInsert", board);
	}
	
	/* 가장 최근에 입력된 게시물 상황별 분류 번호 */
	public String selectLastSituationNo() {
		String lastSituationNo = "";
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.board.service.BoardMapper.getLastSituationNo", lastSituationNo);
	}
	
	/* 가장 최근에 입력된 게시물 스타일 번호 */
	public String selectLastStyleNo() {
		String lastStyleNo = "";
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.board.service.BoardMapper.getLastStyleNo", lastStyleNo);
	}
	
	/* 가장 최근에 입력된 게시물 색상 번호 */
	public String selectLastColorNo() {
		String lastColorNo = "";
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.board.service.BoardMapper.getLastColorNo", lastColorNo);
	}
	
	/* 가장 최근에 등록된 게시물번호 */
	public String selectLastBoardNo() {
		String lastBoardNo = "";
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.board.service.BoardMapper.getLastBoardNo", lastBoardNo);
	}
	
	
}
