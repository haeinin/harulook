package com.ksmart.harulook.follow.service;

import java.util.List;

public interface FollowServiceInterface {
	/*팔로우삭제 */
	String removeFollow(String userId, String followId);

	/*나를 팔로우한 리스트 카운트 매서드 */
	int getFollowMeListCount(String userId);

	/*팔로우리스트 카운트 매서드 */
	int getFollowListCount(String userId);

	/*팔로우미리스트 */
	List<FollowDto> getFollowMeList(int currentPage, int pagePerRow, String followId);

	/*팔로우리스트 */
	List<FollowDto> getFollowList(int currentPage, int pagePerRow, String followId);

	/*팔로우체크 */
	String getFollowCheck(String userId, String followId);

	/*팔로우no검색*/
	String getFollowNo();

	/*팔로우입력 */
	int addFollow(String followNo, String userId, String followId);
}
