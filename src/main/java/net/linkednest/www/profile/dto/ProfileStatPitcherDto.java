package net.linkednest.www.profile.dto;

import org.apache.ibatis.type.Alias;

@Alias("profile.profileStatPitcherDto")
public class ProfileStatPitcherDto{
	private int 	statPitcherId;
	private int		profileId;
	private String 	pTeamName;
	private String 	pStatYear;
	private float 	inn;
	private int 	w;
	private int 	l;
	private float 	era;
	private int 	g;
	private int 	gs;
	private int 	sv;
	private int 	svo;
	private float 	ip;
	private int 	h;
	private int 	r;
	private int 	er;
	private int 	hr;
	private int 	bb;
	private int 	so;
	private float 	avg;
	private float 	whip;
	private int 	k;
	private String 	etc;
	
	public int getStatPitcherId() {
		return statPitcherId;
	}
	public void setStatPitcherId(int statPitcherId) {
		this.statPitcherId = statPitcherId;
	}
	public String getpTeamName() {
		return pTeamName;
	}
	public void setpTeamName(String pTeamName) {
		this.pTeamName = pTeamName;
	}
	public String getpStatYear() {
		return pStatYear;
	}
	public void setpStatYear(String pStatYear) {
		this.pStatYear = pStatYear;
	}
	public float getInn() {
		return inn;
	}
	public void setInn(float inn) {
		this.inn = inn;
	}
	public int getW() {
		return w;
	}
	public void setW(int w) {
		this.w = w;
	}
	public int getL() {
		return l;
	}
	public void setL(int l) {
		this.l = l;
	}
	public float getEra() {
		return era;
	}
	public void setEra(float era) {
		this.era = era;
	}
	public int getG() {
		return g;
	}
	public void setG(int g) {
		this.g = g;
	}
	public int getGs() {
		return gs;
	}
	public void setGs(int gs) {
		this.gs = gs;
	}
	public int getSv() {
		return sv;
	}
	public void setSv(int sv) {
		this.sv = sv;
	}
	public int getSvo() {
		return svo;
	}
	public void setSvo(int svo) {
		this.svo = svo;
	}
	public float getIp() {
		return ip;
	}
	public void setIp(float ip) {
		this.ip = ip;
	}
	public int getH() {
		return h;
	}
	public void setH(int h) {
		this.h = h;
	}
	public int getR() {
		return r;
	}
	public void setR(int r) {
		this.r = r;
	}
	public int getEr() {
		return er;
	}
	public void setEr(int er) {
		this.er = er;
	}
	public int getHr() {
		return hr;
	}
	public void setHr(int hr) {
		this.hr = hr;
	}
	public int getBb() {
		return bb;
	}
	public void setBb(int bb) {
		this.bb = bb;
	}
	public int getSo() {
		return so;
	}
	public void setSo(int so) {
		this.so = so;
	}
	public float getAvg() {
		return avg;
	}
	public void setAvg(float avg) {
		this.avg = avg;
	}
	public int getK() {
		return k;
	}
	public void setK(int k) {
		this.k = k;
	}
	public float getWhip() {
		return whip;
	}
	public void setWhip(float whip) {
		this.whip = whip;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public int getProfileId() {
		return profileId;
	}
	public void setProfileId(int profileId) {
		this.profileId = profileId;
	}

	@Override
	public String toString() {
		final StringBuffer sb = new StringBuffer("ProfileStatPitcherDto{");
		sb.append("statPitcherId=").append(statPitcherId);
		sb.append(", profileId=").append(profileId);
		sb.append(", pTeamName='").append(pTeamName).append('\'');
		sb.append(", pStatYear='").append(pStatYear).append('\'');
		sb.append(", inn=").append(inn);
		sb.append(", w=").append(w);
		sb.append(", l=").append(l);
		sb.append(", era=").append(era);
		sb.append(", g=").append(g);
		sb.append(", gs=").append(gs);
		sb.append(", sv=").append(sv);
		sb.append(", svo=").append(svo);
		sb.append(", ip=").append(ip);
		sb.append(", h=").append(h);
		sb.append(", r=").append(r);
		sb.append(", er=").append(er);
		sb.append(", hr=").append(hr);
		sb.append(", bb=").append(bb);
		sb.append(", so=").append(so);
		sb.append(", avg=").append(avg);
		sb.append(", whip=").append(whip);
		sb.append(", k=").append(k);
		sb.append(", etc='").append(etc).append('\'');
		sb.append('}');
		return sb.toString();
	}
}
