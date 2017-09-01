package com.ksmart.harulook.scheduler;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.ksmart.harulook.adcontract.service.AdContractDao;
import com.ksmart.harulook.adcontract.service.AdContractDto;
import com.ksmart.harulook.hof.service.HofDao;
import com.ksmart.harulook.partner.service.PartnerDao;

@Component
public class Scheduler {

	@Autowired
	private HofDao hofdao;
	
	@Autowired
	private PartnerDao partnerdao;
	
	@Autowired
	private AdContractDao adcontractdao;
	
	/*매일 0시 0분 5초에 광고 상태 갱신*/
	@Scheduled(cron="5 0 0 * * *")
	public void ContractScheduler() {
		try{
			List<AdContractDto> adContractEndList = adcontractdao.getUpdateEndContract();
			List<AdContractDto> adContractIngList = adcontractdao.getUpdateIngContract();
			for(int i = 0 ; i<adContractIngList.size(); i++){
				System.out.println("광고대기 -> 광고진행중 바껴야할 갯수 : " + adContractIngList.size());
				String contractno = adContractIngList.get(i).getAdContractNo();
				System.out.println("광고대기 -> 광고진행중   계약번호 : " +contractno);
				adcontractdao.updateIngContract(contractno);
			}
			for(int i = 0 ; i<adContractEndList.size(); i++){
				System.out.println("광고진행중 -> 계약만료 바껴야할 갯수 : " + adContractEndList.size());
				String contractno = adContractEndList.get(i).getAdContractNo();
				System.out.println("광고진행중 -> 계약만료   계약번호 : " +contractno);
				adcontractdao.updateIngContract(adContractEndList.get(i).getAdContractNo());
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
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
	/*@Scheduled(cron="0 10 0 1 * *")*/
	@Scheduled(cron="0 0 10 * * *")
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
