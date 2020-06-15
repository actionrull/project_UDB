package com.tech.project.dao;

import java.util.ArrayList;

import com.tech.project.dto.BoardDto;

public interface IDao {

	public ArrayList<BoardDto> table(int start, int end,String searchKeyword,String selNum);

	public BoardDto table_view(String bid);

	public void table_write(String bname, String btitle, String bcontent);

	public void modify(String bid, String bname, String btitle, String bcontent);

	public void delete(String bid);

	public BoardDto table_reply_view(String bid);

	public void stepup(String bgroup, String bstep);

	public void table_reply(String bid, String bname, String btitle, String bcontent, String bgroup, String bstep,
			String bindent);

	public int selectBoardCount(String searchKeyword, String string);

	public void upHit(String bid);

}
