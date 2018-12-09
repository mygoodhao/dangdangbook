package com.oracle.shubook.dao;

import java.util.List;

import com.oracle.shubook.model.Book;

public interface BookDao {

	boolean save(Book book);

	List<Book> findAll(int currentPage, String name, int sid);

	int total(String name, int sid);

	int delById(int id);

    Book find(int id);

	boolean update(Book book);
}
