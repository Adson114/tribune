package com.hz.service;

import com.hz.bean.Topic;

import java.util.Date;
import java.util.List;

public interface ITopicService {
    List<Topic> queryContent();

    List<Topic> queryTabSon(Integer tabId);

    List<Topic> queryTopicTitle(Integer userId);

    int insertContain(Topic topic);

    int queryUserId(String userName);

    String queryTitle(Integer userId);

    List<Topic> detailContent(Integer topicId);

    int queryTopicId(String title);

    int removeTopic(Topic topic);

    int updateClick(Integer topicId);

    List<Topic>adminToTopic();

    int makeSure(Topic topic);

    int canxel(Topic topic);

    List<Topic>queryGood(Integer good);
}
