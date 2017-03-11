package net.linkednest.user.dao;

import java.util.List;

import net.linkednest.user.dto.UserDto;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import net.linkednest.common.dto.CodeDto;
import net.linkednest.user.dto.UserDto;

@Repository("UserDao")
public class UserDao extends SqlSessionDaoSupport{
	/**
	 * 사용자 정보 조회
	 * @param userDto
	 * @return
	 * @throws Exception
	 */
	public UserDto selectUserInfo(UserDto userDto) throws Exception{
		return getSqlSession().selectOne("sql.user.selectUserInfo", userDto);
	}
	/**
	 * 사용자 등록
	 * @param userDto
	 * @return
	 * @throws Exception
	 */
	public int insertUserInfo(UserDto userDto) throws Exception{
		return getSqlSession().insert("sql.user.insertUserInfo", userDto);
	}	
	/**
	 * @brief 사용자 정보 수정
	 * @param userDto
	 * @return
	 * @throws Exception
	 */
    public int modifyUserInfo(UserDto userDto) throws Exception{
        return getSqlSession().update("sql.user.updateUserInfo", userDto);
    }   


}
