package net.linkednest.www.profile.dto;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.type.Alias;

import net.linkednest.common.constant.CommonConstant;
import net.linkednest.common.util.AES256Util;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.NotNull;

@Alias("profile.profileContactInfoDto")
public class ProfileContactInfoDto {
	private int contactInfoId;
	private int profileId;
	private String phoneNo;
	private String cellPhoneNo;
	private String email;
	private String websiteUrl;
	private String facebookUrl;
	private String twitterUrl;
	private String instagramUrl;
	private String address;
	private String createDate;
	private String createUserId;

	/***********************
	 * 암호화 파라미터
	 ***********************/
	public String getEncryptedPhoneNo(){
		return getEncryptedData(this.phoneNo);
	}

	public String getEncryptedCellPhoneNo(){
		return getEncryptedData(this.cellPhoneNo);
	}

	public String getEncryptedEmail(){
		return getEncryptedData(this.email);
	}

	public String getEncryptedWebsiteUrl(){
		return getEncryptedData(this.websiteUrl);
	}

	public String getEncryptedFacebookUrl(){
		return getEncryptedData(this.facebookUrl);
	}

	public String getEncryptedTwitterUrl(){
		return getEncryptedData(this.twitterUrl);
	}

	public String getEncryptedInstagramUrl(){
		return getEncryptedData(this.instagramUrl);
	}

	/***********************
	 * 복호화 파라미터
	 ***********************/
	public String getDecryptedPhoneNo(){
		return getDecryptedData(this.phoneNo);
	}
	
	public String getDecryptedCellPhoneNo(){
		return getDecryptedData(this.cellPhoneNo);
	}
	
	public String getDecryptedEmail(){
		return getDecryptedData(this.email);
	}
	
	public String getDecryptedWebsiteUrl(){
		return getDecryptedData(this.websiteUrl);
	}
	
	public String getDecryptedFacebookUrl(){
		return getDecryptedData(this.facebookUrl);
	}
	
	public String getDecryptedTwitterUrl(){
		return getDecryptedData(this.twitterUrl);
	}
	
	public String getDecryptedInstagramUrl(){
		return getDecryptedData(this.instagramUrl);
	}
	
	public int getContactInfoId() {
		return contactInfoId;
	}
	public void setContactInfoId(int contactInfoId) {
		this.contactInfoId = contactInfoId;
	}
	public int getProfileId() {
		return profileId;
	}
	public void setProfileId(int profileId) {
		this.profileId = profileId;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getCellPhoneNo() {
		return cellPhoneNo;
	}
	public void setCellPhoneNo(String cellPhoneNo) {
		this.cellPhoneNo = cellPhoneNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getWebsiteUrl() {
		return websiteUrl;
	}
	public void setWebsiteUrl(String websiteUrl) {
		this.websiteUrl = websiteUrl;
	}
	public String getFacebookUrl() {
		return facebookUrl;
	}
	public void setFacebookUrl(String facebookUrl) {
		this.facebookUrl = facebookUrl;
	}
	public String getTwitterUrl() {
		return twitterUrl;
	}
	public void setTwitterUrl(String twitterUrl) {
		this.twitterUrl = twitterUrl;
	}
	public String getInstagramUrl() {
		return instagramUrl;
	}
	public void setInstagramUrl(String instagramUrl) {
		this.instagramUrl = instagramUrl;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getCreateUserId() {
		return createUserId;
	}
	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}

	public String getDecryptedData(String dataStr){
		String resultStr = "";
		try {
			if(!org.apache.commons.lang.StringUtils.isEmpty(dataStr)){
				AES256Util aes256Util = new AES256Util(CommonConstant.IV);
				try {
					resultStr = aes256Util.decrypt(dataStr);
				} catch (NoSuchAlgorithmException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					resultStr = "";
				} catch (GeneralSecurityException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					resultStr = "";
				}				
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultStr;
	}

	public String getEncryptedData(String dataStr){
		String resultStr = StringUtils.EMPTY;
		try {
			if(!org.apache.commons.lang.StringUtils.isEmpty(dataStr)){
				AES256Util aes256Util = new AES256Util(CommonConstant.IV);
				try {
					resultStr = aes256Util.encrypt(dataStr);
				} catch (NoSuchAlgorithmException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (GeneralSecurityException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultStr;
	}
}
