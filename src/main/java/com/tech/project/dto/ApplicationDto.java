package com.tech.project.dto;

import java.sql.Date;

public class ApplicationDto {
	private String msid;
	private int nseq;
	private Date appdate;
	private String pass;
	private String ntitle;
	
	public ApplicationDto() {
		// TODO Auto-generated constructor stub
	}
		
	public ApplicationDto(String msid, int nseq, Date appdate, String pass, String ntitle) {
		super();
		this.msid = msid;
		this.nseq = nseq;
		this.appdate = appdate;
		this.pass = pass;
		this.ntitle = ntitle;
	}

	public String getNtitle() {
		return ntitle;
	}

	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	
	public String getMsid() {
		return msid;
	}
	public void setMsid(String msid) {
		this.msid = msid;
	}
	public int getNseq() {
		return nseq;
	}
	public void setNseq(int nseq) {
		this.nseq = nseq;
	}

	public Date getAppdate() {
		return appdate;
	}

	public void setAppdate(Date appdate) {
		this.appdate = appdate;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}
}
