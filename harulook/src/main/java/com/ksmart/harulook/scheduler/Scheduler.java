package com.ksmart.harulook.scheduler;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.ksmart.harulook.hof.service.HofDao;
import com.ksmart.harulook.partner.service.PartnerDao;

@Component
public class Scheduler {

	@Autowired
	private HofDao hofdao;
	
	@Autowired
	private PartnerDao partnerdao;

	/*매월 1일 0시 30분 명예의전당 입력*/
	@Scheduled(cron="0 30 0 1 * *")
	public void HofScheduler() {
		try{
			hofdao.insertHof();
			System.out.println("매월 1일 0시 30분 명예의전당 입력");
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/*매월 1일 0시 10분에 결제예정수수료 입력*/
	@Scheduled(cron="0 10 0 1 * *")
	public void PartnerScheduler() {
		try{
			List<String> cooContractNoList = partnerdao.getCooContractNo();
			for(int i =0; i < cooContractNoList.size() ; i++){
				String cooContractNo = cooContractNoList.get(i);
				String LastCooBillNo = partnerdao.getLastCooBillNo();
				int setNo=1;
				if(LastCooBillNo !=null){
					setNo=Integer.parseInt(LastCooBillNo)+1;
				}
				String cooBillNo = "coo_bill_"+setNo;
				partnerdao.cooContractBillInsert(cooBillNo, cooContractNo);

			}
	
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	
}
