package com.shopping.service;

import java.util.List;

import com.shopping.bean.CommentOnPage;
import com.shopping.pojo.Comment;

public interface ICommentService {
	int insertSelective(Comment record);

	List<CommentOnPage> selectByUserId(Integer userid,int pageStart, int pageSize);
	
	List<CommentOnPage> selectByProductId(Integer productid);

	int findNum();
	
	int findNumByUserId(Integer userid);
	
	List<Comment> findComment(int pageNo, int pageSize);

	int deleteComment(Integer id);
}
