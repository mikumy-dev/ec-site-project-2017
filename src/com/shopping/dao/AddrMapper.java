package com.shopping.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.shopping.pojo.Addr;

public interface AddrMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Addr record);

    int insertSelective(Addr record);

    Addr selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Addr record);

    int updateByPrimaryKey(Addr record);

	Addr selectAddressByUserId(Integer userid);

	List<Map<String,Object>> selectAllAddrByUserId(Integer userId);
	/**
	 * 删除用户的一个收货地址
	 * @param aid  地址id
	 * @param uid  用户id
	 */
	void delAddressById(@Param(value = "aid") int aid, @Param(value = "uid") int uid);
}