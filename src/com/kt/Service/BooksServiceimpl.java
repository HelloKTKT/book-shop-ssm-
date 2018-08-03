package com.kt.Service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.kt.Mapper.AdminMapper;
import com.kt.Mapper.BooksMapper;
import com.kt.entity.Admin;
import com.kt.entity.Books;

@Service("booksService")
public class BooksServiceimpl implements BooksService {
	
	@Resource
	BooksMapper booksMapper;
	
	@Override
	public List<Books> findAllBooks(int start) {
		// TODO Auto-generated method stub
		return booksMapper.findAllBooks(start);
	}
	public void addbook(Books books){
		booksMapper.addbook(books);
	}
	public Books findBooksById(int id){
		return booksMapper.findBooksById(id);
	}
	
	public void updateBooksById(Books books){
		booksMapper.updateBooksById(books);
	}
	public void deleteBooksById(int id){
		booksMapper.deleteBooksById(id);
	}
	
	public int countBooks(){
		return booksMapper.countBooks();
	}

}
