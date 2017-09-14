package com.ksmart.harulook.adgoods.service;

public interface AdGoodsInterface {

	/*광고상품 조회 메서드*/
	AdGoodsDto selectAdGoods(String adgoodsNo);

	/*광고 상품 수정 메서드*/
	int updateAdGoods(AdGoodsDto adgoods);

	/*광고 상품 입력 메서드*/
	int insertAdGoods(AdGoodsDto adGoods);

	/*광고 상품 삭제 메서드*/
	int deleteAdGoods(String adGoodsNo);

}