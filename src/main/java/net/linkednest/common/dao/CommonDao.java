package net.linkednest.common.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import net.linkednest.common.dto.CodeDto;

@Repository("CommonDao")
public class CommonDao extends SqlSessionDaoSupport{
    public List<CodeDto> selectCodeList(CodeDto param) throws Exception{
        return getSqlSession().selectList("sql.common.selectCodeList", param);
    }

}
