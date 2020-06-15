package com.tech.project.dao;

import java.util.ArrayList;

import com.tech.project.dto.InformDto;

public interface IDaoI { 
	
	public int selectInformCount();
	
	public ArrayList<InformDto> list(int start,int end);
	
	public void write(String ititle,String icontent,String iName);
	public InformDto contentView(String seqno);
	public void upHit(String strno);
	public InformDto modifyView(String seqno);
	public void modify(String ino,String ititle,String icontent);
	public void delete(String ino);
}
