package com.ksmart.harulook.adboard.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ksmart.harulook.util.UtilFile;
import com.ksmart.harulook.adboard.service.AdBoardDto;
import com.ksmart.harulook.adboard.service.AdBoardInterface;
import com.ksmart.harulook.adcontract.service.AdContractInterface;
import com.ksmart.harulook.adgoods.service.AdGoodsDto;
import com.ksmart.harulook.adgoods.service.AdGoodsInterface;

@Controller
public class AdBoardController {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private AdBoardInterface adboarddao;
	@Autowired
	private UtilFile utilfile;
	@Autowired
	private AdContractInterface adcontractdao;
	@Autowired
	private AdGoodsInterface adgoodsdao;
	
	
	@RequestMapping(value="/adBoardUpdate",method = RequestMethod.POST)
	public String selectAdBoardUpdate(HttpServletRequest request
									 ,HttpSession session) {
		String adcontractno = (String)session.getAttribute("adContractNo");
		int k=0;
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		int adBoardCount = Integer.parseInt(request.getParameter("adBoardCount"));
		log.debug("광고 게시물 입력 요청");
		String adGoodsCount[] = request.getParameterValues("adGoodsCount");
		String minTemp[] = request.getParameterValues("adBoardTempMin");
		String maxTemp[] = request.getParameterValues("adBoardTempMax");
		String content[] = request.getParameterValues("adBoardContent");
		String adGoodsNo[] = request.getParameterValues("adGoodsNo");
		String adBoardNo[] = request.getParameterValues("adBoardNo");
		if(adGoodsCount[1].equals(null)){
			adGoodsCount[1] = "0";
		}
		log.debug("게시물의 갯수 : " + adBoardCount);
		log.debug("첫번째/두번째 광고게시물 번호 : " + adBoardNo[0] + "/" + adBoardNo[1]);
		log.debug("첫번째/두번째/세번째/네번째 광고 광고 번호 : " + adGoodsNo[0] + "/" + adGoodsNo[1] + "/" + adGoodsNo[2] + "/" + adGoodsNo[3]);
		log.debug("첫번째 광고 게시물의 최저온도/최고온도 : " + minTemp[0] +"/"+maxTemp[0]);
		log.debug("두번째 광고 게시물의 최저온도/최고온도 : " + minTemp[1] +"/"+maxTemp[1]);
		log.debug("첫번째 광고 게시물의 광고의 갯수 : " + adGoodsCount[0]);
		log.debug("두번째 광고 게시물의 광고의 갯수 : " + adGoodsCount[1]);
		log.debug("첫번째 광고 게시물의 내용 : " +  content[0]);
		log.debug("두번째 광고 게시물의 내용 : " +  content[1]);
		String[] links = request.getParameterValues("adGoodsLink");
		List<MultipartFile> adGoodsImages = multipartRequest.getFiles("adGoodsImage");
		List<MultipartFile> adBoardImages = multipartRequest.getFiles("adBoardImage");
		log.debug("첫번쨰 광고 게시물 상품 갯수 : " + adGoodsCount[0]);
		log.debug("두번째 광고 게시물 상품 갯수 : " + adGoodsCount[1]);
		log.debug("adBoardImage : " + adBoardImages);
		log.debug("adGoodsImage : " + adGoodsImages);
		log.debug("adGoodsLink : " + request.getParameterValues("adGoodsLink"));
		for(int i = 0; i<adBoardNo.length; i++){
			adboarddao.deleteAdBoard(adBoardNo[i]);
		}
		for(int i = 0; i<adGoodsNo.length; i++){
			adgoodsdao.deleteAdGoods(adGoodsNo[i]);
		}
		for(int i = 0; i < adBoardCount; i++){
			int initBoardno = 1;
			AdBoardDto adboard = new AdBoardDto();
			String lastboardno = adboarddao.selectBoardNo();
			if(lastboardno != null){
				initBoardno = Integer.parseInt(lastboardno) + initBoardno;
			}
			log.debug("입력될 BoardNo : " + "ad_board_" + initBoardno);
			adboard.setAdBoardNo("ad_board_" + initBoardno);
			adboard.setAdBoardImg(utilfile.fileUpload(multipartRequest, adBoardImages.get(i)));
			adboard.setAdContractNo(adcontractno);
			adboard.setAdBoardTempMax(maxTemp[i]);
			adboard.setAdBoardTempMin(minTemp[i]);
			adboard.setAdBoardContent(content[i]);
			for(int j = k; j < k+Integer.parseInt(adGoodsCount[i]); j++){
				int initGoodsno = 1;
				AdGoodsDto adgoods = new AdGoodsDto();
				String lastgoodsno = adboarddao.selectGoodsNo();
				if(lastgoodsno != null ){
					initGoodsno = Integer.parseInt(lastgoodsno) + initGoodsno;
				}
				log.debug("입력되는 정보 ");
				log.debug("goods_no : " + "ad_goods_"+initGoodsno);
				log.debug("goods_link : " + links[j]);
				log.debug("goods_img : "+ adGoodsImages.get(j));
				adgoods.setAdGoodsNo("ad_goods_"+initGoodsno);
				adgoods.setAdGoodsLink(links[j]);
				adgoods.setAdGoodsImg(utilfile.fileUpload(multipartRequest, adGoodsImages.get(j)));
				adgoodsdao.insertAdGoods(adgoods);
				adboard.setAdBoardGoods1(adgoods.getAdGoodsNo());
				if(Integer.parseInt(adGoodsCount[i])==1){
					adboard.setAdBoardGoods2(null);
					log.debug("한개 건너뜀");
					log.debug("i : " + i + " j :" + j + "k : " + k);
					k=k+1;
					break;
				}else{
					adgoods.setAdGoodsNo("ad_goods_"+(initGoodsno+1));
					adgoods.setAdGoodsLink(links[j+1]);
					adgoods.setAdGoodsImg(utilfile.fileUpload(multipartRequest, adGoodsImages.get(j+1)));
					adgoodsdao.insertAdGoods(adgoods);
					adboard.setAdBoardGoods2(adgoods.getAdGoodsNo());
					log.debug("i : " + i + " j :" + j + "k : " + k);
					break;
				}
			}
			k = k + Integer.parseInt(adGoodsCount[i]);
			log.debug(adboard.toString());
			adboarddao.insertAdBoard(adboard);
		}
		
		log.debug(adBoardImages.get(0));
		return "redirect:/adContractList";
	}
	
	
	@RequestMapping(value="/adBoardUpdate",method = RequestMethod.GET)
	public String selectAdBoardUpdateForm(Model model
										 ,@RequestParam("adContractNo") String adcontractno
										 ,HttpSession session) {
		session.setAttribute("adContractNo", adcontractno);
		int k = 0;
		int adboardcount = 0;
		log.debug("광고 게시물 수정 화면 요청");
		log.debug("adContractNo : " + adcontractno);
		List<AdBoardDto> adboard = adboarddao.selectAdBoardByContractId(adcontractno);
		log.debug("게시물 갯수 : " + adboard.size());
		adboardcount = adboard.size();
		AdBoardDto[] adboardlist = new AdBoardDto[adboardcount];
		String[] goodsno = new String[adboardlist.length*2];
		AdGoodsDto[] adgoods = new AdGoodsDto[goodsno.length];
		int [] goodscount = new int[adboardcount];
		for(int j=0; j<adboardcount; j++){
			adboardlist[j] = adboard.get(j);
		}
		for(int j=0; j<adboardcount; j++){
				goodsno[k] = adboardlist[j].getAdBoardGoods1();
				log.debug(k);
					if(adboardlist[j].getAdBoardGoods2()!=null){
						goodsno[k+1] = adboardlist[j].getAdBoardGoods2();
						k=k+2;
						goodscount[j]=2;
						continue;
					}else{
						k++;
						goodscount[j]=1;
					}
			}
		
		for(int i=0; i<goodsno.length; i++){
			adgoods[i] = adgoodsdao.selectAdGoods(goodsno[i]);
		}
		model.addAttribute("adboardlist", adboardlist);
		model.addAttribute("adgoods", adgoods);
		model.addAttribute("adboardcount", adboardcount);
		model.addAttribute("goodscount", goodscount);
		log.debug(model.toString());
		return "ad/board/ad_board_update";	
	}
	
