package com.ksmart.harulook.mall;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ksmart.harulook.dto.MallDto;

@Controller
public class MallController {

	@Autowired
	private MallDao dao;
	
	@RequestMapping(value="/mallDetail", method = RequestMethod.GET)
    public String mallDetail(Model model
    						,@RequestParam(value="mallProNo",required=true) String mallProNo){
		MallDto dto = dao.getMallPro(mallProNo);
		model.addAttribute("dto", dto);
		System.out.println("controller : "+mallProNo);
		return "mall/mall_detail";
    	
    }
   /* @RequestMapping(value="/mallDetail", method = RequestMethod.GET)
    public String mallDetail(){
    	
		return "mall/mall_detail";
    	*/
    
    @RequestMapping(value="/mallList", method = RequestMethod.GET)
    public String mallList(Model model){
    	List<MallDto> list = dao.getMallProList();
    	model.addAttribute("list",list);
    	System.out.println("list이다");
    	System.out.println(model);
		return "mall/mall_list";
    	
    }

    	
}