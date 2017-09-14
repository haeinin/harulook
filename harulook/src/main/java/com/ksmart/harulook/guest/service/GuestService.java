package com.ksmart.harulook.guest.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public class GuestService implements GuestServiceInterface {

	@Autowired private GuestInterface guestInterface;
	@Override
	public List<GuestDto> getMonthlyGuest() {
		// TODO Auto-generated method stub
		return guestInterface.selectMonthlyGuest();
	}

	@Override
	public List<GuestDto> getWeeklyGuest() {
		// TODO Auto-generated method stub
		return guestInterface.selectWeeklyGuest();
	}

	@Override
	public List<GuestDto> getdailyGuest() {
		// TODO Auto-generated method stub
		return guestInterface.selectdailyGuest();
	}

	@Override
	public String getGuest(String guestIp) {
		// TODO Auto-generated method stub
		return guestInterface.selectGuest(guestIp);
	}

	@Override
	public String getGuestNo(String a) {
		// TODO Auto-generated method stub
		return guestInterface.selectGuestNo(a);
	}

	@Override
	public int addGuest(String guestIp, String guestaddNo) {
		// TODO Auto-generated method stub
		return guestInterface.insertGuest(guestIp, guestaddNo);
	}

}
