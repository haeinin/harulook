package com.ksmart.harulook.hof.service;

import java.util.List;

public interface HofInterface {

	/*이번 달 좋아요 랭크보기*/
	List<HofRankDto> selectBoardLikeRank();

	/*명예의전당 등록처리*/
	int insertHof(HofDto dto);

	/*이번 달 명예의전당 목록보기*/
	List<HofDto> selectHofList();

	/*명예의전당 중복체크*/
	int selectDuplicateHof(String boardNo);

	int insertHofPoint(HofDto dto);

}