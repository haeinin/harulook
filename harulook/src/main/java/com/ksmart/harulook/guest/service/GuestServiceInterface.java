package com.ksmart.harulook.guest.service;

import java.util.List;

public interface GuestServiceInterface {
	/*월간방문자수조회 */
	List<GuestDto> getMonthlyGuest();

	/*주간방문자수조회 */
	List<GuestDto> getWeeklyGuest();

	/*일일방문자수조회 */
	List<GuestDto> getdailyGuest();

	/*중복접속체크 */
	String getGuest(String guestIp);

	/*게스트no검색 */
	String getGuestNo(String a);

	/*게스트입력 */
	int addGuest(String guestIp, String guestaddNo);
}
