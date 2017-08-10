package com.ksmart.harulook.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ksmart.harulook.dto.BoardDto;

@Repository
public class BoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/* sns게시물 정보 수정 */
	public int boardUpdate(String boardNo) {
		return sqlSessionTemplate.update("com.ksmart.harulook.board.BoardMapper.boardUpdate", boardNo);
	}
	
	/* sns게시물 상세 보기 */
	public BoardDto boardDetail(String boardNo) {
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.board.BoardMapper.boardDetail", boardNo);
	}
	
	/* sns게시물 수 조회 */
	public int getBoardCount() {
        return sqlSessionTemplate.selectOne("com.ksmart.harulook.board.BoardMapper.boardCount");
    }
	
	/* sns게시물 목록 보기 처리 메서드 */
	public List<BoardDto> boardList(int currentPage, int pagePerRow) {
		Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("beginRow", (currentPage-1)*pagePerRow);
        map.put("pagePerRow", pagePerRow);
        System.out.println(map.get("pagePerRow"));
		return sqlSessionTemplate.selectList("com.ksmart.harulook.board.BoardMapper.boardList", map);
	}
	
	/* sns게시물 입력 처리 메서드 */
	public int boardInsert(BoardDto board) {
		return sqlSessionTemplate.insert("com.ksmart.harulook.board.BoardMapper.boardInsert", board);
	}
	
}
