package com.ksmart.harulook.partner.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class PartnerScheduler {

	@Autowired
	private PartnerDao dao;

	/*매월 1일 0시 10분에 결제예정수수료 입력*/
	@Scheduled(cron="0 10 0 1 * *")
	public void Scheduler() {
		try{
			List<String> cooContractNoList = dao.getCooContractNo();
			for(int i =0; i < cooContractNoList.size() ; i++){
				String cooContractNo = cooContractNoList.get(i);
				String LastCooBillNo = dao.getLastCooBillNo();
				int setNo=1;
				if(LastCooBillNo !=null){
					setNo=Integer.parseInt(LastCooBillNo)+1;
				}
				String cooBillNo = "coo_bill_"+setNo;
				dao.cooContractBillInsert(cooBillNo, cooContractNo);

			}
	
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	

}

