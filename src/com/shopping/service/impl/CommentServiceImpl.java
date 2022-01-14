package com.shopping.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.bean.CommentOnPage;
import com.shopping.dao.CommentMapper;
import com.shopping.pojo.Comment;
import com.shopping.service.ICommentService;
@Service("commentService")
public class CommentServiceImpl implements ICommentService {

	@Autowired
	private CommentMapper commentMapper;
	@Override
	public int insertSelective(Comment record) {
		return commentMapper.insertSelective(record);
	}

	@Override
	public List<CommentOnPage> selectByUserId(Integer userid,int pageStart, int pageSize) {
		pageStart=(pageStart-1)*pageSize;
		List<CommentOnPage> commentList = commentMapper.selectByUserId(userid,pageStart,pageSize);
		return commentList;
	}

	@Override
	public List<CommentOnPage> selectByProductId(Integer productid) {
		return commentMapper.selectByProductId(productid);
	}
	
	@Override
	public List<Comment> findComment(int pageStart, int pageSize) {
		pageStart=(pageStart-1)*pageSize;
		return commentMapper.findComment(pageStart,pageSize);
	}
	
	@Override
	public int findNum() {
		return commentMapper.findNum();
	}
	
	@Override
	public int deleteComment(Integer id) {
		return commentMapper.deleteComment(id);
	}

	@Override
	public int findNumByUserId(Integer userid) {
		return commentMapper.findNumByUserId(userid);
	}

}
