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
	
	/* sns게시물 검색 */
	public List<BoardDto> boardSearchList(BoardDto board) {
		return sqlSessionTemplate.selectList("com.ksmart.harulook.board.service.BoardMapper.boardSearchList", board);
	}
	
	/* sns게시물 삭제 */
	public int boardDelete(String boardNo) {
		return sqlSessionTemplate.delete("com.ksmart.harulook.board.service.BoardMapper.boardDelete", boardNo);
	}
	
	/* sns게시물 정보 수정 */
	public int boardUpdate(BoardDto board) {
		return sqlSessionTemplate.update("com.ksmart.harulook.board.service.BoardMapper.boardUpdate", board);
	}
	
	/* sns게시물 상세 보기 */
	public BoardDto boardDetail(String boardNo) {
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.board.service.BoardMapper.boardDetail", boardNo);
	}
	
	/* sns게시물 수 조회 */
	public int getBoardCount() {
        return sqlSessionTemplate.selectOne("com.ksmart.harulook.board.service.BoardMapper.boardCount");
    }
	
	/* sns게시물 목록 조회 메서드 */
	public List<BoardDto> boardList(int currentPage, int pagePerRow) {
		Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("beginRow", (currentPage-1)*pagePerRow);
        map.put("pagePerRow", pagePerRow);
		return sqlSessionTemplate.selectList("com.ksmart.harulook.board.service.BoardMapper.boardList", map);
	}
	
	/* sns게시물 입력 처리 메서드 */
	public int boardInsert(BoardDto board) {
		return sqlSessionTemplate.insert("com.ksmart.harulook.board.service.BoardMapper.boardInsert", board);
	}
	
	/* 가장 최근에 등록된 게시물번호 */
	public String getLastBoardNo() {
		String lastBoardNo = "";
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.board.service.BoardMapper.getLastBoardNo", lastBoardNo);
	}
	
	
}