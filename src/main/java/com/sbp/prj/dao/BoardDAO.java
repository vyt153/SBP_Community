package com.sbp.prj.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sbp.prj.dto.BoardDTO;

@Mapper
public interface BoardDAO {
	
	/*
	 * @Select("select * from tblboard order by num desc") List<BoardDTO>
	 * boardList();
	 */
	@Select("select B.* from (select g.* from (" + 
			"	select @rownum := @rownum + 1 as rnum, tblboard.* from tblboard, " + 
			"	(select @rownum :=0) tmp order by num desc) g" + 
			"	order by rnum) B where rnum between #{param1} and #{param2}")
	List<BoardDTO> boardList(int start, int end);
	
	@Select("select count(*) from tblboard where #{param1} like CONCAT('%',#{param2},'%') ")
	Integer boardCount(String keyField, String keyWord);
	
	List<BoardDTO> boardSearch(@Param("keyField")String keyField,@Param("keyWord")String keyWord);
	
	@Insert("insert into tblboard("
	+ "uid, uname, subject, content,"
	+ "readcnt, filename, filesize, oriFilename) values("
	+ "#{p1},#{p2},#{p3},#{p4},0,#{p5},#{p6},#{p7})")
	boolean write(Map<String, Object>map);

	@Select("select * from tblboard where num = #{num}")
	BoardDTO read(int num);
	
	@Select("select oriFileName from tblboard where num = #{num}")
	String getOriFileName(int num);
	
	@Update("update tblboard set readcnt = readcnt+1 where num = #{num}")
	void readCount(int num);
	
	@Delete("delete from tblboard where num = #{num}")
	void delete(int num);
	
	@Update("update tblboard set subject=#{p2}, content=#{p3}, "
	+"filename=#{p4}, filesize=#{p5}, oriFilename=#{p6} where num=#{p1}")
	Integer boardModify(Map<String, Object>map);
	
	@Update("update tblboard set subject=#{p2}, content=#{p3}, "
			+"filename='', filesize=0, oriFilename='' where num=#{p1}")
	Integer boardMod(Map<String, Object>map);
}
