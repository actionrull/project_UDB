package com.tech.project.dao;

import java.util.ArrayList;

import com.tech.project.dto.FreeDto;
import com.tech.project.dto.FreeReplyDto;

public interface IDaoF {
	public ArrayList<FreeDto> list(int start,int end,String searchKeyword,String selNum);
	
	
	public int selectSearchCount(String searchKeyword,String selNum);
	
	
	public void write(String ftitle,String fwriter,String fName,String fcontent);
	public FreeDto contentView(String seqno);
	
	public void rwrite(String fno,String frwriter,String frcontent);
	public ArrayList<FreeReplyDto> rcontentView(String fno);
	
	public void upHit(String strno);
	public FreeDto modifyView(String seqno);
	public void modify(String fno, String ftitle, String fcontent);
	public void delete(String fno);
	public FreeDto replyView(String seqno);
	public void stepup(String fgroup,String fstep);
	
	public void reply(String fno,String freply);
	
	
	public ArrayList<FreeDto> rCount();


	public void rdelete(String fno);
}
