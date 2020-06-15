package com.tech.project.dto;

import java.sql.Timestamp;

public class FreeReplyDto {

	private int fno;
	private int frno;
	private String frcontent;
	private String frwriter;
	private Timestamp frdate;
	
	public FreeReplyDto() {
		// TODO Auto-generated constructor stub
	}

	public FreeReplyDto(int fno, int frno, String frcontent, String frwriter, Timestamp frdate) {
		
		this.fno = fno;
		this.frno = frno;
		this.frcontent = frcontent;
		this.frwriter = frwriter;
		this.frdate = frdate;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public int getFrno() {
		return frno;
	}

	public void setFrno(int frno) {
		this.frno = frno;
	}

	public String getFrcontent() {
		return frcontent;
	}

	public void setFrcontent(String frcontent) {
		this.frcontent = frcontent;
	}

	public String getFrwriter() {
		return frwriter;
	}

	public void setFrwriter(String frwriter) {
		this.frwriter = frwriter;
	}

	public Timestamp getFrdate() {
		return frdate;
	}

	public void setFrdate(Timestamp frdate) {
		this.frdate = frdate;
	}
	
	
	
	
}
