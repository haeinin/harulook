package com.ksmart.harulook.mall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ksmart.harulook.mall.service.MallInterface;

@RestController
public class MallRestController {

	@Autowired
	private MallInterface dao;
	
	/*할인 코드 유효한지 검사*/
	@RequestMapping(value="/validCooContractCode", method = RequestMethod.POST)
	public String cooContractCode(@RequestParam(value="cooContractCode", required=true) String cooContractCode){
		System.out.println("controller 할인코드확인 => " + cooContractCode);
		String vaildDC = dao.selectCooContractCode(cooContractCode);
		if(vaildDC == null){
			vaildDC = "";
		}
        System.out.println("할인코드확인 받아온 코드 == "+vaildDC);
        return vaildDC;  //아이디중복체크후 화면 그대로
    }
}
