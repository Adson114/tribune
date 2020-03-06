package com.hz.service.impl;

import com.hz.bean.Topic;
import com.hz.dao.ITopicDao;
import com.hz.service.ITopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class TopicServiceImpl implements ITopicService {

    @Autowired
    private ITopicDao topicDao;

    @Override
    public List<Topic> queryContent(){

        return topicDao.queryContent();
    }

    @Override
    public List<Topic> queryTabSon(Integer tabId){
        return  topicDao.queryTabSon(tabId);
    }

    @Override
    public List<Topic> queryTopicTitle(Integer userId) {
        return topicDao.queryTopicTitle(userId);
    }

    @Override
    public int insertContain(Topic topic) {
        return topicDao.insertContain(topic);
    }

    @Override
    public int queryUserId(String userName) {
        return topicDao.queryUserId(userName);
    }

    @Override
    public String queryTitle(Integer userId) {
        return topicDao.queryTitle(userId);
    }

    @Override
    public List<Topic> detailContent(Integer topicId) {
        return topicDao.detailContent(topicId);
    }

    @Override
    public int queryTopicId(String title) {
        return topicDao.queryTopicId(title);
    }

    @Override
    public int removeTopic(Topic topic) {
        return topicDao.removeTopic(topic);
    }

    @Override
    public int updateClick(Integer topicId) {
        return topicDao.updateClick(topicId);
    }

    @Override
    public List<Topic> adminToTopic() {
        return topicDao.adminToTopic();
    }

    @Override
    public int makeSure(Topic topic) {
        return topicDao.makeSure(topic);
    }

    @Override
    public int canxel(Topic topic) {
        return topicDao.canxel(topic);
    }

    @Override
    public List<Topic> queryGood(Integer good) {
        return topicDao.queryGood(good);
    }


//    @Override
//    public List<Topic> queryTopicReply(String personName) {
//        return topicDao.queryTopicReply(personName);
//    }
}
