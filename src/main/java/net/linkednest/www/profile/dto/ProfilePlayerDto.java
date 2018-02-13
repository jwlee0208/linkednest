package net.linkednest.www.profile.dto;

import org.apache.ibatis.type.Alias;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.NumberFormat;

import javax.validation.constraints.NotNull;

@Alias("profile.profilePlayerDto")
public class ProfilePlayerDto extends ProfileDto {
	
	private int 	profilePlayerId;
	/*@NotEmpty(message = "where is your birth date?")
	@NotNull(message = "where is your birth date?")*/
	private String 	birthDate;

	private float 	height = 0;
	private float	wgt = 0;
	private float 	weight = 0;
	private String 	birthPlace;
	private String 	education;
	private String 	hobbies;
	private String 	favoriteFood;
	/*@NotEmpty(message = "not selected your nationality.")
	@NotNull(message = "not selected your nationality.")*/
	private String 	nationality;
	/*@NotEmpty(message = "not selected your language.")
	@NotNull(message = "not selected your language.")*/
	private String 	language;
	
	public int getProfilePlayerId() {
		return profilePlayerId;
	}
	public void setProfilePlayerId(int profilePlayerId) {
		this.profilePlayerId = profilePlayerId;
	}
	public String getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public float getHeight() {
		return height;
	}

	public void setHeight(float height) {
		this.height = height;
	}

	public float getWgt() {
		return wgt;
	}

	public void setWgt(float wgt) {
		this.wgt = wgt;
	}

	public float getWeight() {
		return weight;
	}

	public void setWeight(float weight) {
		this.weight = weight;
	}

	// feet로 변환
	public double getHeightAsFeet() {
		return Double.parseDouble(String.format("%.1f",this.height * 0.0328084));
	}

	// found로 변환
	public double getWeightAsFound() {
		return Double.parseDouble(String.format("%.1f",this.weight * 2.20459)); 
	}
	
	public String getBirthPlace() {
		return birthPlace;
	}
	public void setBirthPlace(String birthPlace) {
		this.birthPlace = birthPlace;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getHobbies() {
		return hobbies;
	}
	public void setHobbies(String hobbies) {
		this.hobbies = hobbies;
	}
	public String getFavoriteFood() {
		return favoriteFood;
	}
	public void setFavoriteFood(String favoriteFood) {
		this.favoriteFood = favoriteFood;
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

	@Override
	public String toString() {
		final StringBuffer sb = new StringBuffer("ProfilePlayerDto{");
		sb.append("profilePlayerId=").append(profilePlayerId);
		sb.append(", birthDate='").append(birthDate).append('\'');
		sb.append(", height=").append(height);
		sb.append(", wgt=").append(wgt);
		sb.append(", weight=").append(weight);
		sb.append(", birthPlace='").append(birthPlace).append('\'');
		sb.append(", education='").append(education).append('\'');
		sb.append(", hobbies='").append(hobbies).append('\'');
		sb.append(", favoriteFood='").append(favoriteFood).append('\'');
		sb.append(", nationality='").append(nationality).append('\'');
		sb.append(", language='").append(language).append('\'');
		sb.append('}');
		return sb.toString();
	}
}
