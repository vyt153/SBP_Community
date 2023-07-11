package com.sbp.prj.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sbp.prj.dto.GalleryDTO;

public interface GalleryService {
	
	List<GalleryDTO> galleryList();

	boolean write(HttpServletRequest req) throws Exception;

	GalleryDTO read(int num);

	void readCount(int num);

	void delete(int num);

	Integer galleryMod(HttpServletRequest req) throws Exception;

	String getOriFileName(int num);

	Integer galleryCount(String keyField, String keyWord);

	List<GalleryDTO> gallerySearch(String keyField, String keyWord);

}
