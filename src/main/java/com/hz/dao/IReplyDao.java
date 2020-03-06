package com.hz.dao;

import com.hz.bean.Reply;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface IReplyDao {

    List<Reply> queryTopicReply(@Param(value="userId")Integer userId);

    List<Reply> detailReply(@Param(value="topicId")Integer topicId);

    int countReply(@Param(value="topicId")Integer topicId);

    int insertReply(Reply reply);

    List<Reply>adminToReply();

    int delReply(Reply reply);

    List<Reply>test(@Param(value="userId")Integer userId);

    int removeReply(Reply reply);
}

