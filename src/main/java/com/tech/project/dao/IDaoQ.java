package com.tech.project.dao;

import java.util.ArrayList;

import com.tech.project.dto.QuestionDto;

public interface IDaoQ {

	public ArrayList<QuestionDto> list(int start,int end,String qtype,String selNum);
	
	public int selectCount(String qtype,String selNum );
	
	public void write(String qtitle,String qwriter,String qcontent,String qtype);
	public void upHit(String strno);
	public QuestionDto contentView(String seqno);
	public QuestionDto modifyView(String seqno);
	public void modify(String qno,String qtitle,String qcontent);
	public void delete(String qno);
	
	public QuestionDto replyView(String seqno);
	
	public void stepup(String qgroup,String qstep);
	public void reply(String qno,String qtype,String qcontent,String qrcontent,String qgroup,
			String qstep,String qindent,String qtitle);

}
