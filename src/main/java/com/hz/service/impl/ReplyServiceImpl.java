package com.hz.service.impl;

import com.hz.bean.Reply;
import com.hz.dao.IReplyDao;
import com.hz.service.IReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReplyServiceImpl implements IReplyService{
    @Autowired
    private IReplyDao ReplyDao;


    @Override
    public List<Reply> queryTopicReply(Integer userId) {
        return ReplyDao.queryTopicReply(userId);
    }

    @Override
    public List<Reply> detailReply(Integer topicId) {
        return ReplyDao.detailReply(topicId);
    }

    @Override
    public int countReply(Integer topicId) {
        return ReplyDao.countReply(topicId);
    }

    @Override
    public int insertReply(Reply reply) {
        return ReplyDao.insertReply(reply);
    }

    @Override
    public List<Reply> adminToReply() {
        return ReplyDao.adminToReply();
    }

    @Override
    public int delReply(Reply reply) {
        return ReplyDao.delReply(reply);
    }

    @Override
    public List<Reply> test(Integer userId) {
        return ReplyDao.test(userId);
    }

    @Override
    public int removeReply(Reply reply) {
        return ReplyDao.removeReply(reply);
    }


}
