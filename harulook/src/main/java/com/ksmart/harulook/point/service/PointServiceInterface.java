package com.ksmart.harulook.point.service;

import java.util.List;

public interface PointServiceInterface {
	
	/*출석체크삭제 */
	int removeAttenCheck(String userId);

	/* 출석체크 한달검색  */
	int getAttenCheckMonth(String userId);

	/* 출석체크검색  */
	String getAttenCheck(String userId);

	/*출석체크입력 */
	int addAttenCheck(String userId);

	/*포인트취득 */
	int addPointGet(String userId, String pointPolicyNo);

	/* 포인트등록 게시물 검색  */
	String getPointCehck(String userId, String pointPolicyNo);

	/*쿠폰 중복 검사 */
	String getCouponCheck(String pointGoodsCode);

	/*쿠폰사용 */
	int addCoupon(/*String pointNo, */String userId, int pointPolicyValue, String pointGoodsCode);

	/*나의 포인트*/
	int getMyPoint(String userId);

	/*포인트 정책 리스트*/
	List<PointDto> getPointPolicy();

	/*포인트 쿠폰 정책*/
	List<PointDto> getPointUsePolicy();

	/*포인트 사용 내역*/
	List<PointDto> getPointUse(int currentPage, int pagePerRow, String userId);

	/*포인트 사용 내역 카운트 */
	int getPointUseCount(String userId);

	/*포인트 취득 내역*/
	List<PointDto> getPointGet(int currentPage, int pagePerRow, String userId);

	/*포인트 취득 내역 카운트 */
	int getPointGetCount(String userId);
}
