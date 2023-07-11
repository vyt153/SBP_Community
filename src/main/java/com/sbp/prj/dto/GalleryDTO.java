package com.sbp.prj.dto;

import lombok.Data;

@Data
public class GalleryDTO {
	
	private int num;
	private String uid;
	private String uname;
	private String subject;
	private String content;
	private String regTM;
	private int readCnt;
	private String fileName;
	private String oriFileName;
	private int filesize;
	
}
