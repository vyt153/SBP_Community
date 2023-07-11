package com.sbp.prj.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.sbp.prj.service.BoardService;
import com.sbp.prj.service.MemberService;
import com.sbp.prj.util.PagingVO;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/")
	public String root(@SessionAttribute(name="uidSession", required = false) String uidSession, Model model) {
		model.addAttribute("uidSession", uidSession);
		return "redirect:boardList";
	}
	
	@RequestMapping("/boardList")
	public String boardList(Model model, PagingVO vo
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		int total = boardService.boardCount("", "");
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("boardList", boardService.boardList(vo));
		model.addAttribute("boardCount", total);
		return "bbs/list";
	}
	
	@RequestMapping("/boardSearch")
	public String boardSearch(Model model, String keyField, String keyWord) {
		model.addAttribute("boardList", boardService.boardSearch(keyField, keyWord));
		model.addAttribute("boardCount", boardService.boardCount(keyField, keyWord));
		return "bbs/list";
	}
	
	@RequestMapping("/boardWritePage")
	public String writePage(Model model, String uid) {
		String uname = memberService.getUname(uid);
		model.addAttribute("uname", uname);
		return "bbs/write";
	}
	
	@RequestMapping("/boardWrite")
	public String write(HttpServletRequest req) throws Exception {
		boardService.write(req);
		return "redirect:boardList";
	}
	
	@RequestMapping("/boardRead")
	public String write(Model model, int num){
		boardService.readCount(num);
		model.addAttribute("board", boardService.read(num));
		return "bbs/read";
	}
	
	@RequestMapping("/boardModPage")
	public String boardModPage(Model model, int num){
		model.addAttribute("board", boardService.read(num));
		return "/bbs/modify";
	}
	
	@RequestMapping("/boardMod")
	public String boardMod(Model model, HttpServletRequest req) throws Exception{
		boardService.boardMod(req);
		return "redirect:/";
	}
	
	@RequestMapping("/boardDelete")
	public String boardDelete(int num){
		boardService.delete(num);
		return "redirect:boardList";
	}
	
}
