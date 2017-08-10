package com.ksmart.harulook.board;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ksmart.harulook.dto.BoardDto;

@Repository
public class BoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int boardInsert(BoardDto board) {
		return sqlSessionTemplate.insert("com.ksmart.harulook.board.BoardMapper.boardInsert", board);
	}

}
