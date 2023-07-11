package com.sbp.prj.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sbp.prj.dto.BoardDTO;
import com.sbp.prj.util.PagingVO;

public interface BoardService {
	
	List<BoardDTO> boardList(PagingVO vo);

	boolean write(HttpServletRequest req) throws Exception;

	BoardDTO read(int num);

	void readCount(int num);

	void delete(int num);

	Integer boardMod(HttpServletRequest req) throws Exception;

	String getOriFileName(int num);

	Integer boardCount(String keyField, String keyWord);

	List<BoardDTO> boardSearch(String keyField, String keyWord);

}
