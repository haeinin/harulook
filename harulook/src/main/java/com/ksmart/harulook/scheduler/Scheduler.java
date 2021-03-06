package com.ksmart.harulook.scheduler;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.ksmart.harulook.adcontract.service.AdContractDto;
import com.ksmart.harulook.adcontract.service.AdContractInterface;
import com.ksmart.harulook.hof.service.HofDao;
import com.ksmart.harulook.partner.service.PartnerInterface;

@Component
public class Scheduler {
	Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private HofDao hofdao;
	
	@Autowired
	private PartnerInterface partnerdao;
	
	@Autowired
	private AdContractInterface adcontractdao;
	
	
	/*매일 0시 0분 5초에 광고 상태 갱신*/
	@Scheduled(cron="5 0 0 * * *")
	public void AdContractScheduler() {
		try{
			List<AdContractDto> adContractEndList = adcontractdao.selectUpdateEndContract();
			List<AdContractDto> adContractIngList = adcontractdao.selectUpdateIngContract();
			for(int i = 0 ; i<adContractIngList.size(); i++){
				log.debug("광고대기 -> 광고진행중 바뀌어야할 갯수 : " + adContractIngList.size());
				String contractno = adContractIngList.get(i).getAdContractNo();
				log.debug("광고대기 -> 광고진행중   계약번호 : " +contractno);
				adcontractdao.updateIngContract(contractno);
			}
			for(int i = 0 ; i<adContractEndList.size(); i++){
				log.debug("광고진행중 -> 계약만료 바뀌어야할 갯수 : " + adContractEndList.size());
				String contractno = adContractEndList.get(i).getAdContractNo();
				log.debug("광고진행중 -> 계약만료   계약번호 : " +contractno);
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
			/*제휴 시작날짜 불러오기*/
			List<String> startList = partnerdao.selectStartCooContract();
			/*제휴 종료날짜 불러오기*/
			List<String> endList = partnerdao.selectEndCooContractList();
			/*제휴 결제날짜 불러오기*/
			List<String> overList = partnerdao.selectOverDueList();
			
			/*제휴 종료날짜 지난 계약은 제휴 종료상태로 변경*/
			for(int i =0; i < endList.size(); i++){
				partnerdao.updateEndCooContract(endList.get(i));
				
				/*기간만료와 동시에 결제예정수수료 생성*/
				String LastCooBillNo = partnerdao.selectLastCooBillNo();
				int setNo=1;
				if(LastCooBillNo !=null){
					setNo=Integer.parseInt(LastCooBillNo)+1;
				}
				String cooBillNo = "coo_bill_"+setNo;
				partnerdao.insertEndBill(cooBillNo, endList.get(i));
				
				log.debug("매일 0시 0분 6초 제휴계약 기간만료 상태 변경");
			}
			
			/*제휴 시작날짜 지난계약은 제휴진행 상태로 변경*/
			for(int i =0; i < startList.size(); i++){
				partnerdao.updateStartCooContract(startList.get(i));
				log.debug("매일 0시 0분 6초 제휴계약 진행 상태 변경");
			}
			
			/*제휴 결제일이 지나도록 결제안된 계약은 제휴정지 상태로 변경*/
			for(int i =0; i < overList.size(); i++){
				partnerdao.updateOverDue(overList.get(i));
				log.debug("매일 0시 0분 6초 제휴계약 정지 상태 변경");
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
			log.debug("매월 1일 0시 30분 명예의전당 입력");
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/*매월 1일 0시 10분에 결제예정수수료 입력*/
	@Scheduled(cron="0 10 0 1 * *")
	public void PartnerScheduler() {
		try{
			List<String> cooContractNoList = partnerdao.selectCooContractNo();
			/*기본키 자동생성*/
			for(int i =0; i < cooContractNoList.size() ; i++){
				String cooContractNo = cooContractNoList.get(i);
				String LastCooBillNo = partnerdao.selectLastCooBillNo();
				int setNo=1;
				if(LastCooBillNo !=null){
					setNo=Integer.parseInt(LastCooBillNo)+1;
				}
				String cooBillNo = "coo_bill_"+setNo;
			/******************/
				partnerdao.insertCooContractBill(cooBillNo, cooContractNo);

			}
	
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	
}
