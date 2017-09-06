package com.ksmart.harulook.adboard.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ksmart.harulook.util.UtilFile;
import com.ksmart.harulook.adboard.service.AdBoardDao;
import com.ksmart.harulook.adboard.service.AdBoardDto;
import com.ksmart.harulook.adcontract.service.AdContractDao;
import com.ksmart.harulook.adgoods.service.AdGoodsDao;
import com.ksmart.harulook.adgoods.service.AdGoodsDto;

@Controller
public class AdBoardController {
	@Autowired
	private AdBoardDao adboarddao;
	@Autowired
	private UtilFile utilfile;
	@Autowired
	private AdContractDao adcontractdao;
	@Autowired
	private AdGoodsDao adgoodsdao;
	
	
	@RequestMapping(value="/adBoardUpdate",method = RequestMethod.POST)
	public String selectAdBoardUpdate(HttpServletRequest request
									 ,HttpSession session) {
		String adcontractno = (String)session.getAttribute("adContractNo");
		int k=0;
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		int adBoardCount = Integer.parseInt(request.getParameter("adBoardCount"));
		System.out.println("광고 게시물 입력 요청");
		String adGoodsCount[] = request.getParameterValues("adGoodsCount");
		String minTemp[] = request.getParameterValues("adBoardTempMin");
		String maxTemp[] = request.getParameterValues("adBoardTempMax");
		String content[] = request.getParameterValues("adBoardContent");
		String adGoodsNo[] = request.getParameterValues("adGoodsNo");
		String adBoardNo[] = request.getParameterValues("adBoardNo");
		if(adGoodsCount[1].equals(null)){
			adGoodsCount[1] = "0";
		}
		System.out.println("게시물의 갯수 : " + adBoardCount);
		System.out.println("첫번째/두번째 광고게시물 번호 : " + adBoardNo[0] + "/" + adBoardNo[1]);
		System.out.println("첫번째/두번째/세번째/네번째 광고 광고 번호 : " + adGoodsNo[0] + "/" + adGoodsNo[1] + "/" + adGoodsNo[2] + "/" + adGoodsNo[3]);
		System.out.println("첫번째 광고 게시물의 최저온도/최고온도 : " + minTemp[0] +"/"+maxTemp[0]);
		System.out.println("두번째 광고 게시물의 최저온도/최고온도 : " + minTemp[1] +"/"+maxTemp[1]);
		System.out.println("첫번째 광고 게시물의 광고의 갯수 : " + adGoodsCount[0]);
		System.out.println("두번째 광고 게시물의 광고의 갯수 : " + adGoodsCount[1]);
		System.out.println("첫번째 광고 게시물의 내용 : " +  content[0]);
		System.out.println("두번째 광고 게시물의 내용 : " +  content[1]);
		String[] links = request.getParameterValues("adGoodsLink");
		List<MultipartFile> adGoodsImages = multipartRequest.getFiles("adGoodsImage");
		List<MultipartFile> adBoardImages = multipartRequest.getFiles("adBoardImage");
		System.out.println("첫번쨰 광고 게시물 상품 갯수 : " + adGoodsCount[0]);
		System.out.println("두번째 광고 게시물 상품 갯수 : " + adGoodsCount[1]);
		System.out.println("adBoardImage : " + adBoardImages);
		System.out.println("adGoodsImage : " + adGoodsImages);
		System.out.println("adGoodsLink : " + request.getParameterValues("adGoodsLink"));
		for(int i = 0; i<adBoardNo.length; i++){
			adboarddao.deleteAdBoard(adBoardNo[i]);
		}
		for(int i = 0; i<adGoodsNo.length; i++){
			adgoodsdao.deleteAdGoods(adGoodsNo[i]);
		}
		
		for(int i = 0; i < adBoardCount; i++){
			int initBoardno = 1;
			AdBoardDto adboard = new AdBoardDto();
			String lastboardno = adboarddao.getBoardNo();
			if(lastboardno != null){
				initBoardno = Integer.parseInt(lastboardno) + initBoardno;
			}
			
			System.out.println("입력될 BoardNo : " + "ad_board_" + initBoardno);
			adboard.setAdBoardNo("ad_board_" + initBoardno);
			adboard.setAdBoardImage(utilfile.fileUpload(multipartRequest, adGoodsImages.get(i)));
			adboard.setAdContractNo(adcontractno);
			adboard.setAdBoardTempMax(maxTemp[i]);
			adboard.setAdBoardTempMin(minTemp[i]);
			adboard.setAdBoardContent(content[i]);
			for(int j = k; j < k+Integer.parseInt(adGoodsCount[i]); j++){
				int initGoodsno = 1;
				AdGoodsDto adgoods = new AdGoodsDto();
				String lastgoodsno = adboarddao.getGoodsNo();
				if(lastgoodsno != null ){
					initGoodsno = Integer.parseInt(lastgoodsno) + initGoodsno;
				}
				System.out.println("입력될 GoodsNo : " + "ad_goods_" + initGoodsno);
				System.out.println("입력되는 정보 ");
				System.out.println("goods_no : " + "ad_goods_"+initGoodsno);
				if(links[j].equals("")){
					links[j] = links[j+1];
					adGoodsImages.set(j, adBoardImages.get(j+1));
					k=k+1;
					System.out.println("한개 더함");
					adboard.setAdBoardGoods1("ad_goods_"+initGoodsno);
					adboard.setAdBoardGoods2(null);
				}else{
				System.out.println("링크 : " + links[j]);
				System.out.println("이미지 : "+ adGoodsImages.get(j) );
				adgoods.setAdGoodsNo("ad_goods_"+initGoodsno);
				adgoods.setAdGoodsLink(links[j]);
				adgoods.setAdGoodsImage(utilfile.fileUpload(multipartRequest, adGoodsImages.get(j)));
				adboard.setAdBoardGoods1("ad_goods_"+(initGoodsno-1));
				adboard.setAdBoardGoods2("ad_goods_"+(initGoodsno));
				adgoodsdao.insertAdGoods(adgoods);
				}
			}
			k = k + Integer.parseInt(adGoodsCount[i]);
			
			System.out.println(adboard.toString());
			adboarddao.insertAdBoard(adboard);
			adcontractdao.adWait(adcontractno);
		}
		System.out.println(adBoardImages.get(0));
		return "redirect:/adContractList";
	}
	
	
	@RequestMapping(value="/adBoardUpdate",method = RequestMethod.GET)
	public String selectAdBoardUpdateForm(Model model
										 ,@RequestParam("adContractNo") String adcontractno
										 ,HttpSession session) {
		session.setAttribute("adContractNo", adcontractno);
		int k = 0;
		int adboardcount = 0;
		System.out.println("광고 게시물 수정 화면 요청");
		System.out.println("adContractNo : " + adcontractno);
		List<AdBoardDto> adboard = adboarddao.selectAdBoardByContractId(adcontractno);
		System.out.println("게시물 갯수 : " + adboard.size());
		AdBoardDto[] adboardlist = new AdBoardDto[adboard.size()];
		System.out.println("게시물 갯수 : " + adboardlist.length);
		String[] goodsno = new String[adboardlist.length*2];
		int [] goodscount = new int[adboardlist.length];
		for(int j=0; j<adboard.size(); j++){
			adboardlist[j] = adboard.get(j);
		}
		for(int j=0; j<adboardlist.length; j++){
				goodsno[k] = adboardlist[j].getAdBoardGoods1();
				System.out.println(k);
				if(adboardlist[j].getAdBoardGoods1()!=null){
					if(adboardlist[j].getAdBoardGoods2()!=null){
						goodsno[k+1] = adboardlist[j].getAdBoardGoods2();
						k=k+2;
						adboardcount=2;
						goodscount[j]=2;
						continue;
					}else{
						k++;
						goodscount[j]=1;
					}
				}else{
					adboardcount=1;
					break;
				}

		}
		AdGoodsDto[] adgoods = new AdGoodsDto[goodsno.length];
		for(int i=0; i<goodsno.length; i++){
			adgoods[i] = adgoodsdao.selectAdGoods(goodsno[i]);
		}
		model.addAttribute("adboardlist", adboardlist);
		model.addAttribute("adgoods", adgoods);
		model.addAttribute("adboardcount", adboardcount);
		model.addAttribute("goodscount", goodscount);
		System.out.println(model.toString());
		return "ad/board/ad_board_update";	
	}
	
