package com.pcwk.ehr.station.domain;

import com.pcwk.ehr.cmn.DTO;

public class StationVO extends DTO {
	
	private int station_seq;			//충전소순번
	private String addr;				//주소
	private String chargetp;			//충전기타입
	private int cpid; 					//충전기ID
	private String cpnm; 				//충전기명칭
	private String cpstat;				//충전기상태
	private String cptp;				//충전방식
	private int csid;					//충전소ID
	private String csnm;				//충전소명칭
	private String lat;					//위도
	private String longi;				//경도
	private String statupdatetime;		//갱신시간
	
	public StationVO() {}

	public StationVO(int station_seq, String addr, String chargetp, int cpid, String cpnm, String cpstat, String cptp,
			int csid, String csnm, String lat, String longi, String statupdatetime) {
		super();
		this.station_seq = station_seq;
		this.addr = addr;
		this.chargetp = chargetp;
		this.cpid = cpid;
		this.cpnm = cpnm;
		this.cpstat = cpstat;
		this.cptp = cptp;
		this.csid = csid;
		this.csnm = csnm;
		this.lat = lat;
		this.longi = longi;
		this.statupdatetime = statupdatetime;
	}

	public int getStation_seq() {
		return station_seq;
	}

	public void setStation_seq(int station_seq) {
		this.station_seq = station_seq;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getChargetp() {
		return chargetp;
	}

	public void setChargetp(String chargetp) {
		this.chargetp = chargetp;
	}

	public int getCpid() {
		return cpid;
	}

	public void setCpid(int cpid) {
		this.cpid = cpid;
	}

	public String getCpnm() {
		return cpnm;
	}

	public void setCpnm(String cpnm) {
		this.cpnm = cpnm;
	}

	public String getCpstat() {
		return cpstat;
	}

	public void setCpstat(String cpstat) {
		this.cpstat = cpstat;
	}

	public String getCptp() {
		return cptp;
	}

	public void setCptp(String cptp) {
		this.cptp = cptp;
	}

	public int getCsid() {
		return csid;
	}

	public void setCsid(int csid) {
		this.csid = csid;
	}

	public String getCsnm() {
		return csnm;
	}

	public void setCsnm(String csnm) {
		this.csnm = csnm;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLongi() {
		return longi;
	}

	public void setLongi(String longi) {
		this.longi = longi;
	}

	public String getStatupdatetime() {
		return statupdatetime;
	}

	public void setStatupdatetime(String statupdatetime) {
		this.statupdatetime = statupdatetime;
	}

	@Override
	public String toString() {
		return "StationVO [station_seq=" + station_seq + ", addr=" + addr + ", chargetp=" + chargetp + ", cpid=" + cpid
				+ ", cpnm=" + cpnm + ", cpstat=" + cpstat + ", cptp=" + cptp + ", csid=" + csid + ", csnm=" + csnm
				+ ", lat=" + lat + ", longi=" + longi + ", statupdatetime=" + statupdatetime + "]";
	}
	
	
}
