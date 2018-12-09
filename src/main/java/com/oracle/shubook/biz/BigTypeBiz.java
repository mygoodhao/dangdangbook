package com.oracle.shubook.biz;

import java.util.List;

import com.oracle.shubook.model.BigType;

public interface BigTypeBiz {

	boolean save(String name);

	List<BigType> findAllBigType();


}
