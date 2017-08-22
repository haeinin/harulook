package com.ksmart.harulook.hof.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ksmart.harulook.hof.service.HofDao;
import com.ksmart.harulook.hof.service.HofDto;
import com.ksmart.harulook.hof.service.HofRankDto;

@Controller
public class HofController {
	@Autowired
	private HofDao dao;

	@RequestMapping(value = "/getLikeRank", method = RequestMethod.GET)
	public String getLikeRank(Model model){

		List<HofDto> list = dao.getHofList();
		model.addAttribute("list",list);
		return "hof/hof_list";
	}
	@RequestMapping(value = "/rank", method = RequestMethod.GET)
	public String rank(){
		return "hof/hof_list";
	}
	
	/*이번 달 명예의전당 등록*/
	public void insertHof(){
		HofDto dto = new HofDto();
		List<HofRankDto> list = dao.getBoardLikeRank();
		for(int n =0;n<list.size();n++){
			int rank = list.get(n).getRank();
			
			if(rank < 4){
				System.out.println("if문실행 rank="+n);
				dto.setBoardNo(list.get(n).getBoardNo());
				dto.setHofRank(rank);
					switch(rank){
					case 1 :dto.setPointPolicyNo("point_ex_6");break;
					case 2 :dto.setPointPolicyNo("point_ex_7");break;
					case 3 :dto.setPointPolicyNo("point_ex_8");break;
					default : break;
					}
					dao.insertHof(dto);
				}
			
			}
		System.out.println("insertHof종료");
		}

}
