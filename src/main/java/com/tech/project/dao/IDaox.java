package com.tech.project.dao;

import java.util.ArrayList;

import com.tech.project.dto.NoticeDto;

public interface IDaox {

	public ArrayList<NoticeDto> home();
	
	public ArrayList<NoticeDto> table2();
	
	public NoticeDto content_view(String nid);

	public void table_write2(String ntitle, String nwriter, String ncontent);
	
	public void delete2(String bid);

	public ArrayList<NoticeDto> homepremium();
	
	
}
