package com.tech.project.dto;

import java.sql.Timestamp;

public class QuestionDto {
	
	private int qno;
	private String qtitle;
	private String qwriter;
	private String qcontent;
	private String qrcontent;
	private String qtype;
	private Timestamp qdate;
	private int qhit;
	private int qgroup;
	private int qstep;
	private int qindent;
	private String qmaster;
	
	public QuestionDto() {
		// TODO Auto-generated constructor stub
	}

	public QuestionDto(int qno, String qtitle, String qwriter, String qcontent, String qrcontent, String qtype,
			Timestamp qdate, int qhit, int qgroup, int qstep, int qindent, String qmaster) {
		
		this.qno = qno;
		this.qtitle = qtitle;
		this.qwriter = qwriter;
		this.qcontent = qcontent;
		this.qrcontent = qrcontent;
		this.qtype = qtype;
		this.qdate = qdate;
		this.qhit = qhit;
		this.qgroup = qgroup;
		this.qstep = qstep;
		this.qindent = qindent;
		this.qmaster = qmaster;
	}

	public int getQno() {
		return qno;
	}

	public void setQno(int qno) {
		this.qno = qno;
	}

	public String getQtitle() {
		return qtitle;
	}

	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}

	public String getQwriter() {
		return qwriter;
	}

	public void setQwriter(String qwriter) {
		this.qwriter = qwriter;
	}

	public String getQcontent() {
		return qcontent;
	}

	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}

	public String getQrcontent() {
		return qrcontent;
	}

	public void setQrcontent(String qrcontent) {
		this.qrcontent = qrcontent;
	}

	public String getQtype() {
		return qtype;
	}

	public void setQtype(String qtype) {
		this.qtype = qtype;
	}

	public Timestamp getQdate() {
		return qdate;
	}

	public void setQdate(Timestamp qdate) {
		this.qdate = qdate;
	}

	public int getQhit() {
		return qhit;
	}

	public void setQhit(int qhit) {
		this.qhit = qhit;
	}

	public int getQgroup() {
		return qgroup;
	}

	public void setQgroup(int qgroup) {
		this.qgroup = qgroup;
	}

	public int getQstep() {
		return qstep;
	}

	public void setQstep(int qstep) {
		this.qstep = qstep;
	}

	public int getQindent() {
		return qindent;
	}

	public void setQindent(int qindent) {
		this.qindent = qindent;
	}

	public String getQmaster() {
		return qmaster;
	}

	public void setQmaster(String qmaster) {
		this.qmaster = qmaster;
	}
	
	
	
}

