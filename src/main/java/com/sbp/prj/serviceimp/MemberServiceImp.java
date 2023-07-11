package com.sbp.prj.serviceimp;

import java.util.Arrays;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sbp.prj.dao.MemberDAO;
import com.sbp.prj.dto.MemberDTO;
import com.sbp.prj.service.MemberService;

@Service
public class MemberServiceImp implements MemberService {
	
	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public int join(Map<String, Object> map) {
		String[] arr = (String[]) map.get("p9");
		String[] hobby = {"인터넷","여행","게임","영화","운동"};
		String[] uhobby = {"0","0","0","0","0"};
		if(arr!=null) {
			for (int i = 0; i < hobby.length; i++) {
				for (int j = 0; j < arr.length; j++) {
					if(hobby[i].equals(arr[j])) uhobby[i] = "1";
				}
			}
		}
		map.replace("p9", Arrays.toString(uhobby));
		return memberDAO.join(map);
	}

	@Override
	public MemberDTO login(String uid, String upw) {
		return memberDAO.login(uid, upw);
	}
	@Override
	public MemberDTO memberInfo(String uid) {
		return memberDAO.memberInfo(uid);
	}

	@Override
	public Integer memberMod(Map<String, Object> map) {
		String[] arr = (String[])(map.get("p7"));
		String[] hobby = {"인터넷","여행","게임","영화","운동"};
		String[] uhobby = {"0","0","0","0","0"};
		if(arr!=null) {
			for (int i = 0; i < hobby.length; i++) {
				for (int j = 0; j < arr.length; j++) {
					if(hobby[i].equals(arr[j])) uhobby[i] = "1";
				}
			}
		}
		map.replace("p7", Arrays.toString(uhobby));
		return memberDAO.memberMod(map);
	}

	@Override
	public boolean memberModPw(String upw, String newPw, String uid) {
		return memberDAO.memberModPw(upw, newPw, uid);
	}

	@Override
	public boolean memberQuit(String uid, String upw) {
		return memberDAO.memberQuit(uid, upw);
	}

	@Override
	public String getUname(String uid) {
		return memberDAO.getUname(uid);
	}

}
