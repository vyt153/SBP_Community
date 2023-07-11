package com.sbp.prj.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sbp.prj.dto.GalleryDTO;


@Mapper
public interface GalleryDAO {
	
	@Select("select * from tblgallery order by num desc")
	List<GalleryDTO> galleryList();
	
	@Select("select count(*) from tblgallery where #{param1} like CONCAT('%',#{param2},'%') ")
	Integer galleryCount(String keyField, String keyWord);
	
	List<GalleryDTO> gallerySearch(@Param("keyField")String keyField,@Param("keyWord")String keyWord);
	
	@Insert("insert into tblgallery("
	+ "uid, uname, subject, content,"
	+ "readcnt, filename, filesize, oriFilename) values("
	+ "#{p1},#{p2},#{p3},#{p4},0,#{p5},#{p6},#{p7})")
	boolean write(Map<String, Object>map);

	@Select("select * from tblgallery where num = #{num}")
	GalleryDTO read(int num);
	
	@Select("select oriFileName from tblgallery where num = #{num}")
	String getOriFileName(int num);
	
	@Update("update tblgallery set readcnt = readcnt+1 where num = #{num}")
	void readCount(int num);
	
	@Delete("delete from tblgallery where num = #{num}")
	void delete(int num);
	
	@Update("update tblgallery set subject=#{p2}, content=#{p3}, "
	+"filename=#{p4}, filesize=#{p5}, oriFilename=#{p6} where num=#{p1}")
	Integer galleryModify(Map<String, Object>map);
	
	@Update("update tblgallery set subject=#{p2}, content=#{p3} where num=#{p1}")
	Integer galleryMod(Map<String, Object>map);
}
