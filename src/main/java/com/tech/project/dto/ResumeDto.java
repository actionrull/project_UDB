package com.tech.project.dto;

public class ResumeDto {
	private String msid;
	private String rref;
	private String ropen;
	
	public ResumeDto() {
		// TODO Auto-generated constructor stub
	}
		
	public ResumeDto(String msid, String rref, String ropen) {
		super();
		this.msid = msid;
		this.rref = rref;
		this.ropen = ropen;
	}

	public String getMsid() {
		return msid;
	}
	public void setMsid(String msid) {
		this.msid = msid;
	}
	public String getRref() {
		return rref;
	}
	public void setRref(String rref) {
		this.rref = rref;
	}
	public String getRopen() {
		return ropen;
	}
	public void setRopen(String ropen) {
		this.ropen = ropen;
	}
}
