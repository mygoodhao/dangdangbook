package com.oracle.shubook.biz.impl;

import java.util.List;

import com.oracle.shubook.biz.BigTypeBiz;
import com.oracle.shubook.dao.BigTypeDao;
import com.oracle.shubook.dao.impl.BigTypeDaoJdbcImpl;
import com.oracle.shubook.model.BigType;

public class BigTypeBizImpl implements BigTypeBiz {

	@Override
	public boolean save(String name) {
		BigTypeDao bigTypeDao = new BigTypeDaoJdbcImpl();
		return bigTypeDao.save(name);
	}

	@Override
	public List<BigType> findAllBigType() {
		BigTypeDao bigTypeDao = new BigTypeDaoJdbcImpl();
		return bigTypeDao.findAll();
	}

}
