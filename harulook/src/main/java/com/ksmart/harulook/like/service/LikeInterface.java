package com.ksmart.harulook.like.service;

public interface LikeInterface {

	/* sns게시물 삭제 시 예뻐요 삭제 */
	int deleteboardLike(String snsBoardNo);

	/* 가장 최근에 등록한 예뻐요 번호 */
	String selectLastLikeNo();

	/* sns게시물 예뻐요 수 조회 */
	int selectLikeCount(String snsBoardNo);

	/* sns게시물 예뻐요 등록 여부 확인 메서드 */
	int selectLikeClick(String snsBoardNo, String userId);

	/* sns게시물 예뻐요 등록 */
	int insertLike(String snsLikeNo, String snsBoardNo, String userId);

	/* sns게시물 예뻐요 등록 취소 */
	int deleteLike(String snsBoardNo, String userId);

}