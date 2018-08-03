package com.kt.Service;

import java.util.List;

import com.kt.entity.User;

public interface UserService {
	
	public List<User> findAllUser(int start);
	
	public int countUsers();

}
