package com.kt.Mapper;

import java.util.List;

import com.kt.entity.Admin;
import com.kt.entity.Books;

public interface BooksMapper {
	
	public List<Books> findAllBooks(int start); 
	
	public void addbook(Books books);
	
	public Books findBooksById(int id);
	
	public void updateBooksById(Books books);
	
	public void deleteBooksById(int id);
	
	public int countBooks();

}
