package com.tech.project.dto;

import java.sql.Timestamp;

public class NcDto {
	private String nimage;
	private String ntitle;
	private String nwriter;
	private String nperiod;
	private int nhit;
	private String ncategory;
	private String nlocation;
	private String nday;
	private String ngender;
	private String netc2;
	private String ntime;
	private String nreception;
	private int npay;
	private String nnearsub;
	private String nmappoint;
	private String npremium;
	private String netc;
	private Timestamp ndate;
	
	
	
	public NcDto(String nimage, String ntitle, String nwriter, String nperiod, int nhit, String ncategory,
			String nlocation, String nday, String ngender, String netc2, String ntime, String nreception, int npay,
			String nnearsub, String nmappoint, String npremium, String netc, Timestamp ndate) {
		super();
		this.nimage = nimage;
		this.ntitle = ntitle;
		this.nwriter = nwriter;
		this.nperiod = nperiod;
		this.nhit = nhit;
		this.ncategory = ncategory;
		this.nlocation = nlocation;
		this.nday = nday;
		this.ngender = ngender;
		this.netc2 = netc2;
		this.ntime = ntime;
		this.nreception = nreception;
		this.npay = npay;
		this.nnearsub = nnearsub;
		this.nmappoint = nmappoint;
		this.npremium = npremium;
		this.netc = netc;
		this.ndate = ndate;
	}
	
	public String getNimage() {
		return nimage;
	}
	public void setNimage(String nimage) {
		this.nimage = nimage;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getNwriter() {
		return nwriter;
	}
	public void setNwriter(String nwriter) {
		this.nwriter = nwriter;
	}
	public String getNperiod() {
		return nperiod;
	}
	public void setNperiod(String nperiod) {
		this.nperiod = nperiod;
	}
	public int getNhit() {
		return nhit;
	}
	public void setNhit(int nhit) {
		this.nhit = nhit;
	}
	public String getNcategory() {
		return ncategory;
	}
	public void setNcategory(String ncategory) {
		this.ncategory = ncategory;
	}
	public String getNlocation() {
		return nlocation;
	}
	public void setNlocation(String nlocation) {
		this.nlocation = nlocation;
	}
	public String getNday() {
		return nday;
	}
	public void setNday(String nday) {
		this.nday = nday;
	}
	public String getNgender() {
		return ngender;
	}
	public void setNgender(String ngender) {
		this.ngender = ngender;
	}
	public String getNetc2() {
		return netc2;
	}
	public void setNetc2(String netc2) {
		this.netc2 = netc2;
	}
	public String getNtime() {
		return ntime;
	}
	public void setNtime(String ntime) {
		this.ntime = ntime;
	}
	public String getNreception() {
		return nreception;
	}
	public void setNreception(String nreception) {
		this.nreception = nreception;
	}
	public int getNpay() {
		return npay;
	}
	public void setNpay(int npay) {
		this.npay = npay;
	}
	public String getNnearsub() {
		return nnearsub;
	}
	public void setNnearsub(String nnearsub) {
		this.nnearsub = nnearsub;
	}
	public String getNmappoint() {
		return nmappoint;
	}
	public void setNmappoint(String nmappoint) {
		this.nmappoint = nmappoint;
	}
	public String getNpremium() {
		return npremium;
	}
	public void setNpremium(String npremium) {
		this.npremium = npremium;
	}
	public String getNetc() {
		return netc;
	}
	public void setNetc(String netc) {
		this.netc = netc;
	}

	public Timestamp getNdate() {
		return ndate;
	}

	public void setNdate(Timestamp ndate) {
		this.ndate = ndate;
	}
	
	
	
}
