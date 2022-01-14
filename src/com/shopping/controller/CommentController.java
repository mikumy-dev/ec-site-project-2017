package com.shopping.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.shopping.bean.CommentOnPage;
import com.shopping.pojo.Comment;
import com.shopping.pojo.Order;
import com.shopping.pojo.User;
import com.shopping.service.ICommentService;
import com.shopping.service.IOrderService;
import com.shopping.util.PageUtil;

@Controller
@RequestMapping("/comment")
public class CommentController {

	@Autowired
	private ICommentService commentService;
	
	@Autowired
	private IOrderService orderService;
	
	public PageUtil pageUtil;
	
	@ResponseBody
	@RequestMapping("/addComment")
	public String addComment(@RequestBody List<Comment> commentlist, HttpSession session){
		User user = (User) session.getAttribute("user");
		int id = (Integer) session.getAttribute("orderid");
		for(Comment comment:commentlist){
			comment.setCreatedBy(user.getUsername());
			comment.setCreatedDate(new Date());
			commentService.insertSelective(comment);
		}
		Order order = new Order();
		order.setId(id);
		order.setStatus("4");
		orderService.updateStatus(order);
		return null;
	}
	
	@RequestMapping("/selectByUserId")
	public String selectByUserId(int userid,int pageNo ,Model model){
		int totalCount = commentService.findNumByUserId(userid);
		pageUtil = new PageUtil(5, totalCount);
		if (pageNo != 0) {
			pageUtil.setPageNo(pageNo);
		}else{
			pageNo = 1;
		}
		List<CommentOnPage> commentList = commentService.selectByUserId(userid,pageUtil.getPageNo(), pageUtil.getPageSize());
		if (commentList != null && commentList.size() > 0) {
			pageUtil.setData(commentList);
			model.addAttribute("pageUtil", pageUtil);
		}
		
		return "frontend/comment";
	}
	
	@ResponseBody
	@RequestMapping(value="/selectByProductId",produces="text/html;charset=utf-8")
	public String selectByProductId(int productid,Model model){
		List<CommentOnPage> commentList = commentService.selectByProductId(productid);
//		model.addAttribute("commentList", commentList);
		String json = JSON.toJSONString(commentList);
		return json;
	}
	
	/*
	 * 查所有
	 */
	@RequestMapping(value = "/findComment")
	public String findProduct(Model model, Integer pageNo) {
		int totalCount = commentService.findNum();
		pageUtil = new PageUtil(5, totalCount);
		if (pageNo == null){
			pageNo = 1;
		}
		if (pageNo != 0) {
			pageUtil.setPageNo(pageNo);
		}
		List<Comment> comments = commentService.findComment(pageUtil.getPageNo(), pageUtil.getPageSize());
		if (comments != null && comments.size() > 0) {
			pageUtil.setData(comments);
			model.addAttribute("pageUtil", pageUtil);
		}
		return "backend/commentList";
	}
	
	@RequestMapping("/deleteComment")
	public String deleteComment(Integer cid){
		commentService.deleteComment(cid);
		return "redirect:/comment/findComment?pageNo=1";
	}
}
