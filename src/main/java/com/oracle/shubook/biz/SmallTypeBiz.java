package com.oracle.shubook.biz;

import java.util.List;

import com.oracle.shubook.model.SmallType;

public interface SmallTypeBiz {

	 boolean save(SmallType smallType);

	List<SmallType> findAllByBid(int bid);


    int findBidById(int sid);
}
