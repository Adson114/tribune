package com.hz.dao;

import com.hz.bean.Topic;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ITopicDao {
    List<Topic> queryContent();

    List<Topic> queryTabSon(@Param(value = "tabId") Integer tabId);

    List<Topic> queryTopicTitle(@Param(value = "userId") Integer userId);

    int insertContain(Topic topic);

    int queryUserId(String userName);

    String queryTitle(@Param(value = "userId") Integer userId);

    List<Topic> detailContent(@Param(value = "topicId") Integer topicId);

    int queryTopicId(@Param(value = "title") String title);

    int removeTopic(Topic topic);

    int updateClick(@Param(value = "topicId")Integer topicId);

    List<Topic>adminToTopic();

    int makeSure(Topic topic);

    int canxel(Topic topic);

    List<Topic>queryGood(@Param(value = "good")Integer good);

}
