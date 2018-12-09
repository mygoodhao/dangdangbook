package com.oracle.shubook.dao;

import java.util.List;

import com.oracle.shubook.model.BigType;

public interface BigTypeDao {

	boolean save(String name);

	List<BigType> findAll();

}
