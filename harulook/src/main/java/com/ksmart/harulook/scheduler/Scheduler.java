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
	public void AdContractScheduler() {
		try{
			List<AdContractDto> adContractEndList = adcontractdao.getUpdateEndContract();
			List<AdContractDto> adContractIngList = adcontractdao.getUpdateIngContract();
			for(int i = 0 ; i<adContractIngList.size(); i++){
				System.out.println("광고대기 -> 광고진행중 바뀌어야할 갯수 : " + adContractIngList.size());
				String contractno = adContractIngList.get(i).getAdContractNo();
				System.out.println("광고대기 -> 광고진행중   계약번호 : " +contractno);
				adcontractdao.updateIngContract(contractno);
			}
			for(int i = 0 ; i<adContractEndList.size(); i++){
				System.out.println("광고진행중 -> 계약만료 바뀌어야할 갯수 : " + adContractEndList.size());
				String contractno = adContractEndList.get(i).getAdContractNo();
				System.out.println("광고진행중 -> 계약만료   계약번호 : " +contractno);
				adcontractdao.updateIngContract(adContractEndList.get(i).getAdContractNo());
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	/*매일 0시 0분 6초에 제휴 상태 갱신*/
	@Scheduled(cron="6 0 0 * * *")
	public void CooContractScheduler() {
		try{
			List<String> startList = partnerdao.getStartCooContract();
			List<String> endList = partnerdao.getEndCooContractList();
			List<String> overList = partnerdao.getOverDueList();
			
			for(int i =0; i < endList.size(); i++){
				partnerdao.updateEndCooContract(endList.get(i));
				
				/*기간만료와 동시에 결제예정수수료 생성*/
				String LastCooBillNo = partnerdao.getLastCooBillNo();
				int setNo=1;
				if(LastCooBillNo !=null){
					setNo=Integer.parseInt(LastCooBillNo)+1;
				}
				String cooBillNo = "coo_bill_"+setNo;
				partnerdao.insertEndBill(cooBillNo, endList.get(i));
				
				System.out.println("매일 0시 0분 6초 제휴계약 기간만료 상태 변경");
			}
			
			for(int i =0; i < startList.size(); i++){
				partnerdao.updateStartCooContract(startList.get(i));
				System.out.println("매일 0시 0분 6초 제휴계약 진행 상태 변경");
			}
			
			for(int i =0; i < overList.size(); i++){
				partnerdao.updateOverDue(overList.get(i));
				System.out.println("매일 0시 0분 6초 제휴계약 정지 상태 변경");
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
	@Scheduled(cron="0 10 0 1 * *")
	public void PartnerScheduler() {
		try{
			List<String> cooContractNoList = partnerdao.getCooContractNo();
			/*기본키 자동생성*/
			for(int i =0; i < cooContractNoList.size() ; i++){
				String cooContractNo = cooContractNoList.get(i);
				String LastCooBillNo = partnerdao.getLastCooBillNo();
				int setNo=1;
				if(LastCooBillNo !=null){
					setNo=Integer.parseInt(LastCooBillNo)+1;
				}
				String cooBillNo = "coo_bill_"+setNo;
			/******************/
				partnerdao.cooContractBillInsert(cooBillNo, cooContractNo);

			}
	
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	
}