	@RequestMapping(value="/adBoardList",method = RequestMethod.GET)
	public String selectAdBoardList(Model model) {
		System.out.println("광고 게시물 목록 요청");
		List<AdBoardDto> adboardlist = adboarddao.selectAdBoard();
		model.addAttribute("adboardlist", adboardlist);
		System.out.println(model);
		return "ad/board/ad_board_list";	
	}
	
	@RequestMapping(value="/insertAdBoard",method = RequestMethod.GET)
	public String insertAdBoardView(@RequestParam("adContractNo") String adcontractno
								 ,HttpSession session) {
		System.out.println("adContractNo : " + adcontractno);
		session.setAttribute("adContractNo", adcontractno);
		System.out.println("광고 게시물 입력 폼 요청");
		return "ad/board/ad_board_insert";	
	}
	@RequestMapping(value="/insertAdBoard",method = RequestMethod.POST)
	public String insertAdBoard(HttpServletRequest request
							   ,HttpSession session) {
		int k=0;
		String adcontractno = (String) session.getAttribute("adContractNo");
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		int adBoardCount = Integer.parseInt(request.getParameter("adBoardCount"));
		System.out.println("광고 게시물 입력 요청");
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
		System.out.println("게시물의 갯수 : " + adBoardCount);
		System.out.println("첫번째 광고 게시물의 최저온도/최고온도 : " + minTemp[0] +"/"+maxTemp[0]);
		System.out.println("두번째 광고 게시물의 최저온도/최고온도 : " + minTemp[1] +"/"+maxTemp[1]);
		System.out.println("첫번째 광고 게시물의 광고의 갯수 : " + adGoodsCount[0]);
		System.out.println("두번째 광고 게시물의 광고의 갯수 : " + adGoodsCount[1]);
		System.out.println("첫번째 광고 게시물의 내용 : " +  content[0]);
		System.out.println("두번째 광고 게시물의 내용 : " +  content[1]);
		System.out.println("첫번쨰 광고 게시물 상품 갯수 : " + adGoodsCount[0]);
		System.out.println("두번째 광고 게시물 상품 갯수 : " + adGoodsCount[1]);
		System.out.println("adBoardImage : " + adBoardImages);
		System.out.println("adGoodsImage : " + adGoodsImages);
		System.out.println("adGoodsLink : " + links);
		for(int i = 0; i < adBoardCount; i++){
			int initBoardno = 1;
			AdBoardDto adboard = new AdBoardDto();
			String lastboardno = adboarddao.getBoardNo();
			if(lastboardno != null){
				initBoardno = Integer.parseInt(lastboardno) + initBoardno;
			}
			System.out.println("입력될 BoardNo : " + "ad_board_" + initBoardno);
			adboard.setAdBoardNo("ad_board_" + initBoardno);
			adboard.setAdBoardImage(utilfile.fileUpload(multipartRequest, adGoodsImages.get(i)));
			adboard.setAdContractNo(adcontractno);
			adboard.setAdBoardTempMax(maxTemp[i]);
			adboard.setAdBoardTempMin(minTemp[i]);
			adboard.setAdBoardContent(content[i]);
			for(int j = k; j < k+Integer.parseInt(adGoodsCount[i]); j++){
				int initGoodsno = 1;
				AdGoodsDto adgoods = new AdGoodsDto();
				String lastgoodsno = adboarddao.getGoodsNo();
				if(lastgoodsno != null ){
					initGoodsno = Integer.parseInt(lastgoodsno) + initGoodsno;
				}
				System.out.println("입력될 GoodsNo : " + "ad_goods_" + initGoodsno);
				System.out.println("입력되는 정보 ");
				System.out.println("goods_no : " + "ad_goods_"+initGoodsno);
				if(Integer.parseInt(adGoodsCount[i])==1){
					System.out.println("링크 : " + links[j]);
					System.out.println("이미지 : "+ adGoodsImages.get(j));
					adgoods.setAdGoodsNo("ad_goods_"+initGoodsno);
					adgoods.setAdGoodsLink(links[j]);
					adgoods.setAdGoodsImage(utilfile.fileUpload(multipartRequest, adGoodsImages.get(j)));
/*					links[j] = links[j+1];
					adGoodsImages.set(j, adBoardImages.get(j+1));*/
					k=k+2;
					System.out.println("한개 건너뜀");
					adboard.setAdBoardGoods1("ad_goods_"+initGoodsno);
					adboard.setAdBoardGoods2(null);
					break;
				}else{
				System.out.println("링크 : " + links[j]);
				System.out.println("이미지 : "+ adGoodsImages.get(j));
				adgoods.setAdGoodsNo("ad_goods_"+initGoodsno);
				adgoods.setAdGoodsLink(links[j]);
				adgoods.setAdGoodsImage(utilfile.fileUpload(multipartRequest, adGoodsImages.get(j)));
				adboard.setAdBoardGoods1("ad_goods_"+(initGoodsno-1));
				adboard.setAdBoardGoods2("ad_goods_"+(initGoodsno));
				adgoodsdao.insertAdGoods(adgoods);
				}
			}
			k = k + Integer.parseInt(adGoodsCount[i]);
			
			System.out.println(adboard.toString());
			adboarddao.insertAdBoard(adboard);
			adcontractdao.adWait(adcontractno);
		}
		System.out.println(adBoardImages.get(0));
		return "redirect:/adContractList";	
	}	
	}
	
	