package com.oracle.shubook.dao;

import java.util.List;

import com.oracle.shubook.model.SmallType;

public interface SmallTypeDao {
	boolean save(SmallType smallType);
	
	List<SmallType> findAllByBid(int bid);

    int findBidById(int sid);
}
