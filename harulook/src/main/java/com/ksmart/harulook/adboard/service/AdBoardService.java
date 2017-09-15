package com.ksmart.harulook.adboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public class AdBoardService implements AdBoardServiceInterface {
	@Autowired
	AdBoardInterface adboardinterface;
	@Override
	public List<AdBoardDto> getAdBoard() {
		return adboardinterface.selectAdBoard();
	}

	@Override
	public String getGoodsNo() {
		return adboardinterface.selectGoodsNo();
	}

	@Override
	public String getBoardNo() {
		return adboardinterface.selectBoardNo();
	}

	@Override
	public int addAdBoard(AdBoardDto adBoard) {
		return adboardinterface.insertAdBoard(adBoard);
	}

	@Override
	public List<AdBoardDto> getAdBoardByContractId(String adContractNo) {
		return adboardinterface.selectAdBoardByContractId(adContractNo);
	}

	@Override
	public int removeAdBoard(String adBoardNo) {
		return adboardinterface.deleteAdBoard(adBoardNo);
	}

	@Override
	public AdBoardDto getBoardDetail(String adBoardNo) {
		return adboardinterface.selectBoardDetail(adBoardNo);
	}

	@Override
	public String getPlace1TempCount(String temp) {
		return adboardinterface.selectPlace1TempCount(temp);
	}

	@Override
	public String getPlace2TempCount(String temp) {
		return adboardinterface.selectPlace2TempCount(temp);
	}

	@Override
	public String getPlace3TempCount(String temp) {
		return adboardinterface.selectPlace3TempCount(temp);
	}

	@Override
	public AdBoardDto getBoardPlace1WhenCount0() {
		return adboardinterface.selectBoardPlace1WhenCount0();
	}

	@Override
	public AdBoardDto getBoardPlace1WhenCount1(String temp) {
		return adboardinterface.selectBoardPlace1WhenCount1(temp);
	}

	@Override
	public AdBoardDto getBoardPlace1WhenCount2() {
		return adboardinterface.selectBoardPlace1WhenCount2();
	}

	@Override
	public AdBoardDto getBoardPlace2WhenCount0() {
		return adboardinterface.selectBoardPlace2WhenCount0();
	}

	@Override
	public AdBoardDto getBoardPlace2WhenCount1(String temp) {
		return adboardinterface.selectBoardPlace2WhenCount1(temp);
	}

	@Override
	public AdBoardDto getBoardPlace2WhenCount2() {
		return adboardinterface.selectBoardPlace2WhenCount2();
	}

	@Override
	public AdBoardDto getBoardPlace3WhenCount0() {
		return adboardinterface.selectBoardPlace3WhenCount0();
	}

	@Override
	public AdBoardDto getBoardPlace3WhenCount1(String temp) {
		return adboardinterface.selectBoardPlace3WhenCount1(temp);
	}

	@Override
	public AdBoardDto getBoardPlace3WhenCount2() {
		return adboardinterface.selectBoardPlace3WhenCount2();
	}

}
