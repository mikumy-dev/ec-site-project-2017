package com.shopping.dao;

import java.util.List;

import com.shopping.pojo.Area;
/**
 * 
 * @author zz
 *
 */
public interface AreaMapper {

	List<Area> selectAreaByCityId(int cid);
	
	Area selectByAreaId(String aid);

}
