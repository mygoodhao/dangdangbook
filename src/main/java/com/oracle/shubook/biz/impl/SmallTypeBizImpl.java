package com.oracle.shubook.biz.impl;

import java.util.List;

import com.oracle.shubook.biz.SmallTypeBiz;
import com.oracle.shubook.dao.SmallTypeDao;
import com.oracle.shubook.dao.impl.SmallTypeDaoimpl;
import com.oracle.shubook.model.SmallType;


public class SmallTypeBizImpl implements SmallTypeBiz {

	@Override
	public boolean save(SmallType smallType) {
		SmallTypeDao smallTypeDao = new SmallTypeDaoimpl();
		return smallTypeDao.save(smallType);
	}

	@Override
	public List<SmallType> findAllByBid(int bid) {
		SmallTypeDao smallTypeDao = new SmallTypeDaoimpl();
		return smallTypeDao.findAllByBid(bid);
	}

	@Override
	public int findBidById(int sid) {
		SmallTypeDao smallTypeDao = new SmallTypeDaoimpl();
		return smallTypeDao.findBidById(sid);
	}

}
