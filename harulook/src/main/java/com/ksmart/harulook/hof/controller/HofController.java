package com.ksmart.harulook.hof.controller;

import java.util.ArrayList;
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

	/*이번 달 명예의 전당보기*/
	@RequestMapping(value = "/getLikeRank", method = RequestMethod.GET)
	public String getLikeRank(Model model){
		List<HofDto> list = dao.getHofList();
		model.addAttribute("list",list);
		return "hof/hof_list";
	}
	
	/*이번 달 명예의전당 등록*/
	public void insertHof(){
		HofDto dto = new HofDto();
		List<HofRankDto> list = dao.getBoardLikeRank();
		for(int n =0,rank=1; rank<4;n++){
			String boardNo = list.get(n).getBoardNo();
			System.out.println(boardNo);
			int r = list.get(n).getRank();
			int nextr = list.get(n+1).getRank();
			int result = dao.selectDuplicateHof(boardNo);
			
			if(result==0){//명예의전당에 등록된 게시물 아닐때
				dto.setBoardNo(boardNo);
				dto.setHofRank(rank);
				switch(rank){//등수에 따른 상품
				case 1 :dto.setPointPolicyNo("point_ex_6");break;
				case 2 :dto.setPointPolicyNo("point_ex_7");break;
				case 3 :dto.setPointPolicyNo("point_ex_8");break;
				default : break;
				}
				dao.insertHof(dto);
				if(r!=nextr){//이번게시물과 다음게시물이 같은등수가 아닐때만 등수를 증가시킨다.
					rank++;
				}
				
			}
		}
		System.out.println("insertHof종료");
		}

}