	@RequestMapping(value="/adBoardList",method = RequestMethod.GET)
	public String selectAdBoardList(Model model
								   ,HttpSession session) {
		log.debug("광고 게시물 목록 요청");
		String temp = (String)session.getAttribute("sessionTemp");
		log.debug("세션에 담겨있는 온도 : " + temp);
		String[] correctAdBoardCount = new String[3];
		correctAdBoardCount[0] = adboarddao.selectPlace1TempCount(temp);
		correctAdBoardCount[1] = adboarddao.selectPlace2TempCount(temp);
		correctAdBoardCount[2] = adboarddao.selectPlace3TempCount(temp);
		AdBoardDto[] adBoardlist = new AdBoardDto[3];
		switch (correctAdBoardCount[0]) {
		case "0":
			adBoardlist[0] = adboarddao.selectBoardPlace1WhenCount0();			
			break;
		case "1":
			adBoardlist[0] = adboarddao.selectBoardPlace1WhenCount1(temp);
			break;
		case "2":
			adBoardlist[0] = adboarddao.selectBoardPlace1WhenCount2();	
			break;
		}
		switch (correctAdBoardCount[1]) {
		case "0":
			adBoardlist[1] = adboarddao.selectBoardPlace2WhenCount0();	
			break;
		case "1":
			adBoardlist[1] = adboarddao.selectBoardPlace2WhenCount1(temp);
			break;
		case "2":
			adBoardlist[1] = adboarddao.selectBoardPlace2WhenCount2();
			break;
		}
		switch (correctAdBoardCount[2]) {
		case "0":
			adBoardlist[2] = adboarddao.selectBoardPlace3WhenCount0();
			break;
		case "1":
			adBoardlist[2] = adboarddao.selectBoardPlace3WhenCount1(temp);
			break;
		case "2":
			adBoardlist[2] = adboarddao.selectBoardPlace3WhenCount2();
			break;
		}
		log.debug("첫번째 위치에 해당하는 광고게시물의 갯수 : " + correctAdBoardCount[0]);
		log.debug("두번째 위치에 해당하는 광고게시물의 갯수 : " + correctAdBoardCount[1]);
		log.debug("세번째 위치에 해당하는 광고게시물의 갯수 : " + correctAdBoardCount[2]);	
		model.addAttribute("adboardlist", adBoardlist);
		log.debug(model);
		return "ad/board/ad_board_list";	
	}
	
