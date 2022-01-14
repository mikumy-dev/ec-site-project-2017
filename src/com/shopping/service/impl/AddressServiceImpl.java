package com.shopping.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.dao.AddrMapper;
import com.shopping.dao.AreaMapper;
import com.shopping.dao.CityMapper;
import com.shopping.dao.ProvinceMapper;
import com.shopping.pojo.Addr;
import com.shopping.pojo.Area;
import com.shopping.pojo.City;
import com.shopping.pojo.Province;
import com.shopping.service.IAddressService;
/**
 * 
 * @author zz
 *
 */
@Service(IAddressService.SERVICE_NAME)
public class AddressServiceImpl implements IAddressService {
	
	@Autowired
	private ProvinceMapper provinceMapper;
	@Autowired
	private CityMapper cityMapper;
	@Autowired
	private AreaMapper areaMapper;
	
	@Override
	public List<Province> selectAllProvince() {
		return provinceMapper.selectAll();
	}
	
	@Override
	public List<City> selectCityByProvinceId(int pid) {
		return cityMapper.selectCityByProvinceId(pid);
	}
	
	@Override
	public List<Area> selectAreaByCityId(int cityId) {
		return areaMapper.selectAreaByCityId(cityId);
	}
	
	@Autowired
	private AddrMapper addrMapper;
	
	@Override
	public void insertAddress(Addr address) {
		//组成成一条完整的地址信息，不包括邮编
		StringBuffer sb = new StringBuffer();
		
		String provinceName = provinceMapper.selectById(Integer.valueOf(address.getProvince())).getProvince();
		sb.append(provinceName).append(" ");
		
		String cityName = cityMapper.selectByCityId(address.getCity()).getCity();
		sb.append(cityName).append(" ");
		
		String areaName = areaMapper.selectByAreaId(address.getArea()).getArea();
		sb.append(areaName).append(" ");
		
		sb.append(address.getAddr().trim());
		
		address.setAddr(sb.toString());
		/*
		 * 下面的属性没有默认值
		 */
		address.setCreatedBy(" ");
		address.setLastUpdateBy(" ");
		address.setCreatedDate(new Date());
		address.setLastUpdateDate(new Date());
		
		addrMapper.insertSelective(address);
	}

	
	@Override
	public List<Map<String,Object>> selectAllAddrByUserId(int userId) {
		return addrMapper.selectAllAddrByUserId(userId);
	}
	
	@Override
	public void delAddressById(int aid, int uid) {
		addrMapper.delAddressById(aid,uid);
	}
	
	@Override
	public Addr selectAddrById(int id) {
		return addrMapper.selectByPrimaryKey(id);
	}
	
	@Override
	public int update(Addr addr) {
		return addrMapper.updateByPrimaryKeySelective(addr);
	}
	
}
