package com.ksmart.harulook.like.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ksmart.harulook.like.service.LikeDao;
import com.ksmart.harulook.like.service.LikeDto;

@Controller
public class LikeController {

	@Autowired
	private LikeDao likeDao;
	
	@RequestMapping(value="/likeInsert", method = RequestMethod.GET)
	public String likeInsert(LikeDto like) {
		
		return "";
	}
}
