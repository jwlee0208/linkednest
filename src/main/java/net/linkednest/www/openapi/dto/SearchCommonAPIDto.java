package net.linkednest.www.openapi.dto;

import org.apache.ibatis.type.Alias;

@Alias("flickr.searchFlickrDto")
public class SearchCommonAPIDto {
    private String keyword;
    
    private String type;

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }
    
    public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "SearchCommonAPIDto [keyword=" + keyword + ", type=" + type + "]";
	}
    
}
