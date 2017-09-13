package com.ksmart.harulook.hof.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HofService implements HofServiceInterface{

	@Autowired private HofInterface hofInterface;
	 
	@Override
	public List<HofRankDto> getBoardLikeRank() {
		return hofInterface.selectBoardLikeRank();
	}

	@Override
	public int addHof(HofDto dto) {
		return hofInterface.insertHof(dto);
	}

	@Override
	public List<HofDto> getHofList() {
		return hofInterface.selectHofList();
	}

	@Override
	public int getDuplicateHof(String boardNo) {
		return hofInterface.selectDuplicateHof(boardNo);
	}

	@Override
	public int addHofPoint(HofDto dto) {
		return hofInterface.insertHofPoint(dto);
	}

}
