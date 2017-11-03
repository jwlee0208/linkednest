package net.linkednest.profile.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

import net.linkednest.www.common.paging.PageParam;

@Alias("profile.searchProfileDto")
public class SearchProfileDto extends PageParam{

	private String      searchCondition;
    private String      searchText;
    
    private int			profileId;
    private int			profileType;
    private String		catId1;
    
    private String		area;
    
    private String		country;
    
    private List<ProfileAttrDto> profileAttrList;

    public String getSearchCondition() {
        return searchCondition;
    }

    public void setSearchCondition(String searchCondition) {
        this.searchCondition = searchCondition;
    }

    public String getSearchText() {
        return searchText;
    }

    public void setSearchText(String searchText) {
        this.searchText = searchText;
    }

	public int getProfileId() {
		return profileId;
	}

	public void setProfileId(int profileId) {
		this.profileId = profileId;
	}

	public int getProfileType() {
		return profileType;
	}

	public void setProfileType(int profileType) {
		this.profileType = profileType;
	}

	public String getCatId1() {
		return catId1;
	}

	public void setCatId1(String catId1) {
		this.catId1 = catId1;
	}
	
	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public List<ProfileAttrDto> getProfileAttrList() {
		return profileAttrList;
	}

	public void setProfileAttrList(List<ProfileAttrDto> profileAttrList) {
		this.profileAttrList = profileAttrList;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	@Override
	public String toString() {
		return "SearchProfileDto [searchCondition=" + searchCondition + ", searchText=" + searchText + ", profileId="
				+ profileId + ", profileType=" + profileType + ", catId1=" + catId1 + ", area=" + area + ", country="
				+ country + ", profileAttrList=" + profileAttrList + "]";
	}
	
}
