package com.ksmart.harulook.hof.service;

import java.util.List;

public interface HofServiceInterface {
	/*이번 달 좋아요 랭크보기*/
	List<HofRankDto> getBoardLikeRank();

	/*명예의전당 등록처리*/
	int addHof(HofDto dto);

	/*이번 달 명예의전당 목록보기*/
	List<HofDto> getHofList();

	/*명예의전당 중복체크*/
	int getDuplicateHof(String boardNo);

	int addHofPoint(HofDto dto);

}
