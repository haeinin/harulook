package com.ksmart.harulook.mall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MallService implements MallServiceInterface {

	@Autowired private MallInterface mallInterface;
	
	@Override
	public MallDto getMallPro(String mallProNo) {
		return mallInterface.selectMallPro(mallProNo);
	}

	@Override
	public int addMallSale(MallSaleDto dto) {
		return mallInterface.insertMallSale(dto);
	}

	@Override
	public int addMallSaleNon(MallSaleDto dto) {
		return mallInterface.insertMallSaleNon(dto);
	}

	@Override
	public String getCooContractCode(String cooContractCode) {
		return mallInterface.selectCooContractCode(cooContractCode);
	}

	@Override
	public MallSaleDto getMallBuyNow() {
		return mallInterface.selectMallBuyNow();
	}

	@Override
	public List<MallSaleDto> getMallBuyList(String id) {
		return mallInterface.selectMallBuyList(id);
	}

	@Override
	public String getLastMallVisitor() {
		return mallInterface.selectLastMallVisitor();
	}

	@Override
	public int addMallVisitor(MallVisitorDto dto) {
		return mallInterface.insertMallVisitor(dto);
	}

}
