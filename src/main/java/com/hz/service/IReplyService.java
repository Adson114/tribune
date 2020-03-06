package com.hz.service;

import com.hz.bean.Reply;

import java.util.List;

public interface IReplyService {

    List<Reply> queryTopicReply(Integer userId);

    List<Reply> detailReply(Integer topicId);

    int countReply(Integer topicId);

    int insertReply(Reply reply);

    List<Reply>adminToReply();

    int delReply(Reply reply);

    List<Reply>test(Integer userId);

    int removeReply(Reply reply);
}
