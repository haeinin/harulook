package com.ksmart.harulook.follow.service;

import java.util.List;

public interface FollowInterface {

	/*팔로우삭제 */
	String deleteFollow(String userId, String followId);

	/*나를 팔로우한 리스트 카운트 매서드 */
	int selectFollowMeListCount(String userId);

	/*팔로우리스트 카운트 매서드 */
	int selectFollowListCount(String userId);

	/*팔로우미리스트 */
	List<FollowDto> selectFollowMeList(int currentPage, int pagePerRow, String followId);

	/*팔로우리스트 */
	List<FollowDto> selectFollowList(int currentPage, int pagePerRow, String followId);

	/*팔로우체크 */
	String selectFollowCheck(String userId, String followId);

	/*팔로우no검색*/
	String selectFollowNo();

	/*팔로우입력 */
	int insertFollow(String followNo, String userId, String followId);

}