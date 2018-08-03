package com.kt.Mapper;

import java.util.List;

import com.kt.entity.Admin;
import com.kt.entity.Books;
import com.kt.entity.CartBooks;

public interface CartBooksMapper {
	
	public List<CartBooks> findCartBooksByOid(String oid);

}
