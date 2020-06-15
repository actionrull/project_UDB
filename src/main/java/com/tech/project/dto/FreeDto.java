package com.tech.project.dto;

import java.sql.Timestamp;

public class FreeDto {

	private int fno;
	private String ftitle;
	private String fwriter;
	private String fcontent;
	private Timestamp fdate;
	private int fhit;
	private int fgroup;
	private int fstep;
	private int findent;
	private String fileSrc;
	private String freply;
	private int replyCount;
	
	public FreeDto() {
		// TODO Auto-generated constructor stub
	}
	
	public FreeDto(int fno, String ftitle, String fwriter, String fcontent, Timestamp fdate, int fhit, int fgroup,
			int fstep, int findent, String fileSrc, String freply, int replyCount) {
		super();
		this.fno = fno;
		this.ftitle = ftitle;
		this.fwriter = fwriter;
		this.fcontent = fcontent;
		this.fdate = fdate;
		this.fhit = fhit;
		this.fgroup = fgroup;
		this.fstep = fstep;
		this.findent = findent;
		this.fileSrc = fileSrc;
		this.freply = freply;
		this.replyCount = replyCount;
	}

	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public String getFreply() {
		return freply;
	}
	public void setFreply(String freply) {
		this.freply = freply;
	}
	
	public String getFileSrc() {
		return fileSrc;
	}
	public void setFileSrc(String fileSrc) {
		this.fileSrc = fileSrc;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public String getFtitle() {
		return ftitle;
	}

	public void setFtitle(String ftitle) {
		this.ftitle = ftitle;
	}

	public String getFwriter() {
		return fwriter;
	}

	public void setFwriter(String fwriter) {
		this.fwriter = fwriter;
	}

	public String getFcontent() {
		return fcontent;
	}

	public void setFcontent(String fcontent) {
		this.fcontent = fcontent;
	}

	public Timestamp getFdate() {
		return fdate;
	}

	public void setFdate(Timestamp fdate) {
		this.fdate = fdate;
	}

	public int getFhit() {
		return fhit;
	}

	public void setFhit(int fhit) {
		this.fhit = fhit;
	}

	public int getFgroup() {
		return fgroup;
	}

	public void setFgroup(int fgroup) {
		this.fgroup = fgroup;
	}

	public int getFstep() {
		return fstep;
	}

	public void setFstep(int fstep) {
		this.fstep = fstep;
	}

	public int getFindent() {
		return findent;
	}

	public void setFindent(int findent) {
		this.findent = findent;
	}
	
	
	
	
}
