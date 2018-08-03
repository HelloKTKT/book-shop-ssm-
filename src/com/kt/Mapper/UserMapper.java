package com.kt.Mapper;

import java.util.List;


import com.kt.entity.User;

public interface UserMapper {
	
	public List<User> findAllUser(int start);
	
	public int countUsers();

}
