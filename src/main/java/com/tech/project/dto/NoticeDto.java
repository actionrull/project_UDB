package com.tech.project.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class NoticeDto {
	private int nseq;
	private String ntitle;
	private String nwriter;
	private String ncontent;
	private Date nregdate;
	private Date ndeadline;
	private int nhit;
	private String ncategory;
	private String ngender;
	private String nage;
	private String nag;
	private String npersonnel;	
	private String npt;
	private String nperiod;
	private String nwelfare;
	private String nlocation;
	private String nday;
	private String ntime;
	private String nreception;
	private String ntpay;
	private int npay;
	private String nnearsub;
	private String nmappoint;
	private String npremium;	
	private String naddr;
	private String lat;
	private String lng;
	private String msid;
	private String nimg;
	private String nopen;
	
	public NoticeDto() {
		// TODO Auto-generated constructor stub
	}
		
	public NoticeDto(int nseq, String ntitle, String nwriter, String ncontent, Date nregdate, Date ndeadline, int nhit,
			String ncategory, String ngender, String nage, String nag, String npersonnel, String npt, String nperiod,
			String nwelfare, String nlocation, String nday, String ntime, String nreception, String ntpay, int npay,
			String nnearsub, String nmappoint, String npremium, String naddr, String lat, String lng, String msid,
			String nimg, String nopen) {
		super();
		this.nseq = nseq;
		this.ntitle = ntitle;
		this.nwriter = nwriter;
		this.ncontent = ncontent;
		this.nregdate = nregdate;
		this.ndeadline = ndeadline;
		this.nhit = nhit;
		this.ncategory = ncategory;
		this.ngender = ngender;
		this.nage = nage;
		this.nag = nag;
		this.npersonnel = npersonnel;
		this.npt = npt;
		this.nperiod = nperiod;
		this.nwelfare = nwelfare;
		this.nlocation = nlocation;
		this.nday = nday;
		this.ntime = ntime;
		this.nreception = nreception;
		this.ntpay = ntpay;
		this.npay = npay;
		this.nnearsub = nnearsub;
		this.nmappoint = nmappoint;
		this.npremium = npremium;
		this.naddr = naddr;
		this.lat = lat;
		this.lng = lng;
		this.msid = msid;
		this.nimg = nimg;
		this.nopen = nopen;
	}

	public String getNopen() {
		return nopen;
	}

	public void setNopen(String nopen) {
		this.nopen = nopen;
	}



	public String getMsid() {
		return msid;
	}

	public void setMsid(String msid) {
		this.msid = msid;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getNag() {
		return nag;
	}


	public void setNag(String nag) {
		this.nag = nag;
	}

	public String getNtpay() {
		return ntpay;
	}

	public void setNtpay(String ntpay) {
		this.ntpay = ntpay;
	}

	public String getNpersonnel() {
		return npersonnel;
	}

	public void setNpersonnel(String npersonnel) {
		this.npersonnel = npersonnel;
	}	

	public String getNperiod() {
		return nperiod;
	}

	public void setNperiod(String nperiod) {
		this.nperiod = nperiod;
	}

	public String getNaddr() {
		return naddr;
	}
	public void setNaddr(String naddr) {
		this.naddr = naddr;
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
	public String getNwriter() {
		return nwriter;
	}
	public void setNwriter(String nwriter) {
		this.nwriter = nwriter;
	}
	public String getNcontent() {
		return ncontent;
	}
	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}
	public Date getNregdate() {
		return nregdate;
	}
	public void setNregdate(Date nregdate) {
		this.nregdate = nregdate;
	}
	public Date getNdeadline() {
		return ndeadline;
	}
	public void setNdeadline(Date ndeadline) {
		this.ndeadline = ndeadline;
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
	public String getNgender() {
		return ngender;
	}
	public void setNgender(String ngender) {
		this.ngender = ngender;
	}
	public String getNage() {
		return nage;
	}
	public void setNage(String nage) {
		this.nage = nage;
	}
	public String getNpt() {
		return npt;
	}
	public void setNpt(String npt) {
		this.npt = npt;
	}	
	public String getNwelfare() {
		return nwelfare;
	}
	public void setNwelfare(String nwelfare) {
		this.nwelfare = nwelfare;
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
	public String getNimg() {
		return nimg;
	}

	public void setNimg(String nimg) {
		this.nimg = nimg;
	}
	

}
