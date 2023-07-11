package com.sbp.prj.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sbp.prj.dto.MemberDTO;

@Mapper
public interface MemberDAO {
	
	@Insert("insert into member (uid, upw, uname, uemail, gender, ubirthday, " + 
			"uzipcode, uaddr, uhobby, ujob, jointm" + 
			") values ( #{p1},#{p2},#{p3},#{p4},#{p5},#{p6},#{p7},"+
			"#{p8},#{p9},#{p10}, now())")
	int join(Map<String, Object>map);
	
	@Select("select * from member where uid=#{param1} and upw=#{param2}")
	MemberDTO login(String uid, String upw);
	
	@Select("select * from member where uid=#{uid}")
	MemberDTO memberInfo(String uid);
	
	@Update("update member set uname = #{p1}, uemail = #{p2}, "
			+ "gender = #{p3}, ubirthday = #{p4}, uzipcode = #{p5},"
			+ " uaddr = #{p6}, uhobby = #{p7}, ujob = #{p8} where num = #{p9}")
	Integer memberMod(Map<String, Object> map);
	
	@Update("update member set upw = #{param2} where uid = #{param3} and upw = #{param1}")
	boolean memberModPw(String upw, String newPw, String uid);
	
	@Delete("delete from member where uid = #{param1} and upw = #{param2}")
	boolean memberQuit(String uid, String upw);
	
	@Select("select uname from member where uid=#{uid}")
	String getUname(String uid);
}
