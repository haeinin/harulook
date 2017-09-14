package com.ksmart.harulook.guest.service;

import java.util.List;

public interface GuestInterface {

	/*월간방문자수조회 */
	List<GuestDto> selectMonthlyGuest();

	/*주간방문자수조회 */
	List<GuestDto> selectWeeklyGuest();

	/*일일방문자수조회 */
	List<GuestDto> selectdailyGuest();

	/*중복접속체크 */
	String selectGuest(String guestIp);

	/*게스트no검색 */
	String selectGuestNo(String a);

	/*게스트입력 */
	int insertGuest(String guestIp, String guestInsertNo);

}