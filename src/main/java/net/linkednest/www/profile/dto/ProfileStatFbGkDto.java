package net.linkednest.www.profile.dto;

import org.apache.ibatis.type.Alias;

@Alias("profile.profileStatFbGkDto")
public class ProfileStatFbGkDto {
	private int 	id;
	private int 	profileId;
	private String 	teamName;
	private int 	year;
	private int 	mp;
	private int 	starts;
	private int 	min;
	private float 	ninetyS;
	private int 	ga;
	private float 	ga90;
	private int 	sota;
	private int 	saves;
	private float 	savePercent;
	private int 	w;
	private int 	d;
	private int 	l;
	private int 	cs;
	private float 	csPercent;
	private int 	pkAtt;
	private int 	pkA;
	private int 	pkSv;
	private int 	pkM;
	private float 	pkSavePercent;
	private int 	seq;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProfileId() {
		return profileId;
	}
	public void setProfileId(int profileId) {
		this.profileId = profileId;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMp() {
		return mp;
	}
	public void setMp(int mp) {
		this.mp = mp;
	}
	public int getStarts() {
		return starts;
	}
	public void setStarts(int starts) {
		this.starts = starts;
	}
	public int getMin() {
		return min;
	}
	public void setMin(int min) {
		this.min = min;
	}
	public float getNinetyS() {
		return ninetyS;
	}
	public void setNinetyS(float ninetyS) {
		this.ninetyS = ninetyS;
	}
	public int getGa() {
		return ga;
	}
	public void setGa(int ga) {
		this.ga = ga;
	}
	public float getGa90() {
		return ga90;
	}
	public void setGa90(float ga90) {
		this.ga90 = ga90;
	}
	public int getSota() {
		return sota;
	}
	public void setSota(int sota) {
		this.sota = sota;
	}
	public int getSaves() {
		return saves;
	}
	public void setSaves(int saves) {
		this.saves = saves;
	}
	public float getSavePercent() {
		return savePercent;
	}
	public void setSavePercent(float savePercent) {
		this.savePercent = savePercent;
	}
	public int getW() {
		return w;
	}
	public void setW(int w) {
		this.w = w;
	}
	public int getD() {
		return d;
	}
	public void setD(int d) {
		this.d = d;
	}
	public int getL() {
		return l;
	}
	public void setL(int l) {
		this.l = l;
	}
	public int getCs() {
		return cs;
	}
	public void setCs(int cs) {
		this.cs = cs;
	}
	public float getCsPercent() {
		return csPercent;
	}
	public void setCsPercent(float csPercent) {
		this.csPercent = csPercent;
	}
	public int getPkAtt() {
		return pkAtt;
	}
	public void setPkAtt(int pkAtt) {
		this.pkAtt = pkAtt;
	}
	public int getPkA() {
		return pkA;
	}
	public void setPkA(int pkA) {
		this.pkA = pkA;
	}
	public int getPkSv() {
		return pkSv;
	}
	public void setPkSv(int pkSv) {
		this.pkSv = pkSv;
	}
	public int getPkM() {
		return pkM;
	}
	public void setPkM(int pkM) {
		this.pkM = pkM;
	}
	public float getPkSavePercent() {
		return pkSavePercent;
	}
	public void setPkSavePercent(float pkSavePercent) {
		this.pkSavePercent = pkSavePercent;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	
	@Override
	public String toString() {
		return "ProfileStatFbGkDto [id=" + id + ", profileId=" + profileId + ", teamName=" + teamName + ", year=" + year
				+ ", mp=" + mp + ", starts=" + starts + ", min=" + min + ", ninetyS=" + ninetyS + ", ga=" + ga
				+ ", ga90=" + ga90 + ", sota=" + sota + ", saves=" + saves + ", savePercent=" + savePercent + ", w=" + w
				+ ", d=" + d + ", l=" + l + ", cs=" + cs + ", csPercent=" + csPercent + ", pkAtt=" + pkAtt + ", pkA="
				+ pkA + ", pkSv=" + pkSv + ", pkM=" + pkM + ", pkSavePercent=" + pkSavePercent + ", seq=" + seq + "]";
	}

}
