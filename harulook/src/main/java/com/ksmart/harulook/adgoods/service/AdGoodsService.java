package com.ksmart.harulook.adgoods.service;

import org.springframework.beans.factory.annotation.Autowired;

public class AdGoodsService implements AdGoodsServiceInterface {
	@Autowired
	private AdGoodsInterface adgoodsinterface;
	@Override
	public AdGoodsDto getAdGoods(String adgoodsNo) {
		return adgoodsinterface.selectAdGoods(adgoodsNo);
	}

	@Override
	public int modifyAdGoods(AdGoodsDto adgoods) {
		return adgoodsinterface.updateAdGoods(adgoods);
	}

	@Override
	public int addAdGoods(AdGoodsDto adGoods) {
		return adgoodsinterface.insertAdGoods(adGoods);
	}

	@Override
	public int removeAdGoods(String adGoodsNo) {
		return adgoodsinterface.deleteAdGoods(adGoodsNo);
	}

}
