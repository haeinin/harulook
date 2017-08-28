package com.ksmart.harulook.adboard.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ksmart.harulook.adgoods.AdGoodsDto;
import com.ksmart.harulook.util.UtilFile;
import com.ksmart.harulook.adboard.service.AdBoardDao;
import com.ksmart.harulook.adboard.service.AdBoardDto;

@Controller
public class AdBoardController {
	@Autowired
	private AdBoardDao adboarddao;
	@Autowired
	private UtilFile utilfile;
	
	@RequestMapping(value="/insertAdBoard",method = RequestMethod.GET)
	public String insertAdBoardView(@RequestParam("adContractNo") String adcontractno
								 ,HttpSession session) {
		System.out.println("adContractNo : " + adcontractno);
		session.setAttribute("adContractNo", adcontractno);
		System.out.println("광고 게시물 입력 폼 요청");
		return "ad/board/ad_board_insert";	
	}
	@RequestMapping(value="/insertAdBoard",method = RequestMethod.POST)
	public String insertAdBoard(HttpServletRequest request) {
		int k=0;
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		int adBoardCount = Integer.parseInt(request.getParameter("adBoardCount"));
		System.out.println("광고 게시물 입력 요청");
		String adGoodsCount[] = request.getParameterValues("adGoodsCount");
		if(adGoodsCount[1].equals(null)){
			adGoodsCount[1] = "0";
		}
		System.out.println("첫번째 광고 게시물의 광고의 갯수 : " + adGoodsCount[0]);
		System.out.println("첫번째 광고 게시물의 광고의 갯수 : " + adGoodsCount[1]);
		int adGoodsCountSum = Integer.sum(Integer.parseInt(adGoodsCount[0]),Integer.parseInt(adGoodsCount[1]));
		String[] img = new String[adGoodsCountSum];
		String[] links = request.getParameterValues("adGoods1Link");
		List<MultipartFile> adGoodsImages = multipartRequest.getFiles("adGoodsImage");
		List<MultipartFile> adBoardImages = multipartRequest.getFiles("adBoardImage");
		System.out.println("첫번쨰 광고 게시물 상품 갯수 : " + adGoodsCount[0]);
		System.out.println("두번째 광고 게시물 상품 갯수 : " + adGoodsCount[1]);
		System.out.println("adBoardImage : " + adBoardImages);
		System.out.println("adGoodsImage : " + adGoodsImages);
		System.out.println("adGoodsLink : " + request.getParameterValues("adGoodsLink"));
		
		for(int i = 0; i< adGoodsCountSum; i++){
			utilfile.fileUpload(multipartRequest, adGoodsImages.get(i));
		}
		
		for(int i = 0; i < adBoardCount; i++){
			for(int j = k; j < k+Integer.parseInt(adGoodsCount[i]); j++){
				int initGoodsno = 1;
				AdGoodsDto adgoods = new AdGoodsDto();
				String lastgoodsno = adboarddao.getGoodsNo();
				if(lastgoodsno != null ){
					initGoodsno = Integer.parseInt(lastgoodsno) + initGoodsno;
				}
				System.out.println("입력될 GoodsNo : " + "ad_goods_no" + initGoodsno);
				System.out.println("입력되는 정보 : " + "ad_goods_no"+initGoodsno+"/"+ links[j] +"/" + adGoodsImages.get(j) );
				adgoods.setAdGoodsNo("ad_goods_no"+initGoodsno);
				adgoods.setAdGoodsLink(links[j]);
				adgoods.setAdGoodsImg(img[j]);
				adboarddao.insertAdGoods(adgoods);
				k = k + Integer.parseInt(adGoodsCount[i]);
			}
			
		}
		System.out.println(adBoardImages.get(0));
		return "redirect:/home";	
	}	
	}
	
	