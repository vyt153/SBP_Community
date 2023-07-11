package com.sbp.prj.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sbp.prj.service.GalleryService;
import com.sbp.prj.service.MemberService;

@Controller
public class GalleryController {
	
	@Autowired
	GalleryService galleryService;
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/galleryList")
	public String galleryList(Model model) {
		model.addAttribute("galleryList", galleryService.galleryList());
		model.addAttribute("galleryCount", galleryService.galleryCount("", ""));
		return "gallery/list";
	}
	
	@RequestMapping("/gallerySearch")
	public String gallerySearch(Model model, String keyField, String keyWord) {
		model.addAttribute("galleryList", galleryService.gallerySearch(keyField, keyWord));
		model.addAttribute("galleryCount", galleryService.galleryCount(keyField, keyWord));
		return "gallery/list";
	}
	
	@RequestMapping("/galleryWritePage")
	public String writePage(Model model, String uid) {
		String uname = memberService.getUname(uid);
		model.addAttribute("uname", uname);
		return "gallery/write";
	}
	
	@RequestMapping("/galleryWrite")
	public String write(HttpServletRequest req) throws Exception {
		galleryService.write(req);
		return "redirect:galleryList";
	}
	
	@RequestMapping("/galleryRead")
	public String write(Model model, int num){
		galleryService.readCount(num);
		model.addAttribute("gallery", galleryService.read(num));
		return "gallery/read";
	}
	
	@RequestMapping("/galleryModPage")
	public String galleryModPage(Model model, int num){
		model.addAttribute("gallery", galleryService.read(num));
		return "/gallery/modify";
	}
	
	@RequestMapping("/galleryMod")
	public String galleryMod(Model model, HttpServletRequest req) throws Exception{
		galleryService.galleryMod(req);
		return "redirect:galleryList";
	}
	
	@RequestMapping("/galleryDelete")
	public String galleryDelete(int num){
		galleryService.delete(num);
		return "redirect:galleryList";
	}
	
}
