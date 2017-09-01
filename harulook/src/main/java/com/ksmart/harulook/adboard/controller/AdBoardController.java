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
import com.ksmart.harulook.adgoods.service.AdGoodsDto;

@Controller
public class AdBoardController {
	@Autowired
	private AdBoardDao adboarddao;
	@Autowired
	private UtilFile utilfile;
	@Autowired
	private AdContractDao adcontractdao;
	
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
		String[] links = request.getParameterValues("adGoodsLink");
		List<MultipartFile> adGoodsImages = multipartRequest.getFiles("adGoodsImage");
		List<MultipartFile> adBoardImages = multipartRequest.getFiles("adBoardImage");
		System.out.println("첫번쨰 광고 게시물 상품 갯수 : " + adGoodsCount[0]);
		System.out.println("두번째 광고 게시물 상품 갯수 : " + adGoodsCount[1]);
		System.out.println("adBoardImage : " + adBoardImages);
		System.out.println("adGoodsImage : " + adGoodsImages);
		System.out.println("adGoodsLink : " + request.getParameterValues("adGoodsLink"));

		
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
				adboarddao.insertAdGoods(adgoods);
				}
			}
			k = k + Integer.parseInt(adGoodsCount[i]);
			
			System.out.println(adboard.toString());
			adboarddao.insertAdBoard(adboard);
			adcontractdao.adWait(adcontractno);
		}
		System.out.println(adBoardImages.get(0));
		return "redirect:/home";	
	}	
	}
	
	