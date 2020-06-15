package com.tech.project.dao;

import java.util.ArrayList;

import com.tech.project.dto.MDto;



public interface MDao {
	
	public int selectBoardCount();
	
	public int selectSeekerBoardCount();
	
	public int selectOfferBoardCount();
	
	public ArrayList<MDto> list(int rowStart, int rowEnd);

	public ArrayList<MDto> list2(int rowStart, int rowEnd);

	public ArrayList<MDto> list3(int rowStart, int rowEnd);

	public ArrayList<MDto> list4(int rowStart, int rowEnd);

}
