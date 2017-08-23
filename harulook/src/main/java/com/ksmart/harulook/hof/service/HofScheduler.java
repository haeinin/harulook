package com.ksmart.harulook.hof.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class HofScheduler {

	@Autowired
	private HofDao dao;

	/*매월 1일 0시 30분 명예의전당 입력*/
	@Scheduled(cron="0 30 0 1 * *")
	public void Scheduler() {
		try{
			dao.insertHof();
			System.out.println("매월 1일 0시 30분 명예의전당 입력");
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	

}
