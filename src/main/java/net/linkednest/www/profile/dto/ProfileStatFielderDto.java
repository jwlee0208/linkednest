package net.linkednest.www.profile.dto;

import org.apache.ibatis.type.Alias;

@Alias("profile.profileStatFielderDto")
public class ProfileStatFielderDto {
	private int 	statFielderId;
	private int		profileId;
	private String 	fTeamName;
	private String 	fStatYear;
	private String 	pos;
	private int 	g;
	private int 	gs;
	private float 	inn;
	private int 	tc;
	private int 	po;
	private int 	a;
	private int 	e;
	private int 	dp;
	private int 	sb;
	private int 	cs;
	private int 	sbpct;
	private int 	pb;
	private int 	cWp;
	private float 	fpct;
	private float 	rf;
	private String 	etc;
	
	public int getStatFielderId() {
		return statFielderId;
	}
	public void setStatFielderId(int statFielderId) {
		this.statFielderId = statFielderId;
	}

	public String getfTeamName() {
		return fTeamName;
	}
	public void setfTeamName(String fTeamName) {
		this.fTeamName = fTeamName;
	}
	public String getfStatYear() {
		return fStatYear;
	}
	public void setfStatYear(String fStatYear) {
		this.fStatYear = fStatYear;
	}
	public String getPos() {
		return pos;
	}
	public void setPos(String pos) {
		this.pos = pos;
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
	public float getInn() {
		return inn;
	}
	public void setInn(float inn) {
		this.inn = inn;
	}
	public int getTc() {
		return tc;
	}
	public void setTc(int tc) {
		this.tc = tc;
	}
	public int getPo() {
		return po;
	}
	public void setPo(int po) {
		this.po = po;
	}
	public int getA() {
		return a;
	}
	public void setA(int a) {
		this.a = a;
	}
	public int getE() {
		return e;
	}
	public void setE(int e) {
		this.e = e;
	}
	public int getDp() {
		return dp;
	}
	public void setDp(int dp) {
		this.dp = dp;
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
	public int getSbpct() {
		return sbpct;
	}
	public void setSbpct(int sbpct) {
		this.sbpct = sbpct;
	}
	public int getPb() {
		return pb;
	}
	public void setPb(int pb) {
		this.pb = pb;
	}
	public int getcWp() {
		return cWp;
	}
	public void setcWp(int cWp) {
		this.cWp = cWp;
	}
	public float getFpct() {
		return fpct;
	}
	public void setFpct(float fpct) {
		this.fpct = fpct;
	}
	public float getRf() {
		return rf;
	}
	public void setRf(float rf) {
		this.rf = rf;
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
		return "ProfileStatFielderDto [statFielderId=" + statFielderId + ", profileId=" + profileId + ", fTeamName="
				+ fTeamName + ", fStatYear=" + fStatYear + ", pos=" + pos + ", g=" + g + ", gs=" + gs + ", inn=" + inn
				+ ", tc=" + tc + ", po=" + po + ", a=" + a + ", e=" + e + ", dp=" + dp + ", sb=" + sb + ", cs=" + cs
				+ ", sbpct=" + sbpct + ", pb=" + pb + ", cWp=" + cWp + ", fpct=" + fpct + ", rf=" + rf + ", etc=" + etc
				+ "]";
	}

}
