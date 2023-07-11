package com.sbp.prj.serviceimp;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sbp.prj.dao.BoardDAO;
import com.sbp.prj.dao.MemberDAO;
import com.sbp.prj.dto.BoardDTO;
import com.sbp.prj.service.BoardService;
import com.sbp.prj.util.PagingVO;
import com.sbp.prj.util.UtilMgr;

@Service
public class BoardServiceImp implements BoardService {
	
	private static final int maxSize = 1024 * 1024 * 5;
	private static final String strPath = "classpath:static/boardDir/";
	
	@Autowired
	BoardDAO boardDAO;
	
	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public List<BoardDTO> boardList(PagingVO vo) {
		int start = vo.getStart();
		int end = vo.getEnd();
		return boardDAO.boardList(start, end);
	}
	
	@Override
	public List<BoardDTO> boardSearch(String keyField, String keyWord) {
		return boardDAO.boardSearch(keyField, keyWord);
	}
	
	@Override
	public Integer boardCount(String keyField, String keyWord) {
		return boardDAO.boardCount(keyField, keyWord);
	}

	@Override
	public boolean write(HttpServletRequest req) throws Exception {
		
		String filename = "";
		String OriginalFileName = "";
		int filesize = 0;
		
		String uploadPath = ResourceUtils.getFile(strPath).toPath().toString();
		System.out.println("\n파일 업로드 경로(uploadPath) : \n"+uploadPath);
		
		MultipartRequest multi = new MultipartRequest(
				req,
				uploadPath,
				maxSize,
				"UTF-8",
				new DefaultFileRenamePolicy()
				); 
		
		if(multi.getFilesystemName("filename")!=null) {
			OriginalFileName = multi.getOriginalFileName("filename");
			filename = multi.getFilesystemName("filename");
			filesize = (int)multi.getFile("filename").length();
		}
		String content = multi.getParameter("content");
		
		if(multi.getParameter("contentType").equalsIgnoreCase("TEXT")) {
			content = UtilMgr.replace(content, "<", "&lt");
		}
		
		Map<String, Object>map = new HashMap<>();
		map.put("p1",  multi.getParameter("uid"));
		map.put("p2",  multi.getParameter("uname"));
		map.put("p3",  multi.getParameter("subject"));
		map.put("p4",  content);
		map.put("p5",  filename);
		map.put("p6",  filesize);
		map.put("p7",  OriginalFileName);
		
		return boardDAO.write(map);
	}

	@Override
	public BoardDTO read(int num) {
		return boardDAO.read(num);
	}
	
	@Override
	public void readCount(int num) {
		boardDAO.readCount(num);
	}

	@Override
	public void delete(int num) {
		boardDAO.delete(num);
	}
	
	@Override
	public String getOriFileName(int num) {
		return boardDAO.getOriFileName(num);
	}
	
	@Override
	public Integer boardMod(HttpServletRequest req) throws Exception {
		String filename = "";
		String OriginalFileName = "";
		Integer filesize = 0;
		
		String uploadPath = ResourceUtils.getFile(strPath).toPath().toString();
		
		MultipartRequest multi = new MultipartRequest(
				req,
				uploadPath,
				maxSize,
				"UTF-8",
				new DefaultFileRenamePolicy()
				); 
		
		if(Integer.parseInt(multi.getParameter("delFile"))==1) {
			String oldFile = boardDAO.getOriFileName(Integer.parseInt(multi.getParameter("num")));
			System.out.println(oldFile);
			String fileSrc = uploadPath + "/" + oldFile;
			File file = new File(fileSrc);
			file.delete();
			
			if(multi.getFilesystemName("filename")!=null) {
				OriginalFileName = multi.getOriginalFileName("filename");
				filename = multi.getFilesystemName("filename");
				filesize = (int)multi.getFile("filename").length();
			}
		}
		String content = multi.getParameter("content");
		
		if(multi.getParameter("contentType").equalsIgnoreCase("TEXT")) {
			content = UtilMgr.replace(content, "<", "&lt");
		}
		
		Map<String, Object>map = new HashMap<>();
		map.put("p1",  Integer.parseInt(multi.getParameter("num")));
		map.put("p2",  multi.getParameter("subject"));
		map.put("p3",  content);
		
		if(filesize>0) {
			map.put("p4",  filename);
			map.put("p5",  filesize);
			map.put("p6",  OriginalFileName);
			return boardDAO.boardModify(map);
		} else {
			return boardDAO.boardMod(map);
		}
		
	}
}
