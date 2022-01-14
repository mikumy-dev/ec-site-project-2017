package com.shopping.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.dao.ProductMapper;
import com.shopping.dao.ShopCartMapper;
import com.shopping.pojo.Product;
import com.shopping.pojo.ShopCart;
import com.shopping.service.IShopCartService;

/**
 * 
 * @author zz
 *
 */
@Service(value=IShopCartService.SERVICE_NAME)
public class ShopCartServiceImpl implements IShopCartService{
	
	@Autowired
	private ShopCartMapper shopCartMapper;
	@Autowired
	private ProductMapper productMapper;
	@Override
	public int addToShopCart(int userId,int pid, int qualtity, double price,String remark) {
		ShopCart sc = new ShopCart();
		sc.setProductId(pid);
		sc.setQuantity(qualtity);
		double totalMoney = qualtity * price;
		sc.setTotalMoney(totalMoney);
		sc.setUserId(userId);
		sc.setRemark(remark);
		sc.setPrice(price);
		return shopCartMapper.insert(sc);
	}

	@Override
	public List<Map<String, Object>> findAllByUserId(int uid) {
		 List<Map<String,Object>> list = shopCartMapper.findAllByUserId(uid);
		 for (Map<String, Object> map : list) {
			int pid = (Integer) map.get("product_id");
			//查询商品信息
			Product product = productMapper.selectByPrimaryKey(pid);
			map.put("pname", product.getProductName());
			map.put("remark", product.getTasteid());
			map.put("imgUrl", product.getProductPictureSmall()); //图片的路径
		}
		 return list;
	}
	
	@Override
	public void deleteById(int spid) {
		shopCartMapper.deleteById(spid);
	}
}
