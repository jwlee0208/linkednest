package net.linkednest.www.profile.dto;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;
import net.linkednest.common.paging.PageParam;
import org.apache.ibatis.type.Alias;

@JsonInclude(JsonInclude.Include.NON_NULL)
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
		final StringBuffer sb = new StringBuffer("SearchProfileDto{");
		sb.append("searchCondition='").append(searchCondition).append('\'');
		sb.append(", searchText='").append(searchText).append('\'');
		sb.append(", profileId=").append(profileId);
		sb.append(", profileType=").append(profileType);
		sb.append(", catId1='").append(catId1).append('\'');
		sb.append(", area='").append(area).append('\'');
		sb.append(", country='").append(country).append('\'');
		sb.append(", profileAttrList=").append(profileAttrList);
		sb.append('}');
		return sb.toString();
	}
}
