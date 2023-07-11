package com.sbp.prj.serviceimp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sbp.prj.dao.GalleryDAO;
import com.sbp.prj.dto.GalleryDTO;
import com.sbp.prj.service.GalleryService;
import com.sbp.prj.util.UtilMgr;

@Service
public class GalleryServiceImp implements GalleryService{
	
	private static final int maxSize = 1024 * 1024 * 5;
	private static final String strPath = "classpath:static/galleryDir/";
	
	@Autowired
	GalleryDAO galleryDAO;
	
	
	@Override
	public List<GalleryDTO> galleryList() {
		return galleryDAO.galleryList();
	}
	
	@Override
	public List<GalleryDTO> gallerySearch(String keyField, String keyWord) {
		return galleryDAO.gallerySearch(keyField, keyWord);
	}
	
	@Override
	public Integer galleryCount(String keyField, String keyWord) {
		return galleryDAO.galleryCount(keyField, keyWord);
	}

	@Override
	public boolean write(HttpServletRequest req) throws Exception {
		
		String uploadPath = ResourceUtils.getFile(strPath).toPath().toString();
		System.out.println("\n파일 업로드 경로(uploadPath) : \n"+uploadPath);
		
		MultipartRequest multi = new MultipartRequest(
				req,
				uploadPath,
				maxSize,
				"UTF-8",
				new DefaultFileRenamePolicy()
				); 
		
		String content = multi.getParameter("content");
		
		if(multi.getParameter("contentType").equalsIgnoreCase("TEXT")) {
			content = UtilMgr.replace(content, "<", "&lt");
		}
		
		Map<String, Object>map = new HashMap<>();
		map.put("p1",  multi.getParameter("uid"));
		map.put("p2",  multi.getParameter("uname"));
		map.put("p3",  multi.getParameter("subject"));
		map.put("p4",  content);
		map.put("p5",  multi.getOriginalFileName("filename"));
		map.put("p6",  (int)multi.getFile("filename").length());
		map.put("p7",  multi.getOriginalFileName("filename"));
		
		return galleryDAO.write(map);
	}

	@Override
	public GalleryDTO read(int num) {
		return galleryDAO.read(num);
	}
	
	@Override
	public void readCount(int num) {
		galleryDAO.readCount(num);
	}

	@Override
	public void delete(int num) {
		galleryDAO.delete(num);
	}
	
	@Override
	public String getOriFileName(int num) {
		return galleryDAO.getOriFileName(num);
	}
	
	@Override
	public Integer galleryMod(HttpServletRequest req) throws Exception {
		String uploadPath = ResourceUtils.getFile(strPath).toPath().toString();
		
		MultipartRequest multi = new MultipartRequest(
				req,
				uploadPath,
				maxSize,
				"UTF-8",
				new DefaultFileRenamePolicy()
				); 
		
		String content = multi.getParameter("content");
		
		if(multi.getParameter("contentType").equalsIgnoreCase("TEXT")) {
			content = UtilMgr.replace(content, "<", "&lt");
		}
		
		Map<String, Object>map = new HashMap<>();
		map.put("p1",  Integer.parseInt(multi.getParameter("num")));
		map.put("p2",  multi.getParameter("subject"));
		map.put("p3",  content);
		
		if(multi.getFilesystemName("filename")!=null) {
			String OriginalFileName = multi.getOriginalFileName("filename");
			String filename = multi.getFilesystemName("filename");
			int filesize = (int)multi.getFile("filename").length();
			map.put("p4",  filename);
			map.put("p5",  filesize);
			map.put("p6",  OriginalFileName);
			return galleryDAO.galleryModify(map);
		}
			return galleryDAO.galleryMod(map);
		
	}
}
