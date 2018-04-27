package net.linkednest.www.user.dto;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("user.userDto")
public class UserDto implements Serializable{
	private String userId;
//	@NotNull @NotEmpty
	private String userNm;
//	@NotNull @NotEmpty
	private String passwd;
	
	private String passwdChk;
//	@Email
	private String email;
//	@NumberFormat
	private String phoneNo;
	
	private String joinDate;
	
	private String nationality;
	
	private String language;

	private String fbUserId;
	
	private String twUserId;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

    public String getPasswdChk() {
        return passwdChk;
    }
    public void setPasswdChk(String passwdChk) {
        this.passwdChk = passwdChk;
    }
    public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}	
    public String getNationality() {
        return nationality;
    }
    public void setNationality(String nationality) {
        this.nationality = nationality;
    }
    public String getLanguage() {
        return language;
    }
    public void setLanguage(String language) {
        this.language = language;
    }
    
    public String getFbUserId() {
        return fbUserId;
    }
    public void setFbUserId(String fbUserId) {
        this.fbUserId = fbUserId;
    }
    public String getTwUserId() {
        return twUserId;
    }
    public void setTwUserId(String twUserId) {
        this.twUserId = twUserId;
    }

	@Override
	public String toString() {
		final StringBuffer sb = new StringBuffer("UserDto{");
		sb.append("userId='").append(userId).append('\'');
		sb.append(", userNm='").append(userNm).append('\'');
		sb.append(", passwd='").append(passwd).append('\'');
		sb.append(", passwdChk='").append(passwdChk).append('\'');
		sb.append(", email='").append(email).append('\'');
		sb.append(", phoneNo='").append(phoneNo).append('\'');
		sb.append(", joinDate='").append(joinDate).append('\'');
		sb.append(", nationality='").append(nationality).append('\'');
		sb.append(", language='").append(language).append('\'');
		sb.append(", fbUserId='").append(fbUserId).append('\'');
		sb.append(", twUserId='").append(twUserId).append('\'');
		sb.append('}');
		return sb.toString();
	}
}
