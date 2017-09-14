package com.ksmart.harulook.guest.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public class GuestService implements GuestServiceInterface {

	@Autowired private GuestInterface guestInterface;
	@Override
	public List<GuestDto> getMonthlyGuest() {
		return guestInterface.selectMonthlyGuest();
	}

	@Override
	public List<GuestDto> getWeeklyGuest() {
		return guestInterface.selectWeeklyGuest();
	}

	@Override
	public List<GuestDto> getdailyGuest() {
		return guestInterface.selectdailyGuest();
	}

	@Override
	public String getGuest(String guestIp) {
		return guestInterface.selectGuest(guestIp);
	}

	@Override
	public String getGuestNo(String a) {
		return guestInterface.selectGuestNo(a);
	}

	@Override
	public int addGuest(String guestIp, String guestaddNo) {
		return guestInterface.insertGuest(guestIp, guestaddNo);
	}

}
