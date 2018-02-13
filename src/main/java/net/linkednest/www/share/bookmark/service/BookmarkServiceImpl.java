package net.linkednest.www.share.bookmark.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.linkednest.www.share.bookmark.dao.BookmarkDao;
import net.linkednest.www.share.bookmark.dto.BookmarkDto;

@Service
public class BookmarkServiceImpl implements BookmarkService{
    @Resource(name="BookmarkDao")
    private BookmarkDao bookmarkDao;
    
    @Override
    public List<BookmarkDto> getBookmarkList(BookmarkDto bookmarkDto) throws Exception {
        return this.bookmarkDao.selectBookmarkList(bookmarkDto);
    }
    
    @Override
    public int addBookmarkInfo(BookmarkDto bookmarkDto) throws Exception {
        return this.bookmarkDao.insertBookmarkInfo(bookmarkDto);
    }
    
    @Override
    public int modifyBookmarkInfo(BookmarkDto bookmarkDto) throws Exception {
        return this.bookmarkDao.updateBookmarkInfo(bookmarkDto);
    }
    
    @Override
    public int removeBookmarkInfo(BookmarkDto bookmarkDto) throws Exception {
        return this.bookmarkDao.deleteBookmarkInfo(bookmarkDto);
    }
}
