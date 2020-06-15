package com.tech.project.dto;

import java.sql.Timestamp;

public class InformDto {

	private int ino;
	private String ititle;
	private String iwriter;
	private String icontent;
	private Timestamp idate;
	private int ihit;
	private String ifilesrc;
	private String imaster;
	
	public InformDto() {
		// TODO Auto-generated constructor stub
	}

	public InformDto(int ino, String ititle, String iwriter, String icontent, Timestamp idate, int ihit,
			String ifilesrc, String imaster) {
		
		this.ino = ino;
		this.ititle = ititle;
		this.iwriter = iwriter;
		this.icontent = icontent;
		this.idate = idate;
		this.ihit = ihit;
		this.ifilesrc = ifilesrc;
		this.imaster = imaster;
	}

	public int getIno() {
		return ino;
	}

	public void setIno(int ino) {
		this.ino = ino;
	}

	public String getItitle() {
		return ititle;
	}

	public void setItitle(String ititle) {
		this.ititle = ititle;
	}

	public String getIwriter() {
		return iwriter;
	}

	public void setIwriter(String iwriter) {
		this.iwriter = iwriter;
	}

	public String getIcontent() {
		return icontent;
	}

	public void setIcontent(String icontent) {
		this.icontent = icontent;
	}

	public Timestamp getIdate() {
		return idate;
	}

	public void setIdate(Timestamp idate) {
		this.idate = idate;
	}

	public int getIhit() {
		return ihit;
	}

	public void setIhit(int ihit) {
		this.ihit = ihit;
	}

	public String getIfilesrc() {
		return ifilesrc;
	}

	public void setIfilesrc(String ifilesrc) {
		this.ifilesrc = ifilesrc;
	}

	public String getImaster() {
		return imaster;
	}

	public void setImaster(String imaster) {
		this.imaster = imaster;
	}
	
	
	
	
}
