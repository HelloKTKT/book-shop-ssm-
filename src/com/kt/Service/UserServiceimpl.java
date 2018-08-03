package com.kt.Service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.kt.Mapper.AdminMapper;
import com.kt.Mapper.BooksMapper;
import com.kt.Mapper.UserMapper;
import com.kt.entity.Admin;
import com.kt.entity.Books;
import com.kt.entity.User;

@Service("userService")
public class UserServiceimpl implements UserService {
	@Resource
	private UserMapper userMapper;
	
	public List<User> findAllUser(int start){
		return userMapper.findAllUser(start);
		
	}
	
	public int countUsers(){
		return userMapper.countUsers();
	}
	


}
