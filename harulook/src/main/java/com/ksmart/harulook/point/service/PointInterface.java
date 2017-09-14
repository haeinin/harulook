package com.ksmart.harulook.point.service;

import java.util.List;

public interface PointInterface {

	/*출석체크삭제 */
	int deleteAttenCheck(String userId);

	/* 출석체크 한달검색  */
	int selectAttenCheckMonth(String userId);

	/* 출석체크검색  */
	String selectAttenCheck(String userId);

	/*출석체크입력 */
	int insertAttenCheck(String userId);

	/*포인트취득 */
	int insertPointGet(String userId, String pointPolicyNo);

	/* 포인트등록 게시물 검색  */
	String selectPointCehck(String userId, String pointPolicyNo);

	/*쿠폰 중복 검사 */
	String selectCouponCheck(String pointGoodsCode);

	/*쿠폰사용 */
	int insertCoupon(/*String pointNo, */String userId, int pointPolicyValue, String pointGoodsCode);

	/*나의 포인트*/
	int selectMyPoint(String userId);

	/*포인트 정책 리스트*/
	List<PointDto> selectPointPolicy();

	/*포인트 쿠폰 정책*/
	List<PointDto> selectPointUsePolicy();

	/*포인트 사용 내역*/
	List<PointDto> selectPointUse(int currentPage, int pagePerRow, String userId);

	/*포인트 사용 내역 카운트 */
	int selectPointUseCount(String userId);

	/*포인트 취득 내역*/
	List<PointDto> selectPointGet(int currentPage, int pagePerRow, String userId);

	/*포인트 취득 내역 카운트 */
	int selectPointGetCount(String userId);

}