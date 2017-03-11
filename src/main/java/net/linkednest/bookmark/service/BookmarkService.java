package net.linkednest.bookmark.service;

import java.util.List;

import net.linkednest.bookmark.dto.BookmarkDto;
import net.linkednest.bookmark.dto.BookmarkDto;

public interface BookmarkService {

    List<BookmarkDto> getBookmarkList(BookmarkDto bookmarkDto) throws Exception;

    int addBookmarkInfo(BookmarkDto bookmarkDto) throws Exception;

    int modifyBookmarkInfo(BookmarkDto bookmarkDto) throws Exception;

    int removeBookmarkInfo(BookmarkDto bookmarkDto) throws Exception;

}
