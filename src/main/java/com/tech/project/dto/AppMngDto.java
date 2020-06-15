package com.tech.project.dto;

public class AppMngDto {
	private int nseq;
	private String ntitle;
	private String msid;
	private String pass;
	
	public AppMngDto() {
		// TODO Auto-generated constructor stub
	}

	public AppMngDto(int nseq, String ntitle, String msid, String pass) {
		super();
		this.nseq = nseq;
		this.ntitle = ntitle;
		this.msid = msid;
		this.pass = pass;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public int getNseq() {
		return nseq;
	}
	public void setNseq(int nseq) {
		this.nseq = nseq;
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
}
