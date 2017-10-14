package net.linkednest.www.bookmark.dao;

import java.util.List;

import net.linkednest.www.bookmark.dto.BookmarkDto;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository("BookmarkDao")
public class BookmarkDao extends SqlSessionDaoSupport{
    /**
     * @brief select bookmark list data.
     * @param param
     * @return
     * @throws Exception
     */
    public List<BookmarkDto> selectBookmarkList(BookmarkDto param) throws Exception{
        return getSqlSession().selectList("sql.bookmark.selectBookmarkList", param);
    }
    /**
     * @brief insert bookmark info.
     * @param param
     * @return
     * @throws Exception
     */
    public int insertBookmarkInfo(BookmarkDto param) throws Exception{
        return getSqlSession().insert("sql.bookmark.insertBookmarkInfo", param);
    }
    /**
     * @brief update bookmark info.
     * @param param
     * @return
     * @throws Exception
     */
    public int updateBookmarkInfo(BookmarkDto param) throws Exception{
        return getSqlSession().update("sql.bookmark.updateBookmarkInfo", param);
    }
    /**
     * @brief delete bookmark info.
     * @param param
     * @return
     * @throws Exception
     */
    public int deleteBookmarkInfo(BookmarkDto param) throws Exception{
        return getSqlSession().delete("sql.bookmark.deleteBookmarkInfo", param);
    }
}
