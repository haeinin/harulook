package com.ksmart.harulook.hof.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ksmart.harulook.hof.service.HofDto;
import com.ksmart.harulook.hof.service.HofInterface;

@Controller
public class HofController {
	@Autowired
	private HofInterface dao;


	/*이번 달 명예의 전당보기*/
	@RequestMapping(value = "/hof", method = RequestMethod.GET)
	public String getLikeRank(Model model){
		List<HofDto> list = dao.selectHofList();
		model.addAttribute("list",list);
		return "hof/hof_list";
	}
	
	
}
