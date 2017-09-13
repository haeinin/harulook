package com.ksmart.harulook.mall.service;

import java.util.List;

public interface MallServiceInterface {

	/*쇼핑몰 상품 상세보기*/
	MallDto getMallPro(String mallProNo);

	/*회원 상품 구입 처리*/
	int addMallSale(MallSaleDto dto);

	/*비회원 상품 구입 처리*/
	int addMallSaleNon(MallSaleDto dto);

	/*할인코드 확인*/
	String getCooContractCode(String cooContractCode);

	/*방금 구매한 정보 보기*/
	MallSaleDto getMallBuyNow();

	/*내 구매내역 전체보기*/
	List<MallSaleDto> getMallBuyList(String id);

	/*쇼핑몰 방문자 번호 가져오기*/
	String getLastMallVisitor();

	/*쇼핑몰 방문자 입력 처리*/
	int addMallVisitor(MallVisitorDto dto);
}
