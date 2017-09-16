package com.ksmart.harulook.like.service;

public interface LikeServiceInterface {

	/* sns게시물 삭제 시 예뻐요 삭제 */
	int removeboardLike(String snsBoardNo);

	/* 가장 최근에 등록한 예뻐요 번호 */
	String getLastLikeNo();

	/* sns게시물 예뻐요 수 조회 */
	int getLikeCount(String snsBoardNo);

	/* sns게시물 예뻐요 등록 여부 확인 메서드 */
	int getLikeClick(String snsBoardNo, String userId);

	/* sns게시물 예뻐요 등록 */
	int addLike(String snsLikeNo, String snsBoardNo, String userId);

	/* sns게시물 예뻐요 등록 취소 */
	int removeLike(String snsBoardNo, String userId);
}
