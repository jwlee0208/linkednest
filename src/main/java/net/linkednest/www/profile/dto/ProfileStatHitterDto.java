package net.linkednest.www.profile.dto;

import org.apache.ibatis.type.Alias;

@Alias("profile.profileStatHitterDto")
public class ProfileStatHitterDto{
	private int 	statHitterId;
	private int 	profileId;
	private String 	hTeamName;
	private String 	hStatYear;
	
	private int 	g;
	private int 	ab;
	private int 	r;
	private int 	h;
	private int 	twoB;
	private int 	threeB;
	private int 	hr;
	private int 	rbi;
	private int 	bb;
	private int 	so;
	private int 	sb;
	private int 	cs;
	private float 	avg;
	private float 	obp;
	private float 	slg;
	private float 	ops;
	private String 	etc;
	
	public int getStatHitterId() {
		return statHitterId;
	}
	public void setStatHitterId(int statHitterId) {
		this.statHitterId = statHitterId;
	}
	public int getProfileId() {
		return profileId;
	}
	public void setProfileId(int profileId) {
		this.profileId = profileId;
	}
	public String gethTeamName() {
		return hTeamName;
	}
	public void sethTeamName(String hTeamName) {
		this.hTeamName = hTeamName;
	}
	public String gethStatYear() {
		return hStatYear;
	}
	public void sethStatYear(String hStatYear) {
		this.hStatYear = hStatYear;
	}
	public int getG() {
		return g;
	}
	public void setG(int g) {
		this.g = g;
	}
	public int getAb() {
		return ab;
	}
	public void setAb(int ab) {
		this.ab = ab;
	}
	public int getR() {
		return r;
	}
	public void setR(int r) {
		this.r = r;
	}
	public int getH() {
		return h;
	}
	public void setH(int h) {
		this.h = h;
	}
	public int getTwoB() {
		return twoB;
	}
	public void setTwoB(int twoB) {
		this.twoB = twoB;
	}
	public int getThreeB() {
		return threeB;
	}
	public void setThreeB(int threeB) {
		this.threeB = threeB;
	}
	public int getHr() {
		return hr;
	}
	public void setHr(int hr) {
		this.hr = hr;
	}
	public int getRbi() {
		return rbi;
	}
	public void setRbi(int rbi) {
		this.rbi = rbi;
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
	public int getSb() {
		return sb;
	}
	public void setSb(int sb) {
		this.sb = sb;
	}
	public int getCs() {
		return cs;
	}
	public void setCs(int cs) {
		this.cs = cs;
	}
	public float getAvg() {
		return avg;
	}
	public void setAvg(float avg) {
		this.avg = avg;
	}
	public float getObp() {
		return obp;
	}
	public void setObp(float obp) {
		this.obp = obp;
	}
	public float getSlg() {
		return slg;
	}
	public void setSlg(float slg) {
		this.slg = slg;
	}
	public float getOps() {
		return ops;
	}
	public void setOps(float ops) {
		this.ops = ops;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}

	@Override
	public String toString() {
		final StringBuffer sb = new StringBuffer("ProfileStatHitterDto{");
		sb.append("statHitterId=").append(statHitterId);
		sb.append(", profileId=").append(profileId);
		sb.append(", hTeamName='").append(hTeamName).append('\'');
		sb.append(", hStatYear='").append(hStatYear).append('\'');
		sb.append(", g=").append(g);
		sb.append(", ab=").append(ab);
		sb.append(", r=").append(r);
		sb.append(", h=").append(h);
		sb.append(", twoB=").append(twoB);
		sb.append(", threeB=").append(threeB);
		sb.append(", hr=").append(hr);
		sb.append(", rbi=").append(rbi);
		sb.append(", bb=").append(bb);
		sb.append(", so=").append(so);
		sb.append(", sb=").append(sb);
		sb.append(", cs=").append(cs);
		sb.append(", avg=").append(avg);
		sb.append(", obp=").append(obp);
		sb.append(", slg=").append(slg);
		sb.append(", ops=").append(ops);
		sb.append(", etc='").append(etc).append('\'');
		sb.append('}');
		return sb.toString();
	}
}
