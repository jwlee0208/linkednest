package net.linkednest.www.user.service;

import net.linkednest.www.user.dto.UserDto;

public interface UserService {
	public UserDto selectUserInfo(UserDto userDto) throws Exception;
	public int insertUserInfo(UserDto userDto) throws Exception;
	public int modifyUserInfo(UserDto userDto) throws Exception;
}