	@RequestMapping(value="/insertAdBoard",method = RequestMethod.GET)
	public String insertAdBoardView(@RequestParam("adContractNo") String adcontractno
								 ,HttpSession session) {
		log.debug("adContractNo : " + adcontractno);
		session.setAttribute("adContractNo", adcontractno);
		log.debug("광고 게시물 입력 폼 요청");
		return "ad/board/ad_board_insert";	
	}
	@RequestMapping(value="/insertAdBoard",method = RequestMethod.POST)
	public String insertAdBoard(HttpServletRequest request
							   ,HttpSession session) {
		int k=0;
		String adcontractno = (String) session.getAttribute("adContractNo");
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		int adBoardCount = Integer.parseInt(request.getParameter("adBoardCount"));
		log.debug("광고 게시물 입력 요청");
		String adGoodsCount[] = request.getParameterValues("adGoodsCount");
		String minTemp[] = request.getParameterValues("adBoardTempMin");
		String maxTemp[] = request.getParameterValues("adBoardTempMax");
		String content[] = request.getParameterValues("adBoardContent");
		String[] links = request.getParameterValues("adGoodsLink");
		List<MultipartFile> adGoodsImages = multipartRequest.getFiles("adGoodsImage");
		List<MultipartFile> adBoardImages = multipartRequest.getFiles("adBoardImage");
		if(adGoodsCount[1].equals(null)){
			adGoodsCount[1] = "0";
		}
		log.debug("게시물의 갯수 : " + adBoardCount);
		log.debug("첫번째 광고 게시물의 최저온도/최고온도 : " + minTemp[0] +"/"+maxTemp[0]);
		log.debug("두번째 광고 게시물의 최저온도/최고온도 : " + minTemp[1] +"/"+maxTemp[1]);
		log.debug("첫번째 광고 게시물의 광고의 갯수 : " + adGoodsCount[0]);
		log.debug("두번째 광고 게시물의 광고의 갯수 : " + adGoodsCount[1]);
		log.debug("첫번째 광고 게시물의 내용 : " +  content[0]);
		log.debug("두번째 광고 게시물의 내용 : " +  content[1]);
		log.debug("첫번쨰 광고 게시물 상품 갯수 : " + adGoodsCount[0]);
		log.debug("두번째 광고 게시물 상품 갯수 : " + adGoodsCount[1]);
		log.debug("adBoardImage : " + adBoardImages);
		log.debug("adGoodsImage : " + adGoodsImages);
		log.debug("adGoodsLink : " + links);
		for(int i = 0; i < adBoardCount; i++){
			int initBoardno = 1;
			AdBoardDto adboard = new AdBoardDto();
			String lastboardno = adboarddao.selectBoardNo();
			if(lastboardno != null){
				initBoardno = Integer.parseInt(lastboardno) + initBoardno;
			}
			log.debug("입력될 BoardNo : " + "ad_board_" + initBoardno);
			adboard.setAdBoardNo("ad_board_" + initBoardno);
			adboard.setAdBoardImg(utilfile.fileUpload(multipartRequest, adBoardImages.get(i)));
			adboard.setAdContractNo(adcontractno);
			adboard.setAdBoardTempMax(maxTemp[i]);
			adboard.setAdBoardTempMin(minTemp[i]);
			adboard.setAdBoardContent(content[i]);
			for(int j = k; j < k+Integer.parseInt(adGoodsCount[i]); j++){
				int initGoodsno = 1;
				AdGoodsDto adgoods = new AdGoodsDto();
				String lastgoodsno = adboarddao.selectGoodsNo();
				if(lastgoodsno != null ){
					initGoodsno = Integer.parseInt(lastgoodsno) + initGoodsno;
				}
				log.debug("입력되는 정보 ");
				log.debug("goods_no : " + "ad_goods_"+initGoodsno);
				log.debug("goods_link : " + links[j]);
				log.debug("goods_img : "+ adGoodsImages.get(j));
				adgoods.setAdGoodsNo("ad_goods_"+initGoodsno);
				adgoods.setAdGoodsLink(links[j]);
				adgoods.setAdGoodsImg(utilfile.fileUpload(multipartRequest, adGoodsImages.get(j)));
				adgoodsdao.insertAdGoods(adgoods);
				adboard.setAdBoardGoods1(adgoods.getAdGoodsNo());
				if(Integer.parseInt(adGoodsCount[i])==1){
					adboard.setAdBoardGoods2(null);
					log.debug("한개 건너뜀");
					log.debug("i : " + i + " j :" + j + "k : " + k);
					k=k+1;
					break;
				}else{
				adgoods.setAdGoodsNo("ad_goods_"+(initGoodsno+1));
				adgoods.setAdGoodsLink(links[j+1]);
				adgoods.setAdGoodsImg(utilfile.fileUpload(multipartRequest, adGoodsImages.get(j+1)));
				adgoodsdao.insertAdGoods(adgoods);
				adboard.setAdBoardGoods2(adgoods.getAdGoodsNo());
				log.debug("i : " + i + " j :" + j + "k : " + k);
				break;
				}
			}
			k = k + Integer.parseInt(adGoodsCount[i]);
			log.debug(adboard.toString());
			adboarddao.insertAdBoard(adboard);
		}
		adcontractdao.updateContractStatAdWait(adcontractno);
		return "redirect:/adContractList";	
	}	
	}
	
	