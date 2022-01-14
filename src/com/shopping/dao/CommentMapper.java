package com.shopping.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shopping.bean.CommentOnPage;
import com.shopping.pojo.Comment;

public interface CommentMapper {
    int deleteByPrimaryKey(Integer id);    

    int insertSelective(Comment record);

    Comment selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Comment record);

    List<CommentOnPage> selectByUserId(@Param(value="userid")Integer userid,@Param(value="pageStart")int pageStart, @Param(value="pageSize")int pageSize);
    
    List<CommentOnPage> selectByProductId(Integer productid);

	List<Comment> findComment(@Param(value="pageStart")int pageStart, @Param(value="pageEnd")int pageSize);

	int findNum();
	
	int findNumByUserId(Integer userid);
	int deleteComment(Integer id);
}