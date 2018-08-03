package com.kt.Service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.kt.Mapper.AdminMapper;
import com.kt.entity.Admin;

@Service("adminService")
public class AdminServiceimpl implements AdminService {
	
	@Resource
	AdminMapper adminMapper;
	
	
	public Admin findAdmin(Admin admin){
		
		return adminMapper.findAdmin(admin);
	}


	@Override
	public void updateAdmin(Admin admin) {
		adminMapper.updateAdmin(admin);
	}

}
