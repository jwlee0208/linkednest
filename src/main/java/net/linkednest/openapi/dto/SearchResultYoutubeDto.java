package net.linkednest.openapi.dto;

import org.apache.ibatis.type.Alias;

import com.google.api.services.youtube.model.ResourceId;
import com.google.api.services.youtube.model.SearchResultSnippet;

@Alias("openapi.searchResultYoutubeDto")
public class SearchResultYoutubeDto {

    private SearchResultSnippet searchResultSnippet;
    private ResourceId          resourceId;
    
    public SearchResultSnippet getSearchResultSnippet() {
        return searchResultSnippet;
    }
    public void setSearchResultSnippet(SearchResultSnippet searchResultSnippet) {
        this.searchResultSnippet = searchResultSnippet;
    }
    public ResourceId getResourceId() {
        return resourceId;
    }
    public void setResourceId(ResourceId resourceId) {
        this.resourceId = resourceId;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("SearchResultYoutubeDto{");
        sb.append("searchResultSnippet=").append(searchResultSnippet);
        sb.append(", resourceId=").append(resourceId);
        sb.append('}');
        return sb.toString();
    }
}
