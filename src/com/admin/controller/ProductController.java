package com.admin.controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.admin.service.IproductService;
import com.admin.service.ItasteService;
import com.shopping.pojo.Product;
import com.shopping.pojo.Taste;
import com.shopping.pojo.Type;
import com.shopping.pojo.User;
import com.shopping.service.ItypeService;
import com.shopping.util.FileTransferUtil;
import com.shopping.util.PageUtil;

@Controller
@RequestMapping(value = "/product")
public class ProductController {
	@Autowired
	private IproductService iproductService;
	@Autowired
	private ItypeService itypeService;
	@Autowired
	private ItasteService itasteService;
	
	public PageUtil pageUtil;

	@RequestMapping(value = "/findProduct")
	public String findProduct(Model model, int pageNo) {
		int totalCount = iproductService.findNum();
		pageUtil = new PageUtil(5, totalCount);

		if (pageNo != 0) {
			pageUtil.setPageNo(pageNo);
		}
		List<Product> products = iproductService.findProduct(
				pageUtil.getPageNo(), pageUtil.getPageSize());
		if (products != null && products.size() > 0) {
			pageUtil.setData(products);
			model.addAttribute("pageUtil", pageUtil);
		}
		return "backend/productList";
	}

	@RequestMapping(value = "/saveProduct")
	public String saveProduct(
			Product product,
			HttpSession session,
			@RequestParam(value = "bigpic", required = false) CommonsMultipartFile productPictureBigFile,
			@RequestParam(value = "midpic", required = false) CommonsMultipartFile productPictureMidFile,
			@RequestParam(value = "smallpic", required = false) CommonsMultipartFile productPictureSmallFile)
			throws IOException {
		User user = (User) session.getAttribute("reuser");
		
		// 设置商品大中小图片路径并将图片复制至workspace
		if(productPictureBigFile.getSize()>0){
			product.setProductPictureBig(FileTransferUtil.transfer(productPictureBigFile,session));
		}
		if(productPictureMidFile.getSize()>0){
			product.setProductPictureMid(FileTransferUtil.transfer(productPictureMidFile,session));
		}
		if(productPictureSmallFile.getSize()>0){
			product.setProductPictureSmall(FileTransferUtil.transfer(productPictureSmallFile,session));
		}
		// 获取商品细节富文本中的图片并将图片复制至workspace
		// 图片路径正则表达式
		String imgFileRegex = "userImg/\\d{19}\\.jpg";
		Pattern pattern = Pattern.compile(imgFileRegex);
		CharSequence input = product.getProductDetails();
		if (input != null) {
			Matcher matcher = pattern.matcher(input);
			// 获取富文本中的所有图片路径，然后从服务器复制到workspace
			while (matcher.find()) {
				// 相对路径
				String relativePath = matcher.group();
				// workspace路径
				String absolutePathWorkspace = "D:/MyEclipse 10/shopping/WebRoot/"
						+ relativePath;
				// 服务器路径
				String absolutePathServer = session.getServletContext()
						.getRealPath("/") + relativePath;

				FileInputStream inputStream = new FileInputStream(absolutePathServer);
				FileOutputStream outputStream = new FileOutputStream(absolutePathWorkspace);
				int buffer_size = 1024;
				byte[] by = new byte[buffer_size];
				int len = 0;
				// 读取字节数组再输出
				while ((len = inputStream.read(by, 0, buffer_size)) != -1) {
					outputStream.write(by, 0, len);
				}
				inputStream.close();
				outputStream.close();
			}
		}
		if(product.getId()==null||product.getId()==0){
			int i = iproductService.insertSelective(product, user);
			if (i > 0) {
				return "redirect:/product/findProduct?pageNo=1";
			} else {
				return "backend/productAdd";
			}			
		}else{
			int i = iproductService.updateByPrimaryKeySelective(product, user);
			if (i > 0) {
				return "redirect:/product/findProduct?pageNo=1";
			} else {
				return "redirect:/product/updateProduct?id="+product.getId();
			}
		}

	}

	@RequestMapping(value = "/deleteProduct")
	public String deleteProduct(int id) {
		iproductService.deleteByPrimaryKey(id);
		return "redirect:/product/findProduct?pageNo=1";

	}
	
	@RequestMapping(value = "/updateProduct")
	public String updateProduct(int id, Model model) {
		Product product = iproductService.selectByPrimaryKey(id);
		List<Type> types=itypeService.selectList();
		List<Taste> tastes=itasteService.selectByPrimaryKey();
		model.addAttribute("product", product);
		model.addAttribute("types", types);
		model.addAttribute("tastes", tastes);
		return "backend/productModify";
	}

	@RequestMapping(value = "/addProduct")
	public String addProduct(Model model) {
		List<Type> types=itypeService.selectList();
		List<Taste> tastes=itasteService.selectByPrimaryKey();
		model.addAttribute("types", types);
		model.addAttribute("tastes", tastes);
		return "backend/productAdd";
	}

	

}
