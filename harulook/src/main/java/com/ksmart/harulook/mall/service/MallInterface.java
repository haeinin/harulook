package com.ksmart.harulook.mall.service;

import java.util.List;

public interface MallInterface {

	/*쇼핑몰 상품 상세보기*/
	MallDto selectMallPro(String mallProNo);

	/*회원 상품 구입 처리*/
	int insertMallSale(MallSaleDto dto);

	/*비회원 상품 구입 처리*/
	int insertMallSaleNon(MallSaleDto dto);

	/*할인코드 확인*/
	String selectCooContractCode(String cooContractCode);

	/*방금 구매한 정보 보기*/
	MallSaleDto selectMallBuyNow();

	/*내 구매내역 전체보기*/
	List<MallSaleDto> selectMallBuyList(String id);

	/*쇼핑몰 방문자 번호 가져오기*/
	String selectLastMallVisitor();

	/*쇼핑몰 방문자 입력 처리*/
	int insertMallVisitor(MallVisitorDto dto);

}