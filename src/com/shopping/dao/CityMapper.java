package com.shopping.dao;

import java.util.List;

import com.shopping.pojo.City;
/**
 * 
 * @author zz
 *
 */
public interface CityMapper {

	List<City> selectCityByProvinceId(int pid);
	
	City selectByCityId(String cid);

}
