package com.kt.Service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.kt.Mapper.AdminMapper;
import com.kt.Mapper.CartBooksMapper;
import com.kt.entity.Admin;
import com.kt.entity.CartBooks;

@Service("cartbooksService")
public class CartBooksServiceimpl implements CartBooksService {
	
	@Resource
	CartBooksMapper cartbooksMapper;
	
	
	public List<CartBooks> findCartBooksByOid(String oid){
		return cartbooksMapper.findCartBooksByOid(oid);
	}

}
