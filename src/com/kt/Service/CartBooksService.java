package com.kt.Service;

import java.util.List;

import com.kt.entity.Admin;
import com.kt.entity.CartBooks;

public interface CartBooksService {
	
	public List<CartBooks> findCartBooksByOid(String oid);

}
