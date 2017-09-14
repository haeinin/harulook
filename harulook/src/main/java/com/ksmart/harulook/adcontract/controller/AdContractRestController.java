package com.ksmart.harulook.adcontract.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ksmart.harulook.adboard.service.AdBoardDto;
import com.ksmart.harulook.adboard.service.AdBoardInterface;
import com.ksmart.harulook.adcontract.service.AdContractInterface;
import com.ksmart.harulook.adgoods.service.AdGoodsDto;
import com.ksmart.harulook.adgoods.service.AdGoodsInterface;

@RestController
public class AdContractRestController {
	
	@Autowired
	private AdContractInterface adcontractdao;
	@Autowired
	private AdBoardInterface adBoardDao;
	@Autowired
	private AdGoodsInterface adGoodsDao;

	/*광고 종류를 선택했을때 해당광고별 금액 산출(AJAX)*/
	@RequestMapping(value="/getPrice",method = RequestMethod.POST)
	public String getPrice(@RequestParam("adtype") String adtype) {
		System.out.println("광고종류별 금액 요청");
		System.out.println(adtype);
		String price = adcontractdao.selectPrice(adtype);
		return price;
	}
	/*계약기간을 선택헀을때 기간별 할인율 산출(AJAX)*/
	@RequestMapping(value="/getDc",method = RequestMethod.POST)
	public String getDc(@RequestParam("adCostNo") String dc) {
		System.out.println("계약일별 수수료 비율 요청");
		System.out.println(dc);
		String dcrate = adcontractdao.selectDc(dc);
		return dcrate;
	}
	/* 광고 계약 게시물  상세보기 */
	@RequestMapping(value="/adContractDetail", method = RequestMethod.GET)
	public Map<String, Object[]> adBoardDetail(HttpSession session
            , @RequestParam(value="adContractNo", required=true) String adContractNo) {
		System.out.println("adBoardDeatil 화면 요청");
		System.out.println("광고 계약 번호 : " + adContractNo);
		int k=0;
		List<AdBoardDto> adBoardList = adcontractdao.selectContractDetail(adContractNo);
		AdBoardDto[] adBoardArray = new AdBoardDto[adBoardList.size()];
		for(int i=0; i<adBoardArray.length; i++){
			adBoardArray[i]= adBoardList.get(i);
		}
		System.out.println("광고 게시물 갯수 : " + adBoardArray.length);
		AdGoodsDto[] adGoodsArray = new  AdGoodsDto[adBoardList.size()*2];
		for(int i=0; i<adBoardList.size(); i++){
			System.out.println("i : " + i);
			adGoodsArray[k] = adGoodsDao.selectAdGoods(adBoardArray[i].getAdBoardGoods1());
			System.out.println(adGoodsDao.selectAdGoods(adBoardArray[i].getAdBoardGoods1()));
			adGoodsArray[k+1] =  adGoodsDao.selectAdGoods(adBoardArray[i].getAdBoardGoods2());
			System.out.println(adGoodsDao.selectAdGoods(adBoardArray[i].getAdBoardGoods2()));
			k=k+2;
		}
		Map<String, Object[]> adBoardDetail = new HashMap<String, Object[]>();
		adBoardDetail.put("adBoard", adBoardArray);
		adBoardDetail.put("goods", adGoodsArray);
			System.out.println(adBoardDetail);
			return adBoardDetail;
		}
}
