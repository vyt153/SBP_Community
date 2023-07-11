package com.sbp.prj.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sbp.prj.dto.MemberDTO;
import com.sbp.prj.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/loginPage")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping("/login")
	public String login(HttpSession ses, HttpServletRequest req) {
		String uid = req.getParameter("uid");
		String upw = req.getParameter("upw");
		MemberDTO memberDTO = memberService.login(uid, upw);
		
		if(memberDTO!=null) {
			ses.setAttribute("uidSession", memberDTO.getUid());
			return "redirect:/";
		} else {
			req.setAttribute("login", false);
			return "member/login";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession ses) {
		ses.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/joinAgreement")
	public String joinAgreement() {
		return "member/joinAgreement";
	}
	
	@RequestMapping("/member")
	public String member() {
		return "member/member";
	}
	
	@RequestMapping("/join")
	public String join(HttpServletRequest req) {
		Map<String, Object> map= new HashMap<>();
		map.put("p1", req.getParameter("uid"));
		map.put("p2", req.getParameter("upw"));
		map.put("p3", req.getParameter("uname"));
		map.put("p4", req.getParameter("uemail"));
		map.put("p5", req.getParameter("gender"));
		map.put("p6", req.getParameter("ubirthday"));
		map.put("p7", req.getParameter("uzipCode"));
		map.put("p8", req.getParameter("uaddr"));
		map.put("p9", req.getParameterValues("uhobby"));
		map.put("p10", req.getParameter("ujob"));
		
		memberService.join(map);
		return "redirect:/";
	}
	
	@RequestMapping("/zipCode")
	public String zipCode() {
		return "member/zipCheck";
	}
	
	@RequestMapping("/idCheck")
	public String idCheck() {
		return "member/idCheck";
	}
	
	@RequestMapping("/mypage")
	public String mypage(String uid, Model model) {
		MemberDTO memberDTO = memberService.memberInfo(uid);
		model.addAttribute("memberInfo", memberDTO);
		model.addAttribute("mypage", true);
		return "member/mypage";
	}
	
	@RequestMapping("/memberModPage")
	public String memberModPage(String uid, Model model) {
		model.addAttribute("memberInfo", memberService.memberInfo(uid));
		model.addAttribute("mypage", true);
		return "member/memberMod";
	}
	
	@RequestMapping("/memberMod")
	public String memberMod(HttpServletRequest req) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		String uid = req.getParameter("uid");
		String uname = req.getParameter("uname");
		String uemail = req.getParameter("uemail");
		String gender = req.getParameter("gender");
		String ubirthday = req.getParameter("ubirthday");
		String uzipCode = req.getParameter("uzipcode");
		String uaddr = req.getParameter("uaddr");
		String[] uhobby = req.getParameterValues("uhobby");
		String ujob = req.getParameter("ujob");
		int num = Integer.parseInt(req.getParameter("num"));
		
		map.put("p1", uname);
		map.put("p2", uemail);
		map.put("p3", gender);
		map.put("p4", ubirthday);
		map.put("p5", uzipCode);
		map.put("p6", uaddr);
		map.put("p7", uhobby);
		map.put("p8", ujob);
		map.put("p9", num);
		
		memberService.memberMod(map);
		return "redirect:mypage?uid="+uid;
	}
	
	@RequestMapping("memberModPwPage")
	public String memberModPwPage(Model model, String uid) {
		model.addAttribute("mypage", true);
		return "member/memberModPw";
	}
	
	@RequestMapping("memberModPw")
	public String memberModPwPage(Model model, String uid, String upw, String newPw) {
		if(memberService.memberModPw(upw, newPw, uid)) {
			model.addAttribute("memberModPw", true);
		} else {
			model.addAttribute("mypage", true);
			model.addAttribute("memberModPw", false);
		}
		return "member/memberModPw";
	}
	
	@RequestMapping("mypageAccessList")
	public String mypageAccessList(Model model, String uid) {
		model.addAttribute("mypage", true);
		return "member/mypageAccessList";
	}
	
	@RequestMapping("memberQuitPage")
	public String memberQuitPage(Model model, String uid, String upw, String newPw) {
			model.addAttribute("mypage", true);
		return "member/memberQuit";
	}
	
	@RequestMapping("memberQuit")
	public String memberQuit(Model model, String uid, String upw, HttpSession ses) {
		if(memberService.memberQuit((String)ses.getAttribute("uidSession"), upw)){
			model.addAttribute("memberQuit", true);
		} else {
			model.addAttribute("mypage", true);
			model.addAttribute("memberQuit", false);
		}
		return "member/memberQuit";
	}
	
}
