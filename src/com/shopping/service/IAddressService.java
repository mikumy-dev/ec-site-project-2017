package com.shopping.service;

import java.util.List;
import java.util.Map;

import com.shopping.pojo.Addr;
import com.shopping.pojo.Area;
import com.shopping.pojo.City;
import com.shopping.pojo.Province;

/**
 * 
 * @author zz
 *
 */
public interface IAddressService {
	public static final String SERVICE_NAME = "com.admin.service.impl.AddressServiceImpl";
	/**
	 * 查询所有的省份
	 * @return
	 */
	List<Province> selectAllProvince();
	/**
	 * 查询省份下的所有城市
	 * @param pid  省份id
	 * @return
	 */
	List<City> selectCityByProvinceId(int pid);
	/**
	 * 查询城市下的所有地区
	 * @param cityId  城市id
	 * @return
	 */
	List<Area> selectAreaByCityId(int cityId);
	/**
	 * 添加一个收货地址
	 * @param address
	 */
	void insertAddress(Addr address);
	/**
	 * 查询用户的所有收货地址
	 * @param userId  用户id
	 * @return
	 */
	List<Map<String,Object>> selectAllAddrByUserId(int userId);
	/**
	 * 删除用户的一个收货地址
	 * @param aid  地址id
	 * @param uid  用户id
	 */
	void delAddressById(int aid, int uid);
	/**
	 * 查找by ID
	 * @param id
	 * @return
	 */
	Addr selectAddrById(int id);
	/**
	 * 更新
	 * @param addr
	 * @return
	 */
	int update(Addr addr);

}
