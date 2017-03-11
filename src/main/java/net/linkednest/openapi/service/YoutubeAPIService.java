package net.linkednest.openapi.service;

import java.util.List;

import com.google.api.services.youtube.model.SearchResult;

public interface YoutubeAPIService {

    public List<SearchResult> searchStreamList(String keyword);

}
