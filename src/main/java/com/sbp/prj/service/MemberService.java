package com.sbp.prj.service;

import java.util.Map;

import com.sbp.prj.dto.MemberDTO;

public interface MemberService {
	
	int join(Map<String , Object> map);
	
	MemberDTO login(String uid, String upw);

	MemberDTO memberInfo(String uid);
	
	Integer memberMod(Map<String, Object>map);

	boolean memberModPw(String upw, String newPw, String uid);

	boolean memberQuit(String uid, String upw);

	String getUname(String uid);
}
