package com.ksmart.harulook.adgoods.service;

public interface AdGoodsServiceInterface {

	/*광고상품 조회 메서드*/
	AdGoodsDto getAdGoods(String adgoodsNo);

	/*광고 상품 수정 메서드*/
	int modifyAdGoods(AdGoodsDto adgoods);

	/*광고 상품 입력 메서드*/
	int addAdGoods(AdGoodsDto adGoods);

	/*광고 상품 삭제 메서드*/
	int removeAdGoods(String adGoodsNo);

}