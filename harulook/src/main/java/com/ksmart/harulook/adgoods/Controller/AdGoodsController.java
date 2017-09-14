package com.ksmart.harulook.adgoods.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ksmart.harulook.adgoods.service.AdGoodsDto;
import com.ksmart.harulook.adgoods.service.AdGoodsInterface;
import com.ksmart.harulook.util.UtilFile;

@Controller
public class AdGoodsController {
	@Autowired
	private AdGoodsInterface adgoodsdao;
	@Autowired
	private UtilFile utilfile;
	
	@RequestMapping(value="/updateGoods", method = RequestMethod.POST)
	public String updateGoods(HttpServletRequest request){
		AdGoodsDto adgoods = new AdGoodsDto();
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile img = multipartRequest.getFile("adGoodsImage");
		String adgoodsno = request.getParameter("adGoodsNo");
		String adgoodsimage = utilfile.fileUpload(multipartRequest, img);
		String adgoodslink = request.getParameter("adGoodsLink");
		adgoods.setAdGoodsNo(adgoodsno);
		adgoods.setAdGoodsImg(adgoodsimage);
		adgoods.setAdGoodsLink(adgoodslink);
		System.out.println("adgoodsno : " + adgoodsno);
		System.out.println("adgoodsimage : " + adgoodsimage);
		System.out.println("adgoodslink : " + adgoodslink);
		adgoodsdao.updateAdGoods(adgoods);
		return "redirect:/adBoardList";
	}
	
	@RequestMapping(value="/updateGoodsForm", method = RequestMethod.POST)
	public String updateGoodsForm(Model model
									,@RequestParam("adBoardGoodsNo") String adGoodsNo){
		AdGoodsDto adgoods = adgoodsdao.selectAdGoods(adGoodsNo);
		model.addAttribute("adgoods", adgoods);
		System.out.println(model);
		System.out.println("수정화면");
		return "ad/goods/ad_goods_update";
	}
	@RequestMapping(value="/selectAdBoardGoods", method = RequestMethod.GET)
	public String selectAdBoardGoods(Model model
									,@RequestParam("adBoardGoodsNo") String adGoodsNo){
		AdGoodsDto adgoods = adgoodsdao.selectAdGoods(adGoodsNo);
		model.addAttribute("adgoods", adgoods);
		System.out.println(model);
		return "ad/goods/ad_goods_detail";
	}
	
}
